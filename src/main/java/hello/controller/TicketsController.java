package hello.controller;


import hello.domain.*;
import hello.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Map;

@Controller
//@PreAuthorize("hasAuthority('ADMIN')")
public class TicketsController {

    @Autowired
    private TicketsRepository ticketRepository;

    @Autowired
    private ReviewRepository reviewDetailsRepository;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private AmusementRepository amusementRepository;


    @GetMapping("/tickets")
    public String tickets(HttpServletRequest request, Model model) {
        Principal principal = request.getUserPrincipal();
        model.addAttribute("usernamet", principal.getName());
        return "tickets";
    }


    @GetMapping("/menu")
    public String menu(HttpServletRequest request, Map<String, Object> model) {
        Principal principal = request.getUserPrincipal();
        model.put("usernamet", principal.getName());
        ArrayList<ListTickets> result = new ArrayList<>();
        Amusement temp = new Amusement();
        Iterable<Tickets> ticketsIterable = ticketRepository.findAll();
        for (Tickets i : ticketsIterable) {
            ListTickets tmp = new ListTickets();
            tmp.setAge(i.getAge());
            tmp.setCost(String.valueOf(i.getCost()));
            tmp.setNameTicket(i.getNameTicket());
            tmp.setSale(String.valueOf(i.getSale()));
            int check = i.getZone();
            temp = amusementRepository.findOneByAmusementId(check);
            tmp.setTime(String.valueOf(i.getTime()));
            tmp.setZone(temp.getDepartment());
            tmp.setTicketId(String.valueOf(i.getTicketId()));
            result.add(tmp);
        }
        model.put("tickets", result);
        return "menu";
    }

    @GetMapping("/orders/{id}")
    public String editOrder(@PathVariable String id)
    {
        System.out.println(id);
        return "menu";
    }

    @GetMapping("/orders")
    public String orders(HttpServletRequest request,  Map<String, Object>  model) {
        //получаем username текущего пользователя
        Principal principal = request.getUserPrincipal();
        String name_user = principal.getName();
        model.put("usernamet", principal.getName());

        ArrayList<TableOrders> result = new ArrayList<>();

        int id, current_id;
        Tickets id_ticket;
        User id_user, current_user;

        //получение айди текущего пользователя
        current_user = userRepo.findByUsername(name_user);
        current_id = current_user.getId().intValue();

        Iterable<Orders> ordersIterable = orderRepository.findAll();
        for (Orders i : ordersIterable) {
            TableOrders temp = new TableOrders();
            id_ticket = i.getId_ticket();
            id_user = i.getId_user();
            if (id_user.getId().intValue() == current_id) {

                temp.setId(String.valueOf(id_ticket.getTicketId()));
                temp.setType(id_ticket.getNameTicket());
                if (id_ticket.getCost() != 0) {
                    temp.setCost(String.valueOf(id_ticket.getCost() - (id_ticket.getCost() / 100 * id_ticket.getSale())));
                } else {
                    temp.setCost(String.valueOf(id_ticket.getCost()));
                }
                temp.setDate(i.getDate());
                temp.setTimes(i.getTime());
                result.add(temp);
            }
        }
        model.put("table", result);
        return "orders";
    }

    @RequestMapping(value = "/addorder", method = RequestMethod.POST)
    public String addOrder(@RequestParam String login, String id, @RequestParam(value = "date") String date, @RequestParam(value = "time") String time, Map<String, Object> model) {
        saveOrderDetails(login, id, date, time);
        //сделать переход на страницу с заказами!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        return "redirect:/orders";
    }

    private void saveOrderDetails(String login, String id, String date, String time) {
        User find_user = new User();
        if (login != null && !login.isEmpty()) {
            find_user = userRepo.findByUsername(login);
        }
        Tickets find_ticket = new Tickets();
        if (id != null && !id.isEmpty()) {
            int find_id = Integer.parseInt(id);
            find_ticket = ticketRepository.findOneByTicketId(find_id);
        }
        Orders orders_item = new Orders();
        orders_item.setDate(date);
        orders_item.setTime(time);
        orders_item.setId_ticket(find_ticket);
        orders_item.setId_user(find_user);
        orderRepository.save(orders_item);
    }


}

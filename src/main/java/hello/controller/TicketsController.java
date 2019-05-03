package hello.controller;


import hello.domain.Orders;
import hello.domain.Review;
import hello.domain.Tickets;
import hello.domain.User;
import hello.repos.OrderRepository;
import hello.repos.ReviewRepository;
import hello.repos.TicketsRepository;
import hello.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class TicketsController {

    @Autowired
    private TicketsRepository ticketRepository;

    @Autowired
    private ReviewRepository reviewDetailsRepository;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/tickets")
    public String tickets(HttpServletRequest request, Model model) {
        Principal principal = request.getUserPrincipal();
        model.addAttribute("usernamet", principal.getName());
        return "tickets";
    }

    @RequestMapping(value = "/addticket", method = RequestMethod.POST)
    public String order(@RequestParam String cost, @RequestParam String name, @RequestParam String age,
                        @RequestParam String time, @RequestParam String zone, @RequestParam String sale, Map<String, Object> model) {
        Tickets n = new Tickets();
        double dnum = Double.parseDouble(cost);
        n.setCost(dnum);
        n.setNameTicket(name);
        n.setAge(age);
        int intnum = Integer.parseInt(time);
        n.setTime(intnum);
        n.setZone(zone);
        if (sale != "")
        {

            dnum = Double.parseDouble(sale);
            n.setSale(dnum);
        }
        ticketRepository.save(n);
        Iterable<Tickets> ticketsIterable = ticketRepository.findAll();
        model.put("tickets", ticketsIterable);
        return "menu";
    }

    @GetMapping("/menu")
    public String menu(HttpServletRequest request, Map<String, Object> model) {
        Principal principal = request.getUserPrincipal();
        model.put("usernamet", principal.getName());
        Iterable<Tickets> ticketsIterable = ticketRepository.findAll();
        model.put("tickets", ticketsIterable);
        return "menu";
    }

    @GetMapping("/orders")
    public String orders(HttpServletRequest request, Map<String, Object> model) {
        Principal principal = request.getUserPrincipal();
        model.put("usernamet", principal.getName());
        Iterable<Review> usersIterable = reviewDetailsRepository.findAll();
        model.put("orders", usersIterable);
        return "orders";
    }

    @RequestMapping(value = "/addorder", method = RequestMethod.POST)
    public String addOrder(@RequestParam String login, String id,  Map<String, Object> model) {
        saveOrderDetails(login, id);
//сделать переход на страницу с заказами!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        Iterable<Orders> ordersIterable = orderRepository.findAll();
        for(Orders i : ordersIterable) {
//
        }
        model.put("orders", usersIterable);
        return "orders";
    }

    private void saveOrderDetails(String login, String id)
    {
        User find_user =  new User();
        if (login != null && !login.isEmpty()) {
            find_user = userRepo.findByUsername(login);
        }
        Tickets find_ticket = new Tickets();
        if (id != null && !id.isEmpty()) {
            int find_id = Integer.parseInt(id);
            find_ticket = ticketRepository.findOneByTicketId(find_id);
        }
        Orders orders_item = new Orders();
        orders_item.setDate(new Date());
        orders_item.setId_ticket(find_ticket);
        orders_item.setId_user(find_user);
        orderRepository.save(orders_item);
    }


}

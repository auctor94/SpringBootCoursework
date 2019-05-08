package hello.controller;


import hello.domain.Amusement;
import hello.domain.Orders;
import hello.domain.Tickets;
import hello.repos.AmusementRepository;
import hello.repos.OrderRepository;
import hello.repos.TicketsRepository;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.transaction.Transaction;
import java.util.List;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class OperationsController {


    @Autowired
    private TicketsRepository ticketRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private AmusementRepository amusementRepository;

    @RequestMapping(value = "/addticket", method = RequestMethod.POST)
    public String order(@RequestParam String cost, @RequestParam String name, @RequestParam String age,
                        @RequestParam String time, @RequestParam String zone, @RequestParam String sale, Map<String, Object> model) {
        Tickets n = new Tickets();
        Amusement a;
        double dnum = Double.parseDouble(cost);
        n.setCost(dnum);
        n.setNameTicket(name);
        n.setAge(age);
        int intnum = Integer.parseInt(time);
        n.setTime(intnum);
        a = amusementRepository.findOneByDepartment(zone);
        n.setZone(a);
        if (sale != "") {

            dnum = Double.parseDouble(sale);
            n.setSale(dnum);
        }
        ticketRepository.save(n);
        Iterable<Tickets> ticketsIterable = ticketRepository.findAll();
        model.put("tickets", ticketsIterable);
        return "menu";
    }

    @GetMapping("/editticket/{ticket}")
    public String editOrder(@PathVariable String ticket, Model model)
    {
        Tickets ticketsIterable = ticketRepository.findOneByTicketId(Integer.parseInt(ticket));
        model.addAttribute("ticket", ticketsIterable);
//изменяем заказ сохраняем и все

        return "editticket";
    }

    @RequestMapping(value = "/ticketedit", method = RequestMethod.POST)
    public String ordersEdit(@RequestParam String cost, @RequestParam String name, @RequestParam String age,
                             @RequestParam String time, @RequestParam String zone, @RequestParam String sale, Map<String, Object> model, @RequestParam("orderID") String ticket) {
        Tickets current = ticketRepository.findOneByTicketId(Integer.parseInt(ticket));
        Amusement a;
        double dnum = Double.parseDouble(cost);
        current.setCost(dnum);
        current.setNameTicket(name);
        current.setAge(age);
        int intnum = Integer.parseInt(time);
        current.setTime(intnum);
        a = amusementRepository.findOneByDepartment(zone);
        current.setZone(a);
        if (sale != "") {

            dnum = Double.parseDouble(sale);
            current.setSale(dnum);
        }
        ticketRepository.save(current);
        return "redirect:/menu";
    }

    @RequestMapping(value = "/ticketdelete", method = RequestMethod.POST)
    public String ordersDelete(@RequestParam("orderID") String ticket) {
        Tickets current = ticketRepository.findOneByTicketId(Integer.parseInt(ticket));
        System.out.println(current.getTicketId());

       List<Orders> result = orderRepository.findOrdersById_ticket(current.getTicketId());
        System.out.println(result.size());
            // your code end
            //ticketRepository.delete(current);
            return "redirect:/orders";

    }



}

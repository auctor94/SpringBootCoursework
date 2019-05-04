package hello.controller;

import hello.domain.Orders;
import hello.domain.Role;
import hello.domain.Tickets;
import hello.domain.User;
import hello.repos.OrderRepository;
import hello.repos.TicketsRepository;
import hello.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private TicketsRepository ticketRepository;

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users",userRepo.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
                           @RequestParam("userID") User user) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
        return "redirect:/user";
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
        if (sale != "") {

            dnum = Double.parseDouble(sale);
            n.setSale(dnum);
        }
        ticketRepository.save(n);
        Iterable<Tickets> ticketsIterable = ticketRepository.findAll();
        model.put("tickets", ticketsIterable);
        return "menu";
    }




}

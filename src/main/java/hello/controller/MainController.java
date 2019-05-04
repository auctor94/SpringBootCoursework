package hello.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import hello.domain.*;
import hello.repos.ReviewRepository;
import hello.repos.TicketsRepository;
import hello.repos.UserRepo;
import hello.repos.UsrRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.security.krb5.internal.Ticket;

import javax.servlet.http.HttpServletRequest;
import java.io.StringWriter;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {

@Autowired
private UsrRepository userRepository;


@Autowired
private UserRepo userRepo;

    @Autowired
    private Configuration configuration;

    @Autowired
    private ReviewRepository reviewDetailsRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        User rev;
        ArrayList<ListReviews> result = new ArrayList<>();
        Iterable<Review> reviewsIterable = reviewDetailsRepository.findAll();
        for (Review i : reviewsIterable) {
            rev = userRepo.findOneById(i.getIdUser().getId());
            String pattern = "YYYY/MM/dd HH:mm:ss";
            DateFormat df = new SimpleDateFormat(pattern);
            String todayAsString = df.format(i.getDate());
            result.add(new ListReviews(rev.getUsername(),i.getComment(),todayAsString));
        }
        model.put("reviews",result);
        return "index";
    }

//вынести в отдельный метод!!!!!!!!!!!!!!!
    @GetMapping("/index")
    public String index(Map<String, Object> model) {
        User rev;
        ArrayList<ListReviews> result = new ArrayList<>();
        Iterable<Review> reviewsIterable = reviewDetailsRepository.findAll();
        for (Review i : reviewsIterable) {
            rev = userRepo.findOneById(i.getIdUser().getId());
            String pattern = "YYYY/MM/dd HH:mm:ss";
            DateFormat df = new SimpleDateFormat(pattern);
            String todayAsString = df.format(i.getDate());
            result.add(new ListReviews(rev.getUsername(),i.getComment(),todayAsString));
        }
        model.put("reviews",result);
        return "index";
    }

    @GetMapping("/gallery")
    public String gallery(HttpServletRequest request,Model model ) {
        Principal principal = request.getUserPrincipal();
        model.addAttribute("usernamet", principal.getName());
        return "gallery";
    }





    @RequestMapping(value = "/order", method = RequestMethod.POST)
public String order(@RequestParam String login, String comment,  Map<String, Object> model) {
        saveReviewDetails(login,comment);
        return "redirect:/index";
    }


    @GetMapping("/contactus")
    public String contact() {
        return "contactus";
    }

    @GetMapping("/time")
    public String time() {
        return "time";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false,defaultValue = "") String filter, Model model) {
        Iterable<Users> usersIterable;
        if (filter != null && !filter.isEmpty()) {
            usersIterable = userRepository.findByStatus(filter);
        }
        else {
            usersIterable = userRepository.findAll();
        }
        model.addAttribute("users", usersIterable);
            model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main") // Map ONLY Post Requests
    public  String addNewUser(@RequestParam String login,@RequestParam String password, @RequestParam String status, Map<String, Object> model) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        Users n = new Users();
        n.setPassword(password);
        n.setName(login);
        n.setStatus(status);
        userRepository.save(n);
        Iterable<Users> usersIterable = userRepository.findAll();
        model.put("users", usersIterable);
        return "main";
    }


    public void saveReviewDetails(String login, String comment) {
        User find_user =  new User();
        if (login != null && !login.isEmpty()) {
            find_user = userRepo.findByUsername(login);
        }
        Review ud = new Review();
        ud.setComment(comment);
        ud.setDate(new Date());
         ud.setIdUser(find_user);
         reviewDetailsRepository.save(ud);
    }




//    @PostMapping("filter")// Map ONLY Post Requests
//    public  String filter(@RequestParam String filter, Map<String, Object> model) {
//        Iterable<Users> usersList;
//
//        if (filter != null && !filter.isEmpty()) {
//            usersList = userRepository.findByStatus(filter);
//        }
//        else {
//            usersList = userRepository.findAll();
//        }
//        model.put("users", usersList);
//        return "main";
//    }

}
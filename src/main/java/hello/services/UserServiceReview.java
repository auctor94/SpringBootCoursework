package hello.services;

import hello.domain.Review;
import hello.domain.Users;
import hello.repos.ReviewRepository;
import hello.repos.UsrRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Date;

@Controller
public class UserServiceReview {
    @Autowired
    private ReviewRepository userDetailsRepository;


    @Autowired
    private UsrRepository userRepository;


}

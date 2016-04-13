package com.jekainfinity.controllers;

import com.jekainfinity.dao.HotelDaoImpl;
import com.jekainfinity.dao.UserDaoImpl;
import com.jekainfinity.entity.Hotel;
import com.jekainfinity.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/user**")
public class UserController {
    @Autowired
    private UserDaoImpl userDao;

    @Autowired
    private HotelDaoImpl hotelDao;

    @RequestMapping(value = "/page")
    public ModelAndView adminPage(Principal principal) {
        ModelAndView mav = new ModelAndView();
        User user = userDao.findUserByUsername(principal.getName());

        mav.addObject("realName", user.getUserInform().getName() + " " + user.getUserInform().getSureName()
                + " " + user.getUserInform().getPatronymic());
        mav.addObject("phoneNumber", user.getUserInform().getPhoneNumber());
        mav.addObject("e_mail", user.getUserInform().getEmail());
        mav.addObject("describe", user.getUserInform().getInformation());

        mav.setViewName("userPage");
        return mav;
    }

    @RequestMapping(value = "/editProfile", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView editProfile() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("addSomeInformationUser");
        return mav;
    }

    @RequestMapping(value = "/editProfile", method = {RequestMethod.POST, RequestMethod.HEAD})
    public String editProfilePost(@RequestParam String describe, Principal principal) {
        User user = userDao.findUserByUsername(principal.getName());
        user.getUserInform().setInformation(describe);

        userDao.saveUser(user);
        return "redirect:/user/page";
    }


}

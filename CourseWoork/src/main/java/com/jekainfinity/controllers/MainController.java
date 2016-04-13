package com.jekainfinity.controllers;

import com.jekainfinity.dao.HotelDaoImpl;
import com.jekainfinity.dao.UserDaoImpl;
import com.jekainfinity.entity.*;
import javafx.scene.effect.SepiaTone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.print.Book;
import java.beans.PropertyEditorSupport;
import java.io.OutputStream;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MainController {
    @Autowired
    private UserDaoImpl userDao;

    @Autowired
    private HotelDaoImpl hotelDao;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String mainPage() {
        return "mainPage";
    }

    @RequestMapping(value = "/reg", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String registration() {
        return "registrationPage";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView loginForm() {
        ModelAndView model = new ModelAndView();
        model.setViewName("loginPage");
        return model;
    }

    @RequestMapping(value = "/registration", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String regForm() {
        return "registrationPage";
    }

    @RequestMapping(value = "/registration", method = {RequestMethod.POST, RequestMethod.HEAD})
    public ModelAndView regFormAdd(String username, String name, String patronymic, String sureName,
                             String phoneNumber, String password, Boolean admin, String email) {

        ModelAndView mav = new ModelAndView();
        User user = new User();
        UserInform userInform = new UserInform();

        /*fill user entity*/
        user.setUsername(username);
        user.setPassword(password);

        /*fill userInform object*/
        userInform.setName(name);
        userInform.setSureName(sureName);
        userInform.setPatronymic(patronymic);
        userInform.setEmail(email);
        userInform.setPhoneNumber(phoneNumber);
        userInform.setInformation(null);

        /*verify admin checkbox and set Role*/
        serviceReg(admin, user);

        /*set some userInform to user object*/
        userInform.setUserId(user);
        user.setUserInform(userInform);

        /*Save User*/
        userDao.saveUser(user);
        mav.setViewName("mainPage");
        return mav;
    }

    /*Method that add role and verify admin checkbox*/
    private void serviceReg(Boolean admin, User user){

        Set<User> users = new HashSet<User>();
        Set<Role> roles = new HashSet<Role>();

        if (admin != null) {
            users.add(user);
            roles.add(new Role("ROLE_ADMIN", users));

            user.setAdmin(true);
            user.setRoles(roles);
        }

        if (admin == null) {
            users.add(user);
            roles.add(new Role("ROLE_USER", users));

            user.setAdmin(false);
            user.setRoles(roles);
        }
    }

    @RequestMapping(value = "/viewHotel/{hotelId}", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView viewHotel(@PathVariable Integer hotelId) {
        ModelAndView mav = new ModelAndView();
        Hotel hotel = hotelDao.findHotelByHotelId(hotelId);

        mav.addObject("address", hotel.getHotelInform().getCountry() + " " + hotel.getHotelInform().getTown()
                + " " + hotel.getHotelInform().getAddress() );
        mav.addObject("admin", hotel.getUserId().getUsername());
        mav.addObject("hotelDescribe",hotel.getHotelInform().getDescribe());
        mav.addObject("hotelId", hotelId);
        mav.addObject("photoList", hotelDao.getByteByHotelId(hotel.getHotelId()));
        mav.setViewName("hotelPage");

        return mav;
    }

    /*Image displaying*/
    @RequestMapping(value = "/image/{img}/{hotelId}")
    @ResponseBody
    public void displayImg(HttpServletResponse response,@PathVariable int img,@PathVariable Integer hotelId){
        OutputStream oImage;
        PhotoHotel photoHotel = hotelDao.getImageByteById(img, hotelId);
        try{
            byte[] imageInByte = photoHotel.getPhotoByte(); // get image in byte array;
            response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            oImage=response.getOutputStream();
            oImage.write(imageInByte);
            oImage.flush();
            oImage.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/searchHotels", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView searchHotel(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("searchHotelPage");
        return modelAndView;
    }

    @RequestMapping(value = "/searchHotels/{pageNumber}", method = {RequestMethod.POST, RequestMethod.HEAD})
    public ModelAndView searchHotelPost(String hotelName, String countryHotel, String townHotel,
                                        Integer hotelStars,@PathVariable Integer pageNumber ){
        int resOnPage = 5;
        ModelAndView mav = new ModelAndView();
        Hotel hotel = hotelDao.findHotelByHotelname(hotelName);
        List<Hotel> listOnPage = new ArrayList<>();
        List<Hotel> listOfHotel = new ArrayList<>();

        listOfHotel = defineList( hotelName,countryHotel,townHotel,hotelStars);
        if (listOfHotel.size()<=resOnPage){
            mav.addObject("hotelList",listOfHotel);
            mav.addObject("resOnPage",listOfHotel.size());
            mav.addObject("pageNumber",pageNumber);
            mav.setViewName("searchResult");
            return mav;
        }

        for(int i = (resOnPage*pageNumber);i<=(resOnPage*pageNumber + resOnPage); i++){
            listOnPage.add(listOfHotel.get(i));
        }

        mav.addObject("hotelList",listOnPage);
        mav.addObject("countOfPage",countOfPage(listOfHotel.size(),resOnPage));
        mav.addObject("resOnPage",resOnPage);
        mav.addObject("pageNumber",pageNumber);

        mav.setViewName("searchResult");

        return mav;

    }

    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping(value = "/roomsList/{hotelId}")
    public ModelAndView booking(Principal principal,@PathVariable Integer hotelId){
        ModelAndView modelAndView = new ModelAndView();
        List<Room> rooms = hotelDao.findRoomsByHotelID(hotelId);
        modelAndView.addObject("hotelname", hotelDao.findHotelByHotelId(hotelId).getNameHotel());
        modelAndView.addObject("rooms", rooms);
        modelAndView.setViewName("roomsList");
        return modelAndView;
    }


    /*define the list of result of search*/
    private List<Hotel> defineList(String hotelName, String countryHotel, String townHotel,
                                   Integer hotelStars){
        List<Hotel> listOfHotel = new ArrayList<>();

        if(hotelName != null){
            listOfHotel.add(hotelDao.findHotelByHotelname(hotelName));
            return listOfHotel;
        }

        if((!countryHotel.equals("")) && (townHotel.equals("")) && (hotelStars != null) ){
            listOfHotel = hotelDao.findHotelByCountry(countryHotel,hotelStars);
            return listOfHotel;
        }

        if((!countryHotel.equals("")) && (!townHotel.equals("")) && (hotelStars != null)){
            listOfHotel = hotelDao.findHotelByTown(countryHotel,townHotel, hotelStars);
            return listOfHotel;
        }

        return null;
    }

    private int countOfPage(int size,int resOnPage){
        return size/resOnPage;
    }

}

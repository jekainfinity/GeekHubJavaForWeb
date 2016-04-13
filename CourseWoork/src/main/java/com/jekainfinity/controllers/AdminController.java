package com.jekainfinity.controllers;

import com.jekainfinity.dao.HotelDaoImpl;
import com.jekainfinity.dao.UserDaoImpl;
import com.jekainfinity.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping(value = "/admin**")
public class AdminController {
    @Autowired
    private UserDaoImpl userDao;

    @Autowired
    private HotelDaoImpl hotelDao;

    @RequestMapping(value = {"/page","/"})
    public ModelAndView adminPage(Principal principal) {
        ModelAndView mav = new ModelAndView();
        User user = userDao.findUserByUsername(principal.getName());

        mav.addObject("realName", user.getUserInform().getName() + " " + user.getUserInform().getSureName()
                        + " " + user.getUserInform().getPatronymic());
        mav.addObject("phoneNumber", user.getUserInform().getPhoneNumber());
        mav.addObject("e_mail", user.getUserInform().getEmail());
        mav.addObject("describe", user.getUserInform().getInformation());

        mav.setViewName("adminPage");
        return mav;
    }

    /*Add information about user/admin*/
    @RequestMapping(value = "/editProfile", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView editProfile() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("addSomeInformationAdmin");
        return mav;
    }

    @RequestMapping(value = "/editProfile", method = {RequestMethod.POST, RequestMethod.HEAD})
    public String editProfilePost(@RequestParam String describe, Principal principal) {
        User user = userDao.findUserByUsername(principal.getName());
        user.getUserInform().setInformation(describe);

        userDao.saveUser(user);
        return "redirect:/admin/page";
    }


    /*Add hotel from admin*/
    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/addHotel", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView addHotel() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("addHotelPage");
        return mav;
    }
    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/addHotel", method = {RequestMethod.POST, RequestMethod.HEAD})
    public String addHotelPost(@RequestParam String hotelName,@RequestParam String countryHotel,@RequestParam String townHotel,
                               @RequestParam("addressHotel") String addressHotel,@RequestParam int hotelStars,@RequestParam String describe,
                               @RequestParam("file") MultipartFile[] hotelPhoto, Principal principal) {
        User user = userDao.findUserByUsername(principal.getName());
        Hotel hotel = new Hotel();
        HotelInform hotelInform = new HotelInform();

        Set<Hotel> hotels = new HashSet<>(hotelDao.listHotelByUserID(user.getUserId()));
        Set<PhotoHotel> photoHotels = new HashSet<PhotoHotel>();

        /*Set hotel properties*/
        hotel.setNameHotel(hotelName);

        /*Set owner id of hotel which equals the id of streamed/(logined) user*/
        hotel.setUserId(user);

        /*Set userInform prop*/
        hotelInform.setCountry(countryHotel);
        hotelInform.setTown(townHotel);
        hotelInform.setAddress(addressHotel);
        hotelInform.setStars(hotelStars);
        hotelInform.setDescribe(describe);
        hotelInform.setHotelId(hotel);

        /*Set PhotoHotels Set*/
        if (hotelPhoto != null) {
            for (MultipartFile file : hotelPhoto) {
                if (!file.isEmpty()) {
                    try {
                        photoHotels.add(new PhotoHotel(hotel, file.getBytes()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        /*Set photo hotels at hotel obj*/
        hotel.setPhotoHotels(photoHotels);

        /*Set hotel Inform to the hotel*/
        hotel.setHotelInform(hotelInform);

        /* Fill user HotelSet*/
        hotels.add(hotel);
        user.setHotels(hotels);

        /*save user by all relations*/
        userDao.saveUser(user);
        return "redirect:/admin/page";
    }

    @RequestMapping(value = "/listOfHotel/{pageNumber}", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView listOfHotel(Principal principal,@PathVariable("pageNumber") int pageNumber) {
        int resOnPage = 5;
        ModelAndView mav = new ModelAndView();
        User user = userDao.findUserByUsername(principal.getName());

        List<Hotel> listOnPage = new ArrayList<>();
        List<Hotel> listOfHotel = hotelDao.listHotelByUserID(user.getUserId());

        /*Fill mav when list of hotel less the resOnPage*/
        if (listOfHotel.size()<=resOnPage){

            mav.addObject("hotelList",listOfHotel);
            mav.addObject("resOnPage",listOfHotel.size());
            mav.addObject("pageNumber",pageNumber);

            mav.setViewName("HotelAdminList");
            return mav;
        }

        /*Fill mav when list of hotel more the resOnPage*/
        for(int i = (resOnPage*pageNumber);i<=(resOnPage*pageNumber + resOnPage); i++){
            listOnPage.add(listOfHotel.get(i));
        }

        mav.addObject("hotelList",listOnPage);
        mav.addObject("countOfPage",countOfPage(listOfHotel.size(),resOnPage));
        mav.addObject("resOnPage",resOnPage);
        mav.addObject("pageNumber",pageNumber);

        mav.setViewName("HotelAdminList");
        return mav;
    }


    @RequestMapping(value = "/addRoom/{hotelId}", method = {RequestMethod.GET, RequestMethod.HEAD})
    public ModelAndView addRoom(@PathVariable Integer hotelId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("hotelId", hotelId);
        modelAndView.setViewName("addRoomPage");
        return modelAndView;
    }

    @RequestMapping(value = "/addRoom/{hotelId}", method = {RequestMethod.POST, RequestMethod.HEAD})
    public String addRoomPost(@PathVariable Integer hotelId, Integer roomNumber, String roomType,
                                    Integer roomPrice){
        Room room = new Room();
        Hotel hotel = hotelDao.findHotelByHotelId(hotelId);
        Set<Room> rooms = new HashSet<>(hotelDao.findRoomsByHotelID(hotel.getHotelId()));

        /*fill room property*/
        room.setHotelId(hotel);
        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setRoomPrice(roomPrice);

        /*save room into hotel*/
        rooms.add(room);
        hotel.setRooms(rooms);

        hotelDao.saveHotel(hotel);
        return "redirect:"+hotelId;
    }

    private int countOfPage(int size,int resOnPage){
        return size/resOnPage;
    }

}

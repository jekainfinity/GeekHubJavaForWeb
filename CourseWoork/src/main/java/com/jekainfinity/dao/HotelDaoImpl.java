package com.jekainfinity.dao;

import com.jekainfinity.entity.Hotel;
import com.jekainfinity.entity.PhotoHotel;
import com.jekainfinity.entity.Room;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Component
public class HotelDaoImpl implements HotelDaoInterface{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveHotel(Hotel hotel){
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(hotel);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }

    @Override
    public List<Hotel> listHotelByUserID(int userId){
        Session session = sessionFactory.openSession();
        List list = new ArrayList<>();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Hotel.class);
            criteria.add(Restrictions.eq("userId.userId",userId));
            list = criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public Hotel findHotelByHotelname(String nameHotel){
        Session session = sessionFactory.openSession();
        Hotel hotel = new Hotel();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Hotel.class);
            criteria.add(Restrictions.eq("nameHotel",nameHotel));
            hotel = (Hotel) criteria.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return hotel;
    }

    @Override
    public Hotel findHotelByHotelId(Integer hotelId){
        Session session = sessionFactory.openSession();
        Hotel hotel = new Hotel();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Hotel.class);
            criteria.add(Restrictions.eq("hotelId",hotelId));
            hotel = (Hotel) criteria.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return hotel;
    }

    @Override
    public List<PhotoHotel> getByteByHotelId(int hotelId){
        Session session = sessionFactory.openSession();
        List photoHotels = new ArrayList<>();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(PhotoHotel.class);
            criteria.add(Restrictions.eq("hotelId.hotelId",hotelId));
            photoHotels = criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return photoHotels;
    }
    @Override
    public PhotoHotel getImageByteById(int imageId, int hotelId){
        Session session = sessionFactory.openSession();
        PhotoHotel photoHotel;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(PhotoHotel.class);
            criteria.add(Restrictions.eq("hotelPhotoId",imageId));
            criteria.add(Restrictions.eq("hotelId.hotelId",hotelId));
            photoHotel = (PhotoHotel) criteria.uniqueResult();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return photoHotel;
    }

    @Override
    public List<Hotel> findHotelByCountry(String country,Integer stars){
        Session session = sessionFactory.openSession();
        List hotels = new ArrayList<>();
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Hotel.class);
            criteria.createAlias("hotelInform","h_alias");
            criteria.add(Restrictions.eq("h_alias.country", country));
            criteria.add(Restrictions.eq("h_alias.stars",stars));
            hotels = criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return hotels;
    }

    @Override
    public List<Hotel> findHotelByTown(String country,String town,Integer stars){
        Session session = sessionFactory.openSession();
        List hotels;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Hotel.class);
            criteria.createAlias("hotelInform","h_alias");
            criteria.add(Restrictions.eq("h_alias.country",country));
            criteria.add(Restrictions.eq("h_alias.stars",stars));
            criteria.add(Restrictions.eq("h_alias.town",town));
            hotels =  criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        return hotels;
    }

    @Override
    public void saveRooms(Room room){
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(room);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }

/*
    @Override
    public void booking(BookHotel bookHotel){
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(bookHotel);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }

*/
    @Override
    public Room findRoomByHotelID(int hotelId, Integer size){
        Session session = sessionFactory.openSession();
        Room room ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Room.class);
            criteria.add(Restrictions.eq("hotel.hotelId", hotelId));
            criteria.add(Restrictions.eq("roomInFlat", size));
            room = (Room) criteria.list().get(0);
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return room;
    }

    @Override
    public List<Room> findRoomsByHotelID(int hotelId){
        Session session = sessionFactory.openSession();
        List rooms ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Room.class);
            criteria.add(Restrictions.eq("hotelId.hotelId", hotelId));
            rooms =  criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return rooms;
    }

/*
    @Override
    public List<BookHotel> findBookHotelByUserId(int userId){
        Session session = sessionFactory.openSession();
        List bookHotels ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Room.class);
            criteria.add(Restrictions.eq("user.userId", userId));
            bookHotels =  criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return bookHotels;
    }

*/
    @Override
    public Room findRoomByRoomId(int roomId){
        Session session = sessionFactory.openSession();
        Room room;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Room.class);
            criteria.add(Restrictions.eq("roomId", roomId));
            room = (Room) criteria.uniqueResult();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return room;
    }

/*
    @Override
    public List<BookHotel> getBookingListByRoomSize(Integer roomSize,String hotelName){
        Session session = sessionFactory.openSession();
        List bookHotels;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(BookHotel.class);
            criteria.add(Restrictions.eq("hotel.nameHotel", hotelName));
            criteria.add(Restrictions.eq("roomSize", roomSize));
            bookHotels = criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return bookHotels;
    }
*/

/*
    @Override
    public List<BookHotel> getBookingListByUsername(String username){
        Session session = sessionFactory.openSession();
        List bookHotels;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(BookHotel.class);
            criteria.add(Restrictions.eq("user.username", username));
            bookHotels = criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return bookHotels;
    }
*/
}

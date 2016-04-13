package com.jekainfinity.dao;

import com.jekainfinity.entity.Hotel;
import com.jekainfinity.entity.PhotoHotel;
import com.jekainfinity.entity.Room;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

public interface HotelDaoInterface {
    public void saveHotel(Hotel hotel);
    public List<Hotel> listHotelByUserID(int userId);
    public Hotel findHotelByHotelId(Integer hotelId);
    public Hotel findHotelByHotelname(String nameHotel);
    public Room findRoomByRoomId(int roomId);
    public List<PhotoHotel> getByteByHotelId(int hotelId);
    public PhotoHotel getImageByteById(int imageId, int hotelId);
    public List<Room> findRoomsByHotelID(int hotelId);
    public List<Hotel> findHotelByCountry(String country,Integer stars);
    public List<Hotel> findHotelByTown(String country,String town,Integer stars);
    public void saveRooms(Room room);
    public Room findRoomByHotelID(int id, Integer size);
}

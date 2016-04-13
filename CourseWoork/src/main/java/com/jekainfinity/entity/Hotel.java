package com.jekainfinity.entity;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "HOTEL")
public class Hotel {
    @Id
    @Column(name = "HOTEL_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int hotelId;
    @Column(name = "HOTEL_NAME")
    private String nameHotel;

    @ManyToOne()
    @JoinColumn(name = "USER_ID")
    private User userId;

    @OneToOne(mappedBy = "hotelId", cascade = CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private HotelInform hotelInform;

    @OneToMany(mappedBy = "hotelId", cascade = CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private Set<PhotoHotel> photoHotels = new HashSet<PhotoHotel>();

    @OneToMany(mappedBy = "hotelId", cascade = CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private Set<Room> rooms = new HashSet<Room>();

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getNameHotel() {
        return nameHotel;
    }

    public void setNameHotel(String nameHotel) {
        this.nameHotel = nameHotel;
    }

    public HotelInform getHotelInform() {
        return hotelInform;
    }

    public void setHotelInform(HotelInform hotelInform) {
        this.hotelInform = hotelInform;
    }

    public Set<PhotoHotel> getPhotoHotels() {
        return photoHotels;
    }

    public void setPhotoHotels(Set<PhotoHotel> photoHotels) {
        this.photoHotels = photoHotels;
    }

    public Set<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

 }
package com.jekainfinity.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "HOTEL_INFORM")
public class HotelInform implements Serializable {
    @Id
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "HOTEL_ID")
    private Hotel hotelId;
    @Column(name = "COUNTRY")
    private String country;
    @Column(name = "TOWN")
    private String town;
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "STARS")
    private int stars;
    @Column(name = "DESCRIBE_HOTEL")
    private String describe;

    public Hotel getHotelId() {
        return hotelId;
    }

    public void setHotelId(Hotel hotelId) {
        this.hotelId = hotelId;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}

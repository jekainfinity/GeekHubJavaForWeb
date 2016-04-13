package com.jekainfinity.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "HOTEL_PHOTO")
public class PhotoHotel implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "HOTEL_PHOTO_ID")
    private int hotelPhotoId;
    @ManyToOne()
    @JoinColumn(name = "HOTEL_ID")
    private Hotel hotelId;
    @Column(name = "PHOTO_BYTE")
    private byte[] photoByte;

    public PhotoHotel() {
    }

    public PhotoHotel(Hotel hotelId, byte[] photoByte) {
        this.hotelId = hotelId;
        this.photoByte = photoByte;
    }

    public int getHotelPhotoId() {
        return hotelPhotoId;
    }

    public void setHotelPhotoId(int hotelPhotoId) {
        this.hotelPhotoId = hotelPhotoId;
    }

    public Hotel getHotelId() {
        return hotelId;
    }

    public void setHotelId(Hotel hotelId) {
        this.hotelId = hotelId;
    }

    public byte[] getPhotoByte() {
        return photoByte;
    }

    public void setPhotoByte(byte[] photoByte) {
        this.photoByte = photoByte;
    }
}

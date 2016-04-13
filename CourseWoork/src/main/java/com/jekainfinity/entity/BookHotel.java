/*
package com.jekainfinity.entity;

import sun.misc.resources.Messages;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "BOOK_ROOM")
public class BookHotel implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOOKING_ID")
    private int bookingId;
    @Column(name = "DATE_LEFT")
    private Date dateLeft;
    @Column(name = "DATE_ARRIVE")
    private Date dateArrive;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "ROOM_ID")
    private Room room;

    @ManyToOne()
    @JoinColumn(name = "USER_ID")
    private User user;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "HOTEL_ID")
    //@Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    private Hotel hotel;

}
*/

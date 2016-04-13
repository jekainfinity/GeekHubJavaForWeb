package com.jekainfinity.entity;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "USER")
public class User {
    @Id
    @Column(name = "USER_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    @Column(name = "USERNAME")
    private String username;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "ADMIN")
    private boolean admin;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_ROLE_ID", joinColumns = {@JoinColumn(name = "USER_ID")},
            inverseJoinColumns = {@JoinColumn(name = "ROLE_ID")})
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    private Set<Role> roles = new HashSet<Role>();


    @OneToOne(fetch = FetchType.LAZY, mappedBy = "userId",cascade = CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private UserInform userInform;

    @OneToMany(mappedBy = "userId", cascade = CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.ALL})
    private Set<Hotel> hotels = new HashSet<Hotel>();

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public UserInform getUserInform() {
        return userInform;
    }

    public void setUserInform(UserInform userInform) {
        this.userInform = userInform;
    }

    public Set<Hotel> getHotels() {
        return hotels;
    }

    public void setHotels(Set<Hotel> hotels) {
        this.hotels = hotels;
    }

 }
package com.jekainfinity.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "USER_INFORMATION")
public class UserInform implements Serializable {
    @Id
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "USER_ID")
    private User userId;
    @Column(name = "E_MAIL")
    private String email;
    @Column(name = "NAME")
    private String name;
    @Column(name = "SURE_NAME")
    private String sureName;
    @Column(name = "PATRONYMIC")
    private String patronymic;
    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;
    @Column(name = "INFORMATION_USER")
    private String information;

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSureName() {
        return sureName;
    }

    public void setSureName(String sureName) {
        this.sureName = sureName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }
}

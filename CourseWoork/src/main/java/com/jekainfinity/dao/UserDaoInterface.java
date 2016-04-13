package com.jekainfinity.dao;

import com.jekainfinity.entity.Role;
import com.jekainfinity.entity.User;

import java.util.List;

public interface UserDaoInterface {

    public void saveUser(User user);
    public User findUserByUsername(String username);
//    public List<Messages> findMessagesByUserId(int userId);
}

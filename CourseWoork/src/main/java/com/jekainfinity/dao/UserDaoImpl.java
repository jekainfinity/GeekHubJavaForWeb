package com.jekainfinity.dao;

import com.jekainfinity.entity.*;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
public class UserDaoImpl implements UserDaoInterface {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveUser(User user){
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(user);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }

    @Override
    public User findUserByUsername(String username){

        Session session = sessionFactory.openSession();
        User user;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(User.class);
            criteria.add(Restrictions.eq("username", username));
            user = (User) criteria.uniqueResult();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return user;
    }

/*
    @Override
    public List<Messages> findMessagesByUserId(int userId){
        Session session = sessionFactory.openSession();
        List messages ;
        try {
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Messages.class);
            criteria.add(Restrictions.eq("user.userId", userId));
            messages =  criteria.list();
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        return messages;
    }
*/
}

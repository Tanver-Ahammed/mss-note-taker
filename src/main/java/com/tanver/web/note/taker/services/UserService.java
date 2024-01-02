package com.tanver.web.note.taker.services;

import com.tanver.web.note.taker.entities.User;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class UserService {

    public User getUserByEmail(Session session, String email) {
        Query query = session.createQuery("from User U where U.email = :email ");
        query.setParameter("email", email);
        return (User) query.list().get(0);
    }

}

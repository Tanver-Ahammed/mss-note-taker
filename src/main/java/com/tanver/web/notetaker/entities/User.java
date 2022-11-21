package com.tanver.web.notetaker.entities;

import javax.persistence.*;
import java.util.Random;

@Entity
@Table(name = "users")
public class User {

    @Id
    private long id;

    private String name;

    private String email;

    private String address;

    private String password;

    public User() {
    }

    public User(String name, String email, String address, String password) {
        this.id = new Random().nextInt(100000);
        this.name = name;
        this.email = email;
        this.address = address;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

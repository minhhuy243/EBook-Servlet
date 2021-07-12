package ebook.model;

import java.time.LocalDate;

public class Purchase {
    private int id;
    private User user;
    private String name;
    private String address;
    private String phoneNumber;
    private String email;
    private LocalDate createdAt;
    private int total;

    public Purchase() {
        this.id = -1;
        this.user = null;
        this.name = "";
        this.address = "";
        this.phoneNumber = "";
        this.email = "";
        this.createdAt = null;
        this.total = -1;
    }

    public Purchase(int id, User user, String name, String address, String phoneNumber, String email, LocalDate createdAt, int total) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.createdAt = createdAt;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}

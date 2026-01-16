package com.peminjamanruangan.model;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String namaLengkap;
    private String role;

    // Constructor
    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // --- GETTERS ---
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getNamaLengkap() {
        return namaLengkap;
    }

    public String getRole() {
        return role;
    }

    // --- SETTERS (INI YANG PALING PENTING UNTUK DIPERBAIKI) ---
    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username; // <-- GANTI dengan ini
    }

    public void setPassword(String password) {
        this.password = password; // <-- GANTI dengan ini
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNamaLengkap(String namaLengkap) {
        this.namaLengkap = namaLengkap;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
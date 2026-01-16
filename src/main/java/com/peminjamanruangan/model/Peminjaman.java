package com.peminjamanruangan.model;

import java.sql.Date;

public class Peminjaman {
    private int idPeminjaman;
    private User user;
    private String namaRuangan; 
    private java.sql.Date tanggal;
    private java.sql.Time jamMulai;
    private java.sql.Time jamSelesai;
    private String keperluan;
    private String status;

    // Constructor, Getter, dan Setter
    public Peminjaman() {}

    public int getIdPeminjaman() { return idPeminjaman; }
    public void setIdPeminjaman(int idPeminjaman) { this.idPeminjaman = idPeminjaman; }
    
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    
    public String getNamaRuangan() { return namaRuangan; }
    public void setNamaRuangan(String namaRuangan) { this.namaRuangan = namaRuangan; }
    
    public java.sql.Date getTanggal() { return tanggal; }
    public void setTanggal(java.sql.Date tanggal) { this.tanggal = tanggal; }
    
    public java.sql.Time getJamMulai() { return jamMulai; }
    public void setJamMulai(java.sql.Time jamMulai) { this.jamMulai = jamMulai; }
    
    public java.sql.Time getJamSelesai() { return jamSelesai; }
    public void setJamSelesai(java.sql.Time jamSelesai) { this.jamSelesai = jamSelesai; }
    
    public String getKeperluan() { return keperluan; }
    public void setKeperluan(String keperluan) { this.keperluan = keperluan; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }


}
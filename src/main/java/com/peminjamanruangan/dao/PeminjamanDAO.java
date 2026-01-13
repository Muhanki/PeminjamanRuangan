package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Peminjaman;
import java.util.List;

public interface PeminjamanDAO {
    
    /**
     * Mengambil semua data peminjaman (untuk admin).
     * @return List berisi semua objek Peminjaman.
     */
    List<Peminjaman> getAllPeminjaman();
    
    /**
     * Mengambil data peminjaman berdasarkan ID user (untuk user biasa).
     * @param userId ID dari user yang sedang login.
     * @return List berisi objek Peminjaman milik user tersebut.
     */
    List<Peminjaman> getPeminjamanByUserId(int userId);
    
    /**
     * Menambahkan data peminjaman baru ke database.
     * @param peminjaman Objek Peminjaman yang akan disimpan.
     * @param idRuangan ID dari ruangan yang dipinjam.
     */
    void addPeminjaman(Peminjaman peminjaman, int idRuangan);
    
    /**
     * Memperbarui status peminjaman.
     * @param idPeminjaman ID dari peminjaman yang akan diubah statusnya.
     * @param newStatus Status baru (misal: 'disetujui', 'ditolak').
     */
    void updateStatus(int idPeminjaman, String newStatus);
    
    // Tambahkan method ini di interface PeminjamanDAO
    boolean isRuanganTerpakai(int idRuangan);
    
    // Tambahkan method ini di interface PeminjamanDAO
    Peminjaman getDetailPeminjamanByRuangan(int idRuangan);
    
    // Tambahkan method ini di interface
    List<Peminjaman> getAllPeminjamanPending();
}
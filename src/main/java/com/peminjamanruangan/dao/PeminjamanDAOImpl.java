package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Peminjaman;
import com.peminjamanruangan.model.User;
import com.peminjamanruangan.util.DBConnection; // Saya asumsikan nama classnya DBConnection
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PeminjamanDAOImpl implements PeminjamanDAO {

    // Tambahkan method ini di class PeminjamanDAOImpl
    @Override
    public Peminjaman getDetailPeminjamanByRuangan(int idRuangan) {
        // Ambil peminjaman yang statusnya 'disetujui' untuk ruangan ini
        String sql = "SELECT p.id_peminjaman, p.tanggal, p.jam_mulai, p.jam_selesai, u.username "
                + "FROM peminjaman p "
                + "JOIN users u ON p.id_user = u.id_user "
                + "WHERE p.id_ruangan = ? AND p.status = 'disetujui' "
                + "ORDER BY p.tanggal DESC LIMIT 1"; // Ambil yang terbaru

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idRuangan);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Peminjaman peminjaman = new Peminjaman();
                peminjaman.setIdPeminjaman(rs.getInt("id_peminjaman"));
                peminjaman.setTanggal(rs.getDate("tanggal"));
                peminjaman.setJamMulai(rs.getTime("jam_mulai"));
                peminjaman.setJamSelesai(rs.getTime("jam_selesai"));

                // Buat objek User untuk menyimpan username
                User user = new User();
                user.setUsername(rs.getString("username"));
                peminjaman.setUser(user);

                return peminjaman;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Kembalikan null jika tidak ada yang meminjam
    }

    @Override
    public boolean isRuanganTerpakai(int idRuangan) {
        // Kita anggap ruangan "terpakai" jika ada peminjaman yang sudah disetujui
        // untuk ruangan tersebut di masa depan.
        // Untuk sederhananya, kita cek saja apakah ada peminjaman dengan status 'disetujui'.
        String sql = "SELECT COUNT(*) FROM peminjaman WHERE id_ruangan = ? AND status = 'disetujui'";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idRuangan);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Jika count > 0, berarti ada peminjaman aktif
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // --- METHOD UNTUK ADMIN (Mengambil semua peminjaman) ---
    @Override
    public List<Peminjaman> getAllPeminjaman() {
        List<Peminjaman> listPeminjaman = new ArrayList<>();
        String sql = "SELECT p.id_peminjaman, p.id_user, u.username, r.nama_ruangan, "
                + "p.tanggal, p.jam_mulai, p.jam_selesai, p.keperluan, p.status "
                + "FROM peminjaman p "
                + "JOIN users u ON p.id_user = u.id_user "
                + "JOIN ruangan r ON p.id_ruangan = r.id_ruangan "
                + "WHERE p.status = 'pending' "
                + "ORDER BY p.tanggal DESC, p.jam_mulai DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Peminjaman peminjaman = new Peminjaman();
                peminjaman.setIdPeminjaman(rs.getInt("id_peminjaman"));

                User user = new User();
                user.setId(rs.getInt("id_user"));
                user.setUsername(rs.getString("username"));
                peminjaman.setUser(user);

                peminjaman.setNamaRuangan(rs.getString("nama_ruangan"));
                peminjaman.setTanggal(rs.getDate("tanggal")); // Simpan sebagai Date
                peminjaman.setJamMulai(rs.getTime("jam_mulai"));
                peminjaman.setJamSelesai(rs.getTime("jam_selesai"));
                peminjaman.setKeperluan(rs.getString("keperluan"));
                peminjaman.setStatus(rs.getString("status"));

                listPeminjaman.add(peminjaman);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil data peminjaman!", e);
        }
        return listPeminjaman;
    }

    // --- METHOD UNTUK USER (Mengambil peminjaman milik sendiri) ---
    @Override
    public List<Peminjaman> getPeminjamanByUserId(int userId) {
        List<Peminjaman> listPeminjaman = new ArrayList<>();
        String sql = "SELECT p.id_peminjaman, p.id_user, u.username, r.nama_ruangan, "
                + "p.tanggal, p.jam_mulai, p.jam_selesai, p.keperluan, p.status "
                + "FROM peminjaman p "
                + "JOIN users u ON p.id_user = u.id_user "
                + "JOIN ruangan r ON p.id_ruangan = r.id_ruangan "
                + "WHERE p.id_user = ? "
                + "ORDER BY p.tanggal DESC, p.jam_mulai DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Peminjaman peminjaman = new Peminjaman();
                    peminjaman.setIdPeminjaman(rs.getInt("id_peminjaman"));

                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setUsername(rs.getString("username"));
                    peminjaman.setUser(user);

                    peminjaman.setNamaRuangan(rs.getString("nama_ruangan"));
                    peminjaman.setTanggal(rs.getDate("tanggal"));
                    peminjaman.setJamMulai(rs.getTime("jam_mulai"));
                    peminjaman.setJamSelesai(rs.getTime("jam_selesai"));
                    peminjaman.setKeperluan(rs.getString("keperluan"));
                    peminjaman.setStatus(rs.getString("status"));

                    listPeminjaman.add(peminjaman);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil data peminjaman user!", e);
        }
        return listPeminjaman;
    }

    // --- METHOD UNTUK MENAMBAH PEMINJAMAN ---
    @Override
    public void addPeminjaman(Peminjaman peminjaman, int idRuangan) {
        String sql = "INSERT INTO peminjaman (id_user, id_ruangan, tanggal, jam_mulai, jam_selesai, keperluan, status) VALUES (?, ?, ?, ?, ?, ?, 'pending')";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, peminjaman.getUser().getId());
            pstmt.setInt(2, idRuangan);
            pstmt.setDate(3, peminjaman.getTanggal());
            pstmt.setTime(4, peminjaman.getJamMulai());
            pstmt.setTime(5, peminjaman.getJamSelesai());
            pstmt.setString(6, peminjaman.getKeperluan());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menyimpan peminjaman!", e);
        }
    }

    // --- METHOD UNTUK MEMPERBARUI STATUS ---
    @Override
    public void updateStatus(int idPeminjaman, String newStatus) {
        String sql = "UPDATE peminjaman SET status = ? WHERE id_peminjaman = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newStatus);
            pstmt.setInt(2, idPeminjaman);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal memperbarui status peminjaman!", e);
        }
    }

    @Override
    public List<Peminjaman> getAllPeminjamanPending() {
        return getAllPeminjaman();
    }

}

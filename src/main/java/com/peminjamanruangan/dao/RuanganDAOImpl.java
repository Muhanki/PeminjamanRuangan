package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Ruangan;
import com.peminjamanruangan.util.DBConnection; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RuanganDAOImpl implements RuanganDAO {

    @Override
    public List<Ruangan> getAllRuangan() {
        List<Ruangan> listRuangan = new ArrayList<>();
        String sql = "SELECT id_ruangan, nama_ruangan, kapasitas, keterangan FROM ruangan ORDER BY nama_ruangan";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Ruangan ruangan = new Ruangan();
                // Perbaikan: Tambahkan tutup kurung ")" yang kurang
                ruangan.setIdRuangan(rs.getInt("id_ruangan"));
                ruangan.setNamaRuangan(rs.getString("nama_ruangan"));
                ruangan.setKapasitas(rs.getInt("kapasitas"));
                ruangan.setKeterangan(rs.getString("keterangan"));
                listRuangan.add(ruangan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil data ruangan!", e);
        }
        return listRuangan;
    }

    @Override
    public void addRuangan(Ruangan ruangan) {
        String sql = "INSERT INTO ruangan (nama_ruangan, kapasitas, keterangan) VALUES (?, ?, ?)";
        
        // Perbaikan: Tambahkan tutup kurung ")" pada try-with-resources
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, ruangan.getNamaRuangan());
            pstmt.setInt(2, ruangan.getKapasitas());
            pstmt.setString(3, ruangan.getKeterangan());
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menambah ruangan!", e);
        }
    }

    @Override
    public void updateRuangan(Ruangan ruangan) {
        String sql = "UPDATE ruangan SET nama_ruangan=?, kapasitas=?, keterangan=? WHERE id_ruangan=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, ruangan.getNamaRuangan());
            pstmt.setInt(2, ruangan.getKapasitas());
            pstmt.setString(3, ruangan.getKeterangan());
            pstmt.setInt(4, ruangan.getIdRuangan());
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRuangan(int idRuangan) {
        String sql = "DELETE FROM ruangan WHERE id_ruangan = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, idRuangan);
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menghapus ruangan!", e);
        }
    }

    @Override
    public Ruangan getRuanganById(int idRuangan) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
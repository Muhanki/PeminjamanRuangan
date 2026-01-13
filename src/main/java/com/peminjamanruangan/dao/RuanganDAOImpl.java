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
        String sql = "SELECT id_ruangan, nama_ruangan FROM ruangan ORDER BY nama_ruangan";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Ruangan ruangan = new Ruangan();
                ruangan.setIdRuangan(rs.getInt("id_ruangan"));
                ruangan.setNamaRuangan(rs.getString("nama_ruangan"));
                listRuangan.add(ruangan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil data ruangan!", e);
        }
        return listRuangan;
    }
}
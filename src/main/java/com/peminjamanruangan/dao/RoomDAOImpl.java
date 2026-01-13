// RoomDAOImpl.java (Implementasi)
package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Room;
import com.peminjamanruangan.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAOImpl implements RoomDAO {

    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("id"), rs.getString("name"), rs.getInt("capacity"), rs.getString("facilities")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public Room getRoomById(int id) {
        String sql = "SELECT * FROM rooms WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Room(rs.getInt("id"), rs.getString("name"), rs.getInt("capacity"), rs.getString("facilities"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

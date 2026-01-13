// BookingDAOImpl.java (Implementasi)
package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Booking;
import com.peminjamanruangan.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public void addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, room_id, date, time, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getRoomId());
            ps.setDate(3, booking.getDate());
            ps.setTime(4, booking.getTime());
            ps.setString(5, booking.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bookings.add(new Booking(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("room_id"),
                        rs.getDate("date"), rs.getTime("time"), rs.getString("status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}

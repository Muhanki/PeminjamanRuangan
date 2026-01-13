package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.User;
import com.peminjamanruangan.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public void addUser(User user) {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, 'user')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menambahkan user baru!", e);
        }
    }

    @Override
    public User getUserByUsername(String username) {
        String sql = "SELECT id_user, username, password, role FROM users WHERE username = ?";
        User user = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id_user"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil data user!", e);
        }
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id_user, username, role FROM users ORDER BY id_user";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id_user"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal mengambil semua data user!", e);
        }
        return users;
    }

    @Override
    public void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id_user = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menghapus user!", e);
        }
    }

    @Override
    public void updateUser(User user) {
        throw new UnsupportedOperationException("Fitur update user belum diimplementasikan.");
    }
} 
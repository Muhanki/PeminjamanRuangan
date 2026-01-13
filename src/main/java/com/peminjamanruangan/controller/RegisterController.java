package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.UserDAO;
import com.peminjamanruangan.dao.UserDAOImpl;
import com.peminjamanruangan.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl() {
        @Override
        public List<User> getAllUsers() {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override
        public void updateUser(User user) {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override
        public void deleteUser(int id) {
            throw new UnsupportedOperationException("Not supported yet.");
        }
    };

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("regUsername");
        String password = request.getParameter("regPassword");

        // Cek username sudah ada atau belum
        if (userDAO.getUserByUsername(username) == null) {

            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password); // SIMPAN PLAINTEXT
            newUser.setRole("user"); // default role (opsional tapi disarankan)

            userDAO.addUser(newUser);

            request.setAttribute("success", "Registrasi berhasil! Silakan login.");

        } else {
            request.setAttribute("error", "Username sudah terdaftar!");
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}

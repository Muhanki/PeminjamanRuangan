package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.UserDAO;
import com.peminjamanruangan.dao.UserDAOImpl;
import com.peminjamanruangan.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl() {
        @Override
        public List<User> getAllUsers() {
            throw new UnsupportedOperationException();
        }

        @Override
        public void updateUser(User user) {
            throw new UnsupportedOperationException();
        }

        @Override
        public void deleteUser(int id) {
            throw new UnsupportedOperationException();
        }
    };

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.getUserByUsername(username);

        // LOGIN TANPA HASH
        if (user != null && password.equals(user.getPassword())) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user.getUsername());
            session.setAttribute("userId", user.getId());
            session.setAttribute("userRole", user.getRole());

            response.sendRedirect("dashboard.jsp");

        } else {
            request.setAttribute("error", "Username atau password salah!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

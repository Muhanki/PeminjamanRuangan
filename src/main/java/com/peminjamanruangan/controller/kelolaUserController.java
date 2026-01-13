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

@WebServlet("/admin/kelolaUser")
public class kelolaUserController extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- CEK ROLE ADMIN ---
        HttpSession session = request.getSession();
        if (!"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("../login.jsp?error=Anda tidak memiliki akses!");
            return;
        }

        List<User> allUsers = userDAO.getAllUsers();
        request.setAttribute("listUser", allUsers);
        request.getRequestDispatcher("../kelolauser.jsp").forward(request, response);
    }
}

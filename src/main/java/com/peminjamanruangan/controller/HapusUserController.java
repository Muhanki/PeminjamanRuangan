package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.UserDAO;
import com.peminjamanruangan.dao.UserDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/hapusUser")
public class HapusUserController extends HttpServlet {
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

        int userId = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(userId);
        
        // Redirect kembali ke halaman kelola user
        response.sendRedirect("kelolaUser");
    }
}
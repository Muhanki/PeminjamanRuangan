package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.PeminjamanDAO;
import com.peminjamanruangan.dao.PeminjamanDAOImpl;
import com.peminjamanruangan.model.Peminjaman;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/statusPeminjaman")
public class StatusPeminjamanController extends HttpServlet {
    private PeminjamanDAO peminjamanDAO = new PeminjamanDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        String userRole = (String) session.getAttribute("userRole");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=Sesi Anda habis, silakan login.");
            return;
        }

        // Ambil data peminjaman hanya untuk user yang sedang login
        List<Peminjaman> listPeminjamanSaya = peminjamanDAO.getPeminjamanByUserId(userId);
        request.setAttribute("listPeminjaman", listPeminjamanSaya);

        request.getRequestDispatcher("statusPeminjaman.jsp").forward(request, response);
    }
}
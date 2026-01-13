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

@WebServlet("/admin/Peminjaman")
public class PeminjamanController extends HttpServlet {
    private PeminjamanDAO peminjamanDAO = new PeminjamanDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- CEK ROLE ADMIN ---
        HttpSession session = request.getSession();
        if (!"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("../login.jsp?error=Anda tidak memiliki akses!");
            return;
        }

        List<Peminjaman> allPeminjaman = peminjamanDAO.getAllPeminjaman();
        request.setAttribute("listPeminjaman", allPeminjaman);
        request.getRequestDispatcher("../kelolapeminjaman.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- CEK ROLE ADMIN ---
        HttpSession session = request.getSession();
        if (!"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("../login.jsp?error=Anda tidak memiliki akses!");
            return;
        }

        int idPeminjaman = Integer.parseInt(request.getParameter("idPeminjaman"));
        String aksi = request.getParameter("aksi"); // 'setujui' atau 'tolak'
        
        String newStatus = "";
        if ("setujui".equals(aksi)) {
            newStatus = "disetujui";
        } else if ("tolak".equals(aksi)) {
            newStatus = "ditolak";
        }

        if (!newStatus.isEmpty()) {
            peminjamanDAO.updateStatus(idPeminjaman, newStatus);
        }

        // Redirect kembali ke halaman yang sama untuk melihat perubahan
        response.sendRedirect("kelolapeminjaman");
    }
}
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

@WebServlet(name = "KelolaPeminjamanController", urlPatterns = {"/admin/kelolaPeminjaman"})
public class KelolaPeminjamanController extends HttpServlet {
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
        request.getRequestDispatcher("/kelolapeminjaman.jsp").forward(request, response);
    }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    // --- 1. CEK ROLE ADMIN ---
    HttpSession session = request.getSession();
    if (!"admin".equals(session.getAttribute("userRole"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Akses Ditolak");
        return; // BERHENTI DI SINI: Jangan lanjut ke kode di bawah
    }

    try {
        // --- 2. AMBIL PARAMETER ---
        String idStr = request.getParameter("idPeminjaman");
        String aksi = request.getParameter("aksi");

        if (idStr != null && aksi != null) {
            int idPeminjaman = Integer.parseInt(idStr);
            String newStatus = "";

            if ("setujui".equals(aksi)) {
                newStatus = "disetujui";
            } else if ("tolak".equals(aksi)) {
                newStatus = "ditolak";
            }

            // --- 3. UPDATE DATABASE ---
            if (!newStatus.isEmpty()) {
                peminjamanDAO.updateStatus(idPeminjaman, newStatus);
                session.setAttribute("message", "Peminjaman berhasil " + newStatus + "!");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    // --- 4. REDIRECT AKHIR (HANYA SATU KALI) ---
    response.sendRedirect(request.getContextPath() + "/admin/kelolaPeminjaman");
    // return; // Opsional di akhir method
}

}
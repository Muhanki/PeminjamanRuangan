package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.RuanganDAO;
import com.peminjamanruangan.dao.RuanganDAOImpl;
import com.peminjamanruangan.model.Ruangan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddPeminjamanController", urlPatterns = {"/admin/formRuangan"})
public class AddRuanganController extends HttpServlet {
    private RuanganDAO ruanganDAO = new RuanganDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- CEK ROLE ADMIN ---
        HttpSession session = request.getSession();
        if (!"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Anda tidak memiliki akses!");
            return;
        }

        // 2. Arahkan ke file JSP form ruangan yang benar
        request.getRequestDispatcher("/formRuangan.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 3. Ambil data dari form (formRuangan.jsp)
        String namaRuangan = request.getParameter("namaRuangan");
        String kapasitasStr = request.getParameter("kapasitas");
        String keterangan = request.getParameter("keterangan");

        try {
            int kapasitas = Integer.parseInt(kapasitasStr);
            
            Ruangan ruanganBaru = new Ruangan();
            ruanganBaru.setNamaRuangan(namaRuangan);
            ruanganBaru.setKapasitas(kapasitas);
            ruanganBaru.setKeterangan(keterangan);

            // Simpan ke database via DAO
            ruanganDAO.addRuangan(ruanganBaru);

            // 4. Redirect kembali ke halaman daftar ruangan
            response.sendRedirect("kelolaRuangan?success=true");
            
        } catch (NumberFormatException e) {
            response.sendRedirect("addRuangan?error=Kapasitas harus angka!");
        }
    }
}
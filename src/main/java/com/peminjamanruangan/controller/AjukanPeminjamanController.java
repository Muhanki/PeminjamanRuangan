package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.PeminjamanDAO;
import com.peminjamanruangan.dao.PeminjamanDAOImpl;
import com.peminjamanruangan.dao.RuanganDAO;
import com.peminjamanruangan.dao.RuanganDAOImpl;
import com.peminjamanruangan.model.Peminjaman;
import com.peminjamanruangan.model.Ruangan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ajukanPeminjaman")
public class AjukanPeminjamanController extends HttpServlet {

    private PeminjamanDAO peminjamanDAO = new PeminjamanDAOImpl();
    private RuanganDAO ruanganDAO = new RuanganDAOImpl();

    // Untuk menampilkan form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Cek apakah user sudah login
        HttpSession session = request.getSession();
        if (session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login.jsp?error=Silakan login terlebih dahulu!");
            return;
        }
        // Ambil semua data ruangan untuk dropdown
        List<Ruangan> listRuangan = ruanganDAO.getAllRuangan();
        request.setAttribute("listRuangan", listRuangan);

        // Tampilkan halaman form
        request.getRequestDispatcher("ajukanPeminjaman.jsp").forward(request, response);
    }

    // Di dalam AjukanPeminjamanController.java
// Ganti method doPost dengan ini
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=Sesi Anda telah habis, silakan login lagi.");
            return;
        }

        try {
            int idRuangan = Integer.parseInt(request.getParameter("idRuangan"));
            String tanggalStr = request.getParameter("tanggal");
            String jamMulaiStr = request.getParameter("jamMulai");
            String jamSelesaiStr = request.getParameter("jamSelesai");
            String keperluan = request.getParameter("keperluan");

            // --- KONVERSI STRING KE JAVA.SQL.DATE ---
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(tanggalStr);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            
            java.sql.Time sqlJamMulai = null;
            java.sql.Time sqlJamSelesai = null;
            
            //jam mulai
            if (jamMulaiStr != null && !jamSelesaiStr.trim().isEmpty()){
                if (jamMulaiStr.length() == 5 ){
                    jamMulaiStr += ":00";
                }
                 sqlJamMulai = java.sql.Time.valueOf(jamMulaiStr);
          }
            //jam selesai
            if (jamSelesaiStr != null && !jamSelesaiStr.trim().isEmpty()){
                    if (jamSelesaiStr.length() == 5) { // Format "HH:mm"
                    jamSelesaiStr += ":00";
            }
            sqlJamSelesai = java.sql.Time.valueOf(jamSelesaiStr); // Konversi SETELAH string diperbaiki
          }

            // Buat objek Peminjaman
            Peminjaman peminjaman = new Peminjaman();
            com.peminjamanruangan.model.User user = new com.peminjamanruangan.model.User();
            user.setId(userId);
            peminjaman.setUser(user);

            peminjaman.setTanggal(sqlDate); // Gunakan objek Date, bukan String
            peminjaman.setJamMulai(sqlJamMulai);
            peminjaman.setJamSelesai(sqlJamSelesai);
            peminjaman.setKeperluan(keperluan);

            // Simpan ke database
            peminjamanDAO.addPeminjaman(peminjaman, idRuangan);

            // Redirect ke halaman status dengan pesan sukses
            response.sendRedirect("statusPeminjaman?success=Peminjaman berhasil diajukan!");

        } catch (Exception e) {
            e.printStackTrace();
            // Jika ada error, kembalikan ke form dengan pesan error
            request.setAttribute("error", "Gagal mengajukan peminjaman. Pastikan semua data terisi dengan benar.");
            doGet(request, response); // Tampilkan form lagi
        }
    }
}

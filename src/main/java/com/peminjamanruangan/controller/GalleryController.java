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
import java.util.List;

/**
 * Controller untuk menangani tampilan Gallery Ruangan
 * URL Akses: http://localhost:8080/nama_proyek/gallery
 */
@WebServlet("/gallery")
public class GalleryController extends HttpServlet {

    // Memanggil DAO untuk akses data ke database
    private RuanganDAO ruanganDAO = new RuanganDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Ambil data semua ruangan dari database
            List<Ruangan> daftarRuangan = ruanganDAO.getAllRuangan();

            // 2. Simpan daftar tersebut ke dalam atribut request
            // Nama "daftarRuangan" harus sama dengan yang dipanggil di c:forEach pada JSP
            request.setAttribute("daftarRuangan", daftarRuangan);

            // 3. (Opsional) Cek pesan sukses/error jika ada redirect dari halaman lain
            String status = request.getParameter("status");
            if ("success".equals(status)) {
                request.setAttribute("message", "Data berhasil diperbarui!");
            }

            // 4. Lempar data ke halaman gallery.jsp
            request.getRequestDispatcher("/gallery.jsp").forward(request, response);
            
        } catch (Exception e) {
            // Jika terjadi error, cetak di log server dan arahkan ke halaman error atau dashboard
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/dashboard.jsp?error=Gagal memuat gallery");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Gallery biasanya hanya menampilkan data (Read), 
        // jadi kita arahkan saja POST ke doGet jika tidak sengaja terpanggil.
        doGet(request, response);
    }
}
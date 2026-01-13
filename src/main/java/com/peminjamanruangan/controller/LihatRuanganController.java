package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.PeminjamanDAO;
import com.peminjamanruangan.dao.PeminjamanDAOImpl;
import com.peminjamanruangan.dao.RuanganDAO;
import com.peminjamanruangan.dao.RuanganDAOImpl;
import com.peminjamanruangan.model.Ruangan;
import com.peminjamanruangan.model.Peminjaman;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/lihatRuangan")
public class LihatRuanganController extends HttpServlet {
    private RuanganDAO ruanganDAO = new RuanganDAOImpl();
    private PeminjamanDAO peminjamanDAO = new PeminjamanDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("DEBUG: LihatRuanganController dimulai..."); // Tanda 1: Controller mulai jalan

        HttpSession session = request.getSession();
        if (session.getAttribute("loggedInUser") == null) {
            System.out.println("DEBUG: User belum login, redirect ke login."); // Tanda 2
            response.sendRedirect("login.jsp?error=Silakan login terlebih dahulu!");
            return;
        }

        try {
            System.out.println("DEBUG: Mengambil data dari DAO..."); // Tanda 3
            List<Ruangan> semuaRuangan = ruangan.getAllRuangan();
            System.out.println("DEBUG: Jumlah ruangan dari DAO: " + (semuaRuangan != null ? semuaRuangan.size() : 0)); // Tanda 4

            Map<Integer, Peminjaman> detailPeminjaman = new HashMap<>();
            request.setAttribute("detailPeminjaman", detailPeminjaman);
            if (semuaRuangan != null) {
                System.out.println("DEBUG: Mulai loop untuk memproses ruangan..."); // Tanda 5
                for (Ruangan ruangan : semuaRuangan) {
                    System.out.println("DEBUG: Memproses ruangan: " + ruangan.getNamaRuangan()); // Tanda 6
                    try {
                        Peminjaman peminjamanAktif = peminjamanDAO.getDetailPeminjamanByRuangan(ruangan.getIdRuangan());
                        if (peminjamanAktif != null) {
                            detailPeminjaman.put(ruangan.getIdRuangan(), peminjamanAktif);
                            System.out.println("DEBUG: Ruangan " + ruangan.getNamaRuangan() + " sedang dipinjam."); // Tanda 7
                        } else {
                            System.out.println("DEBUG: Ruangan " + ruangan.getNamaRuangan() + " tersedia."); // Tanda 8
                        }
                    } catch (Exception e) {
                        System.err.println("ERROR: Gagal mengambil detail peminjaman untuk ruangan " + ruangan.getNamaRuangan() + " - " + e.getMessage()); // Tanda 9
                        e.printStackTrace();
                    }
                }
            }

            System.out.println("DEBUG: Mengirim data ke JSP..."); // Tanda 10
            request.setAttribute("listRuangan", semuaRuangan);
            request.setAttribute("detailPeminjaman", detailPeminjaman);
            request.getRequestDispatcher("lihatRuangan.jsp").forward(request, response);
            System.out.println("DEBUG: Berhasil forward ke JSP."); // Tanda 11

        } catch (Exception e) {
            System.err.println("ERROR: Terjadi kesalahan besar di LihatRuanganController!"); // Tanda 12
            e.printStackTrace();
            // Kirim pesan error ke halaman error.jsp
            request.setAttribute("errorMessage", "Terjadi kesalahan saat memuat data ruangan: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private static class ruangan {

        private static List<Ruangan> getAllRuangan() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        public ruangan() {
        }
    }
}
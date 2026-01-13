<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.peminjamanruangan.model.Peminjaman" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.peminjamanruangan.model.Ruangan" %>

<%
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Ambil ID ruangan dari parameter URL
    String idRuanganStr = request.getParameter("id");
    int idRuangan = Integer.parseInt(idRuanganStr);

    // Di controller, Anda harus menyiapkan atribut untuk detail ruangan
    // dan riwayat peminjaman ruangan tersebut
    Ruangan ruangan = (Ruangan) request.getAttribute("ruanganDetail");
    List<Peminjaman> riwayatPeminjaman = (List<Peminjaman>) request.getAttribute("riwayatPeminjaman");
%>

<%
if (ruangan == null) {
    out.println("Data ruangan tidak ditemukan.");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Detail Ruangan <%= ruangan.getNamaRuangan() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .detail-section { padding: 20px 0; border-top: 1px solid #dee2e6; }
        .history-list { list-style: none; padding-left: 0; }
        .history-list li { padding: 8px 0; border-bottom: 1px solid #eee; }
        .gallery-img { width: 100%; border-radius: 8px; margin-bottom: 15px; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <!-- ... copy dari file lain ... -->
    </nav>

    <div class="container mt-4">
        <!-- Tombol Kembali -->
        <a href="lihatRuangan.jsp" class="btn btn-secondary mb-4">&larr; Kembali ke Daftar Ruangan</a>

        <div class="row">
            <!-- Informasi Ruangan -->
            <div class="col-md-4">
                <div class="card">
                    <img src="images/ruangan_<%= idRuangan %>.jpg" class="card-img-top" alt="Gambar <%= ruangan.getNamaRuangan() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= ruangan.getNamaRuangan() %></h5>
                        <p class="card-text"><%= ruangan.getKeterangan() %></p>
                    </div>
                </div>
            </div>

            <!-- Informasi Peminjaman -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Riwayat Peminjaman</h5>

<%
if (riwayatPeminjaman != null && !riwayatPeminjaman.isEmpty()) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
%>

<ul class="history-list">
<%
    for (Peminjaman p : riwayatPeminjaman) {
        String statusBadge = "badge bg-warning";
        if ("disetujui".equals(p.getStatus())) {
            statusBadge = "badge bg-success";
        } else if ("ditolak".equals(p.getStatus())) {
            statusBadge = "badge bg-danger";
        }
%>
    <li class="d-flex justify-content-between align-items-center">
        <span><%= dateFormat.format(p.getTanggal()) %></span>
        <span class="<%= statusBadge %>"><%= p.getStatus() %></span>
        <small>
            <%= p.getUser().getUsername() %>
            (<%= timeFormat.format(p.getJamMulai()) %> - <%= timeFormat.format(p.getJamSelesai()) %>)
        </small>
    </li>
<%
    }
%>
</ul>

<%
} else {
%>
<p class="text-muted">Belum ada riwayat peminjaman.</p>
<%
}
%>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Denah Section -->
    <div class="detail-section">
        <h5>Denah &amp; Foto Ruangan</h5>
        <img src="images/denahlokasi.jpg" class="gallery-img" alt="Denah Lokasi Ruangan">
    </div>

    <!-- Footer -->
    <footer>
        <!-- ... copy dari file lain ... -->
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
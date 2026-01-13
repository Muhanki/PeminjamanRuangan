<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.peminjamanruangan.model.Peminjaman" %>
<%@ page import="com.peminjamanruangan.model.User" %>
<%
    // Keamanan: Cek apakah user sudah login dan role-nya admin
    String userRole = (String) session.getAttribute("userRole");
    if (userRole == null || !"admin".equals(userRole)) {
        response.sendRedirect("../login.jsp?error=Anda tidak memiliki akses!");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola Peminjaman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   
    
    <!-- Navbar (Anda bisa copy-paste dari dashboard.jsp) -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="../dashboard.jsp">Peminjaman Ruangan</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="../dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="../lihatRuangan.jsp">Lihat Ruangan</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                         <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="admin/kelolaPeminjaman">Kelola Peminjaman</a></li>
                                    <li><a class="dropdown-item" href="admin/kelolaUser">Kelola User</a></li>
                                </ul>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <span class="navbar-text me-3">Halo, <%= session.getAttribute("loggedInUser")%>!</span>
                    <a class="btn btn-outline-light btn-sm" href="../logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>
 <%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div class="alert alert-success alert-dismissible fade show container mt-3" role="alert">
        <strong>Sukses!</strong> <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
        session.removeAttribute("message");
    }
%>
    <!-- KODE ANDA YANG SUDAH BENAR, TIDAK PERLU DIUBAH -->
    <div class="container mt-4">
        <h1>Kelola Semua Peminjaman</h1>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                   
                    <% 
    String msg = (String) session.getAttribute("message");
    if (msg != null) { 
%>
    <script>alert("<%= msg %>");</script>
<% 
        session.removeAttribute("message"); // Hapus pesan agar tidak muncul terus saat refresh
    } 
%>
                    
                    <tr>
                        <th>ID</th>
                        <th>Peminjam</th>
                        <th>Ruangan</th>
                        <th>Tanggal</th>
                        <th>Waktu</th>
                        <th>Keperluan</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<Peminjaman> listPeminjaman = (List<Peminjaman>) request.getAttribute("listPeminjaman");
                    if (listPeminjaman != null && !listPeminjaman.isEmpty()) {
                        for (Peminjaman p : listPeminjaman) { 
                    %>
                        <tr>
                            <td><%= p.getIdPeminjaman() %></td>
                            <td><%= (p.getUser() != null) ? p.getUser().getUsername() : "Tidak Diketahui" %></td>
                            <td><%= p.getNamaRuangan() %></td>
                            <td><%= p.getTanggal() %></td>
                            <td><%= p.getJamMulai() %> - <%= p.getJamSelesai() %></td>
                            <td><%= p.getKeperluan() %></td>
                            <td>
                                <% if ("disetujui".equals(p.getStatus())) { %>
                                    <span class="badge bg-success">Disetujui</span>
                                <% } else if ("ditolak".equals(p.getStatus())) { %>
                                    <span class="badge bg-danger">Ditolak</span>
                                <% } else { %>
                                    <span class="badge bg-warning text-dark">Menunggu Persetujuan</span>
                                <% } %>
                            </td>
                            <td>
    <form action="kelolaPeminjaman" method="POST" style="display:inline;">
        <input type="hidden" name="idPeminjaman" value="<%= p.getIdPeminjaman() %>">
                        <button type="submit" name="aksi" value="setujui" class="btn btn-sm btn-success">Setujui</button>
                        <button type="submit" name="aksi" value="tolak" class="btn btn-sm btn-danger">Tolak</button>
                        </form>
                        </td>
                        </tr>
                    <% 
                        } // Akhir Loop For
                    } else { 
                    %>
                        <tr>
                            <td colspan="8" class="text-center">Tidak ada data peminjaman.</td>
                        </tr>
                    <% 
                    } // Akhir If
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
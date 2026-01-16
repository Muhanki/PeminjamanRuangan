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
    <style>
        body{font-family: 'Arial', sans-serif; 
               min-height: 100vh; 
               display: flex; 
               flex-direction: column; 
        }    
        .content { flex: 1; 
                  padding:40px 0;
        }
         footer {
                background-color: #343a40;
                color: white;
                text-align: center;
                padding: 20px 0;
                width: 100%;
                margin-top: auto;
            }
    </style>
    <title>Kelola Peminjaman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="../dashboard.jsp">Peminjaman Ruangan</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard.jsp">Dashboard</a>
    </li>
    
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/kelolaPeminjaman">Kelola Peminjaman</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/kelolaUser">Kelola User</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/addRuangan">Kelola Ruangan</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/about">About Us</a>
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
        session.removeAttribute("message"); 
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
        <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan - Kelola Peminjaman</p>
            </div>
        </footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.peminjamanruangan.model.Peminjaman" %>
<%
    String userRole = (String) session.getAttribute("userRole");
    if (userRole == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: 'Arial', sans-serif; 
               min-height: 100vh; 
               display: flex; 
               flex-direction: column; 
        
        }
        .content { flex: 1; 
                   padding:40px 0;
        }
        footer { background-color: #343a40;
                 color: white; text-align: 
                 center; padding: 20px 0;
                 width: 100%; 
                 margin-top: auto; 
        }
        .title-underline {
            width: 50px;
            height: 5px;
            background: #0d6efd;
            margin: 10px auto 30px;
            border-radius: 5px;
        }
    </style>
    <title>Status Peminjaman Saya</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%-- Panggil navbar yang sesuai --%>
    <% if ("admin".equals(userRole)) { %>
        <jsp:include page="navbar-admin.jsp" />
    <% } else { %>
        <jsp:include page="navbar-user.jsp" />
    <% } %>

    <div class="container mt-4">
        <h1>Status Peminjaman Saya</h1>
        
        <%-- Tampilkan pesan sukses jika ada --%>
        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success"><%= request.getParameter("success") %></div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Ruangan</th>
                        <th>Tanggal</th>
                        <th>Waktu</th>
                        <th>Keperluan</th>
                        <th>Status</th>
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
                            <td><%= p.getNamaRuangan() %></td>
                            <td><%= p.getTanggal() %></td>
                            <td><%= p.getJamMulai() %> - <%= p.getJamSelesai() %></td>
                            <td><%= p.getKeperluan() %></td>
                            <td>
                                <span class="badge 
                                    <% if ("pending".equals(p.getStatus())) { %>bg-warning text-dark<% } 
                                       else if ("disetujui".equals(p.getStatus())) { %>bg-success<% }
                                       else if ("ditolak".equals(p.getStatus())) { %>bg-danger<% } %>">
                                    <%= p.getStatus() %>
                                </span>
                            </td>
                        </tr>
                    <% 
                        } 
                    } else { 
                    %>
                        <tr>
                            <td colspan="6" class="text-center">Anda belum mengajukan peminjaman.</td>
                        </tr>
                    <% 
                    } 
                    %>
                </tbody>
            </table>
        </div>
    </div>
 <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan - Status Peminjaman</p>
            </div>
        </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
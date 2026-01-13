<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.peminjamanruangan.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="../dashboard.jsp">Peminjaman Ruangan</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="../dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="../lihatRuangan.jsp">Lihat Ruangan</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="kelolaPeminjaman">Kelola Peminjaman</a></li>
                            <li><a class="dropdown-item" href="kelolaUser">Kelola User</a></li>
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

      
    <div class="container mt-4">
        <h1>Kelola User</h1>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID User</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<User> listUser = (List<User>) request.getAttribute("listUser");
                for (User u : listUser) { 
                %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getUsername() %></td>
                        <td><%= u.getRole() %></td>
                        <td>
                            <% if (!"admin".equals(u.getRole())) { %>
                                <a href="hapusUser?id=<%= u.getId() %>" 
                                   onclick="return confirm('Apakah Anda yakin ingin menghapus user <%= u.getUsername() %> ?');" 
                                   class="btn btn-sm btn-danger">Hapus</a>
                            <% } else { %>
                                <span class="text-muted">Admin</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
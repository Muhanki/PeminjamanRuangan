<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.peminjamanruangan.model.User" %>
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
    </style>
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
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/formRuangan">Kelola Ruangan</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="about.jsp">About Us</a>
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
    // Cek jika listUser tidak null sebelum di-looping
    if (listUser != null && !listUser.isEmpty()) { 
        for (User u : listUser) { 
    %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getUsername() %></td>
            <td><%= u.getRole() %></td>
            <td>
                <% if (!"admin".equals(u.getRole())) { %>
                    <a href="${pageContext.request.contextPath}/admin/hapusUser?id=<%= u.getId() %>" 
   onclick="return confirm('Apakah Anda yakin ingin menghapus user <%= u.getUsername() %> ?');" 
   class="btn btn-sm btn-danger">Hapus</a>
                <% } else { %>
                    <span class="text-muted">Admin</span>
                <% } %>
            </td>
        </tr>
    <% 
        } 
    } else { 
    %>
        <tr>
            <td colspan="4" class="text-center">Data kosong atau Anda mengakses halaman ini secara langsung tanpa Servlet.</td>
        </tr>
    <% } %>
</tbody>
        </table>
    </div>
        <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan - Kelola User</p>
            </div>
        </footer>
</body>
</html>
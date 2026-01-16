<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Keamanan: Cek apakah user sudah login
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
        body {
                font-family: 'Arial', sans-serif;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            .dashboard-content {
                flex: 1;
                padding: 40px 0;
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
    <title>About Us - Tim Kami</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .member-card {
        transition: all 0.3s ease;
        border: none;
        border-radius: 15px; /* Lebih bulat agar modern */
    }
    .member-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }
    .profile-img {
        width: 130px;
        height: 130px;
        object-fit: cover;
        border-radius: 50%;
        margin: 20px auto;
        border: 4px solid #0d6efd;
        box-shadow: 0 5px 15px rgba(13, 110, 253, 0.2);
    }
    </style>
</head>
<body>
    <%-- Panggil navbar yang sesuai dengan role --%>
    <% if ("admin".equals(userRole)) { %>
        <jsp:include page="navbar-admin.jsp" />
    <% } else { %>
        <jsp:include page="navbar-user.jsp" />
    <% } %>

    <div class="container mt-5 mb-5">
        <div class="text-center mb-5">
            <h1 class="fw-bold">Tentang Kami</h1>
            <p class="text-muted">Kelompok Pengembangan Aplikasi Peminjaman Ruangan</p>
            <hr class="w-25 mx-auto">
        </div>

        <div class="row g-4 justify-content-center">
            
            <%-- Anggota 1 --%>
            <div class="col-md-4 col-lg-2">
                <div class="card h-100 text-center shadow-sm member-card">
                    <img src="images/r.jpg" class="profile-img" alt="Foto">
                    <div class="card-body p-2">
                        <h6 class="card-title fw-bold mb-1">Muhammad Raisa Qisti Raihan</h6>
                        <p class="text-muted small mb-0">NIM: 0110224018</p>
                    </div>
                </div>
            </div>

            <%-- Anggota 2 --%>
            <div class="col-md-4 col-lg-2">
                <div class="card h-100 text-center shadow-sm member-card">
                    <img src="images/salman.jpg" class="profile-img" alt="Foto">
                    <div class="card-body p-2">
                        <h6 class="card-title fw-bold mb-1">Salman Fathi Alghifari</h6>
                        <p class="text-muted small mb-0">NIM: 0110224088</p>
                    </div>
                </div>
            </div>

            <%-- Anggota 3 --%>
            <div class="col-md-4 col-lg-2">
                <div class="card h-100 text-center shadow-sm member-card">
                    <img src="images/yuda.jpg" class="profile-img" alt="Foto">
                    <div class="card-body p-2">
                        <h6 class="card-title fw-bold mb-1">Yuda albifarah</h6>
                        <p class="text-muted small mb-0">NIM: 0110224223</p>
                    </div>
                </div>
            </div>

            <%-- Anggota 4 --%>
            <div class="col-md-4 col-lg-2">
                <div class="card h-100 text-center shadow-sm member-card">
                    <img src="images/danang.jpg" class="profile-img" alt="Foto">
                    <div class="card-body p-2">
                        <h6 class="card-title fw-bold mb-1">Viqrin Perdana Sakti </h6>
                        <p class="text-muted small mb-0">NIM: 0110224200</p>
                    </div>
                </div>
            </div>

            <%-- Anggota 5 --%>
            <div class="col-md-4 col-lg-2">
                <div class="card h-100 text-center shadow-sm member-card">
                    <img src="images/alia.jpg" class="profile-img" alt="Foto">
                    <div class="card-body p-2">
                        <h6 class="card-title fw-bold mb-1">Alia Maisyarah</h6>
                        <p class="text-muted small mb-0">NIM: 0110224095</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="text-center mt-5">
            <a href="dashboard.jsp" class="btn btn-primary px-4 shadow-sm">Kembali ke Dashboard</a>
        </div>
    </div>
 <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan - About Us</p>
            </div>
        </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
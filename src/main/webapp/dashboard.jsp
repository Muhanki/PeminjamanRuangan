<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Pengecekan session: Jika belum login, redirect ke login.jsp
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    // Ambil role user dari session untuk digunakan di seluruh halaman
    String userRole = (String) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Peminjaman Ruangan</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
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
            .card {
                margin: 20px 0;
                transition: transform 0.2s;
            }
            .card:hover {
                transform: translateY(-5px);
            }
            footer {
                background-color: #343a40;
                color: white;
                text-align: center;
                padding: 20px 0;
                width: 100%;
                margin-top: auto;
            }
            .carousel-item img {
                height: 400px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container d-flex justify-content-between">
                <a class="navbar-brand" href="dashboard.jsp">Peminjaman Ruangan</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="dashboard.jsp">Dashboard</a>
                        </li>

                        
                        <% if ("admin".equals(userRole)) { %>
                  
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
                                    
                    
                        <% } else { %>
                            <!-- MENU UNTUK USER BIASA -->
                            <li class="nav-item">
                            <a class="nav-link" href="lihatRuangan.jsp">Lihat Ruangan</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ajukanPeminjaman.jsp">Ajukan Peminjaman</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="statusPeminjaman.jsp">Status Peminjaman</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">About Us</a>
                            </li>
                            <li class="nav-item">
                                 <a class="nav-link" href="${pageContext.request.contextPath}/gallery">Gallery</a>
                            </li>
                        <% } %>
                        <!-- --- AKHIR BAGIAN YANG DIPERBAIKI --- -->

                    </ul>
                    <div class="d-flex align-items-center">
                        <span class="navbar-text me-3">Halo, <%= loggedInUser%>! (<%= userRole %>)</span>
                        <a class="btn btn-outline-light btn-sm" href="logout.jsp">Logout</a>
                    </div>  
                </div>
            </div>
        </nav>

        <!-- Dashboard Header dengan Carousel -->
        <section class="dashboard-header">
            <div id="dashboardCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/ruang1.jpg" class="d-block w-100" alt="Ruang 101">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Selamat Datang di Dashboard</h5>
                            <p>Kelola peminjaman ruangan dengan mudah.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/ruang2.jpg" class="d-block w-100" alt="Ruang 102">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Fitur Lengkap</h5>
                            <p>Lihat, ajukan, dan pantau peminjaman ruangan.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/ruang3.jpg" class="d-block w-100" alt="Ruang 103">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Mudah dan Cepat</h5>
                            <p>Sistem peminjaman online untuk kampus Anda.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#dashboardCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#dashboardCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <!-- Dashboard Content -->
        <section class="dashboard-content">
            <div class="container">
                <div class="row">
                    <% if ("admin".equals(userRole)) { %>
                        <!-- KARTU KHUSUS ADMIN -->
                        <div class="col-md-4">
                            <div class="card bg-light">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Kelola Peminjaman</h5>
                                    <p class="card-text">Setujui atau tolak permintaan peminjaman ruangan.</p>
                                    <a href="admin/kelolaPeminjaman" class="btn btn-primary">Kelola</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-light">
                                <div class="card-body text-center">
                                    <h5 class="card-title">Kelola User</h5>
                                    <p class="card-text">Lihat dan hapus user yang terdaftar.</p>
                                    <a href="admin/kelolaUser" class="btn btn-primary">Kelola</a>
                                </div>
                            </div>
                        </div>
                    <% } else { %>
                        <!-- KARTU KHUSUS USER BIASA -->
                        <div class="col-md-4">
                            <div class="card bg-light">
                            <div class="card-body text-center">
                                    <h5 class="card-title">Ajukan Peminjaman</h5>
                                    <p class="card-text">Buat permintaan peminjaman ruangan baru.</p>
                                    <a href="ajukanPeminjaman.jsp" class="btn btn-primary">Ajukan</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-light">
                            <div class="card-body text-center">
                                    <h5 class="card-title">Status Peminjaman</h5>
                                    <p class="card-text">Pantau status permintaan Anda.</p>
                                    <a href="statusPeminjaman.jsp" class="btn btn-primary">Cek Status</a>
                                </div>
                            </div>
                        </div>
                        
                    <% } %>
                    
                    <!-- KARTU UMUM UNTUK SEMUA -->
                    <div class="col-md-4">
                        <div class="card bg-light">
                        <div class="card-body text-center">
                                <h5 class="card-title">Lihat Ruangan</h5>
                                <p class="card-text">Jelajahi daftar ruangan yang tersedia.</p>
                                <a href="lihatRuangan.jsp" class="btn btn-primary">Lihat</a>
                            </div>
                        </div>
                    </div>
                 </div>
                
                <!-- Ringkasan -->
                <div class="mt-5">
                    <% if ("admin".equals(userRole)) { %>
                        <h3>Ringkasan Admin</h3>
                        <p>Ada <strong>5</strong> peminjaman yang menunggu persetujuan (dummy data).</p>
                    <% } else { %>
                        <h3>Ringkasan Peminjaman Saya</h3>
                        <p>Anda memiliki <strong>2</strong> permintaan peminjaman aktif (dummy data).</p>
                    <% } %>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan. All rights reserved.</p>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
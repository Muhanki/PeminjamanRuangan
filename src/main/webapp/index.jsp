<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peminjaman Ruangan - Landing Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }
        .features {
            padding: 60px 0;
            background-color: #f8f9fa;
        }
        .feature-card {
            text-align: center;
            padding: 20px;
            margin: 20px 0;
        }
        .about {
            padding: 60px 0;
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px 0;
        }
        .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Halaman Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Peminjaman Ruangan</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#fitur">Fitur</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tentang">Tentang</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Halaman Hero Section -->
    <section id="home" class="hero">
        <div class="container">
            <h1>Selamat Datang di Peminjaman Ruangan</h1>
            <p>Sistem peminjaman ruangan yang mudah dan efisien untuk kebutuhan kampus atau sekolah Anda. Kelola peminjaman ruangan dengan cepat dan aman.</p>
            <a href="login.jsp" class="btn btn-primary btn-lg">Mulai Peminjaman</a>
        </div>
    </section>

    <!-- Section Fitur -->
    <section id="fitur" class="features">
        <div class="container">
            <h2 class="text-center mb-5">Fitur Utama</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-card">
                        <h4>Lihat Ruangan</h4>
                        <p>Jelajahi daftar ruangan yang tersedia beserta detailnya, seperti kapasitas dan fasilitas.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <h4>Ajukan Peminjaman</h4>
                        <p>Ajukan permintaan peminjaman ruangan dengan mudah melalui formulir online.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <h4>Status Peminjaman</h4>
                        <p>Pantau status permintaan peminjaman Anda secara real-time.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Tentang -->
    <section id="tentang" class="about">
        <div class="container">
            <h2 class="text-center mb-4">Tentang Aplikasi</h2>
            <p class="text-center">Aplikasi Peminjaman Ruangan dirancang khusus untuk memudahkan pengelolaan ruangan di lingkungan kampus atau sekolah. Dengan sistem ini, mahasiswa, dosen, dan staf dapat mengajukan peminjaman ruangan secara online, mengurangi birokrasi dan meningkatkan efisiensi penggunaan fasilitas.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2023 Peminjaman Ruangan. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

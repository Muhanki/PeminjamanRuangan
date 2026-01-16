<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tambah Ruangan Baru</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        
        /* Navbar Styling */
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .content { 
            flex: 1; 
            padding: 40px 0;
            display: flex;
            align-items: center; /* Memusatkan card secara vertikal */
        }

        .card {
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        .card-header {
            border-radius: 10px 10px 0 0 !important;
            font-weight: bold;
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
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard.jsp">Peminjaman Ruangan</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/kelolaPeminjaman">Kelola Peminjaman</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/addRuangan">Kelola Ruangan</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center text-white">
                    <span class="me-3 small">Halo, <%= session.getAttribute("loggedInUser") %>!</span>
                    <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="content">
        <div class="container">
            <div class="card mx-auto" style="max-width: 500px;">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h5 class="mb-0">Tambah Ruangan Baru</h5>
                </div>
                <div class="card-body p-4">
                    <form action="addRuangan" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Nama Ruangan</label>
                            <input type="text" name="namaRuangan" class="form-control" placeholder="Contoh: Ruang 101" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Kapasitas</label>
                            <input type="number" name="kapasitas" class="form-control" placeholder="Jumlah kursi" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Keterangan / Fasilitas</label>
                            <textarea name="keterangan" class="form-control" rows="3" placeholder="Contoh: AC, Proyektor, Papan Tulis"></textarea>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-between mt-4">
                            <a href="kelolaRuangan" class="btn btn-secondary px-4">Batal</a>
                            <button type="submit" class="btn btn-success px-4">Simpan Ruangan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <p class="mb-0">&copy; 2025 Peminjaman Ruangan - Kelola Ruangan</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
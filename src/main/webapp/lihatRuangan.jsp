<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.peminjamanruangan.model.Peminjaman" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Ambil data detail peminjaman dari controller
    Map<Integer, Peminjaman> detailPeminjaman = (Map<Integer, Peminjaman>) request.getAttribute("detailPeminjaman");
    
    // Helper untuk formatting
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lihat Ruangan - Peminjaman Ruangan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .denah-section { margin-top: 50px;
                         text-align: center; 
        }
        .denah-section img { max-width: 100%; 
                             height: auto; 
                             border: 2px solid #ddd; 
                             border-radius: 10px; cursor: 
                             pointer; transition: transform 0.3s ease; 
        }
        .denah-section img:hover { transform: scale(1.02); 
        }
        .room-card { margin-bottom: 30px; 
        }
        .room-card .card { height: 100%;
                           transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out; 
        }
        .room-card .card:hover { transform: translateY(-5px);
                                 box-shadow: 0 4px 15px rgba(0,0,0,0.1); 
        }
    </style>
</head>
<body>  
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container d-flex justify-content-between">
            <a class="navbar-brand" href="dashboard.jsp">Peminjaman Ruangan</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link active" href="lihatRuangan">Lihat Ruangan</a></li>
                    <% if (!"admin".equals(session.getAttribute("userRole"))) { %>
                        <li class="nav-item"><a class="nav-link" href="ajukanPeminjaman.jsp">Ajukan Peminjaman</a></li>
                        <li class="nav-item"><a class="nav-link" href="statusPeminjaman.jsp">Status Peminjaman</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                    <% } %>
                </ul>
                <div class="d-flex align-items-center">
                    <span class="navbar-text me-3">Halo, <%= loggedInUser%>!</span>
                    <a class="btn btn-outline-light btn-sm" href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <section class="content">
        <div class="container">
            <h2 class="text-center mb-4">Daftar Ruangan Tersedia</h2>
            <div class="row">
                
                <!-- Ruangan 101 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman101 = null;
                        boolean isTerpakai101 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 101</h5>
                            <p class="card-text">
                                Kapasitas: 50 orang<br>
                                Fasilitas: Proyektor, AC
                            </p>
                            <% if (isTerpakai101) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman101.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman101.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman101.getJamMulai()) %> - <%= timeFormat.format(peminjaman101.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/101.png" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 102 -->
                <div class="col-md-3 room-card">
                    <%
                       Peminjaman peminjaman102 = null;
                        boolean isTerpakai102 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 102</h5>
                            <p class="card-text">
                                Kapasitas: 30 orang<br>
                                Fasilitas: Whiteboard, WiFi
                            </p>
                            <% if (isTerpakai102) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman102.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman102.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman102.getJamMulai()) %> - <%= timeFormat.format(peminjaman102.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                               <a href="images/102.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 103 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman103 = null;
                        boolean isTerpakai103 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 103</h5>
                            <p class="card-text">
                                Kapasitas: 20 orang<br>
                                Fasilitas: Komputer, Sound System
                            </p>
                            <% if (isTerpakai103) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman103.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman103.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman103.getJamMulai()) %> - <%= timeFormat.format(peminjaman103.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/103.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 104 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman104 = null;
                        boolean isTerpakai104 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 104</h5>
                            <p class="card-text">
                                Kapasitas: 40 orang<br>
                                Fasilitas: Proyektor, Mikrofon
                            </p>
                            <% if (isTerpakai104) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman104.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman104.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman104.getJamMulai()) %> - <%= timeFormat.format(peminjaman104.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/104.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 105 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman105 = null;
                        boolean isTerpakai105 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 105</h5>
                            <p class="card-text">
                                Kapasitas: 25 orang<br>
                                Fasilitas: AC, WiFi
                            </p>
                            <% if (isTerpakai105) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman105.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman105.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman105.getJamMulai()) %> - <%= timeFormat.format(peminjaman105.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/105.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 106 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman106 = null;
                        boolean isTerpakai106 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 106</h5>
                            <p class="card-text">
                                Kapasitas: 35 orang<br>
                                Fasilitas: Whiteboard, Proyektor
                            </p>
                            <% if (isTerpakai106) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman106.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman106.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman106.getJamMulai()) %> - <%= timeFormat.format(peminjaman106.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/106.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 107 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman107 = null;
                        boolean isTerpakai107 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 107</h5>
                            <p class="card-text">
                                Kapasitas: 15 orang<br>
                                Fasilitas: Komputer, Sound System
                            </p>
                            <% if (isTerpakai107) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman107.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman107.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman107.getJamMulai()) %> - <%= timeFormat.format(peminjaman107.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                                <a href="images/107.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Ruangan 108 -->
                <div class="col-md-3 room-card">
                    <%
                        Peminjaman peminjaman108 = null;
                        boolean isTerpakai108 = false;
                    %>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Ruang 108</h5>
                            <p class="card-text">
                                Kapasitas: 60 orang<br>
                                Fasilitas: AC, Mikrofon, Proyektor
                            </p>
                            <% if (isTerpakai108) { %>
                                <p class="text-warning">Sedang Dipinjam</p>
                                <small class="text-muted">
                                    Oleh: <%= peminjaman108.getUser().getUsername() %><br>
                                    Pada: <%= dateFormat.format(peminjaman108.getTanggal()) %><br>
                                    Jam: <%= timeFormat.format(peminjaman108.getJamMulai()) %> - <%= timeFormat.format(peminjaman108.getJamSelesai()) %>
                                </small>
                            <% } else { %>
                                <p class="text-success">Tersedia</p>
                             
                                <a href="images/108.jpeg" class="btn btn-sm btn-outline-primary mt-2">Lihat</a>
                            <% } %>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Section Denah Keseluruhan -->
            <div class="denah-section">
                <h3>Denah Keseluruhan Ruangan</h3>
                <p>Klik gambar di bawah untuk melihat layout gedung dan posisi semua ruangan.</p>
                <img src="images/denahlokasi.jpg" alt="Denah Keseluruhan Ruangan" data-bs-toggle="modal" data-bs-target="#denahModal" style="cursor: pointer;">
            </div>
        </section>


    <!-- Modal untuk Denah -->
    <div class="modal fade" id="denahModal" tabindex="-1" aria-labelledby="denahModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="denahModalLabel">Denah Keseluruhan Gedung</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img src="images/denahlokasi.png" alt="Denah Keseluruhan" class="img-fluid">
                    <p>Denah ini menunjukkan posisi semua ruangan di gedung.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2023 Peminjaman Ruangan - Lihat Ruangan</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>A
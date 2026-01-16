<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Gallery Foto Manual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* CSS KONSISTEN DENGAN TEMA ANDA */
        body { 
            font-family: 'Arial', sans-serif; 
            min-height: 100vh; 
            display: flex; 
            flex-direction: column;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
        .content { flex: 1; padding: 40px 0; }
        footer { 
            background-color: #343a40; color: white; 
            text-align: center; padding: 20px 0;
            width: 100%; margin-top: auto; 
        }

        .gallery-title {
            font-weight: bold; color: #333;
            margin-bottom: 40px; text-align: center;
            text-transform: uppercase; letter-spacing: 2px;
        }

        /* DEFINISI 6 FRAME BERBEDA */
        .frame-1 { border: 12px solid #222; background: #fff; padding: 10px; box-shadow: 8px 8px 15px rgba(0,0,0,0.2); transition: 0.3s; }
        .frame-2 { border: 12px solid #5d4037; background: #fff; padding: 10px; box-shadow: 8px 8px 15px rgba(0,0,0,0.2); transform: rotate(-2deg); transition: 0.3s; }
        .frame-3 { border: 10px solid #adb5bd; background: #fff; padding: 10px; box-shadow: 8px 8px 15px rgba(0,0,0,0.1); transform: rotate(2deg); transition: 0.3s; }
        .frame-4 { border: 12px solid #d4af37; background: #fff; padding: 10px; box-shadow: 8px 8px 20px rgba(0,0,0,0.2); transition: 0.3s; }
        .frame-5 { border: 12px solid #1a2a6c; background: #fff; padding: 10px; box-shadow: 10px 10px 15px rgba(0,0,0,0.15); transform: rotate(-1.5deg); transition: 0.3s; }
        .frame-6 { border: 12px solid #495057; background: #fff; padding: 10px; box-shadow: 5px 5px 15px rgba(0,0,0,0.1); transform: rotate(1.5deg); transition: 0.3s; }

        .frame-1:hover, .frame-2:hover, .frame-3:hover, .frame-4:hover, .frame-5:hover, .frame-6:hover {
            transform: rotate(0deg) scale(1.05); z-index: 10;
        }

        .gallery-img { width: 100%; height: 230px; object-fit: cover; display: block; }
        .frame-caption { text-align: center; font-size: 0.9rem; font-style: italic; margin-top: 10px; color: #444; font-weight: bold; }
    </style>
</head>
<body>

    <%-- Pa nggil navbar yang sesuai --%>
        <% if ("admin".equals(userRole)) { %>
        <jsp:include page="navbar-admin.jsp" />
        <% } else { %>
        <jsp:include page="navbar-user.jsp" />
        <% } %>


    <div class="content">
        <div class="container">
            <h2 class="gallery-title">Gedung & Fasilitas</h2>
             <%-- Tampilkan pesan error atau sukses --%>
            <% if (request.getAttribute("error") != null) {%>
            <div class="alert alert-danger"><%= request.getAttribute("error")%></div>
            <% } %>
            <% if (request.getParameter("success") != null) {%>
            <div class="alert alert-success"><%= request.getParameter("success")%></div>
            <% } %>
            <div class="row g-5">
                <div class="col-md-4">
                    <div class="frame-1">
                        <img src="images/gedungutama.jpg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Gedung+Utama'">
                        <div class="frame-caption">Gedung Utama Rektorat</div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="frame-2">
                        <img src="images/103.jpeg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Ruang+Rapat'">
                        <div class="frame-caption">Ruang Rapat Eksekutif</div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="frame-3">
                        <img src="images/perpus.jpg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Perpustakaan'">
                        <div class="frame-caption">Perpustakaan Pusat</div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="frame-4">
                        <img src="images/labkom.jpg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Laboratorium'">
                        <div class="frame-caption">Laboratorium Komputer</div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="frame-5">
                        <img src="images/kantin.jpg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Area+Kantin'">
                        <div class="frame-caption">Food Court Mahasiswa</div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="frame-6">
                        <img src="images/taman.jpg" class="gallery-img" onerror="this.src='https://placehold.co/400x300?text=Taman+Kampus'">
                        <div class="frame-caption">Taman & Area Terbuka</div>
                    </div>
                </div>
            </div> </div> </div> <footer>
        <div class="container">
            <p class="mb-0">&copy; 2025 Peminjaman Ruangan - Galerry Ruangan</p>
        </div>
    </footer>

</body>
</html>
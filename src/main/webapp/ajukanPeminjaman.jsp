<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.peminjamanruangan.model.Ruangan" %>
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
            body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px 0;
            width: 100%;
            margin-top: auto; /* Memastikan footer tetap di bawah */
        }   
        .title-underline {
            width: 50px;
            height: 5px;
            background: #0d6efd;
            margin: 10px auto 30px;
            border-radius: 5px;
        }
    </style>
        <title>Ajukan Peminjaman</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%-- Pa nggil navbar yang sesuai --%>
        <% if ("admin".equals(userRole)) { %>
        <jsp:include page="navbar-admin.jsp" />
        <% } else { %>
        <jsp:include page="navbar-user.jsp" />
        <% } %>

        <div class="container mt-4">
            <h1>Ajukan Peminjaman Ruangan</h1>

            <%-- Tampilkan pesan error atau sukses --%>
            <% if (request.getAttribute("error") != null) {%>
            <div class="alert alert-danger"><%= request.getAttribute("error")%></div>
            <% } %>
            <% if (request.getParameter("success") != null) {%>
            <div class="alert alert-success"><%= request.getParameter("success")%></div>
            <% } %>

            <form action="ajukanPeminjaman" method="post">
                <div class="mb-3">
                    <label for="idRuangan" class="form-label">Pilih Ruangan</label>
                    <select class="form-select" id="idRuangan" name="idRuangan" required>
                        <option value="">-- Pilih Ruangan --</option>
                        <option value="101">Ruang 101</option>
                        <option value="102">Ruang 102</option>
                        <option value="103">Ruang 103</option>
                        <option value="104">Ruang 104</option>
                        <option value="105">Ruang 105</option>
                        <option value="106">Ruang 106</option>
                        <option value="107">Ruang 107</option>
                        <option value="108">Ruang 108</option>
                        <%
                            List<Ruangan> listRuangan = (List<Ruangan>) request.getAttribute("listRuangan");
                            if (listRuangan != null) {
                                for (Ruangan r : listRuangan) {
                        %>
                        <option value="<%= r.getIdRuangan()%>"><%= r.getNamaRuangan()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="tanggal" class="form-label">Tanggal Peminjaman</label>
                    <input type="date" class="form-control" id="tanggal" name="tanggal" required>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="jamMulai" class="form-label">Jam Mulai</label>
                        <input type="time" class="form-control" id="jamMulai" name="jamMulai" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="jamSelesai" class="form-label">Jam Selesai</label>
                        <input type="time" class="form-control" id="jamSelesai" name="jamSelesai" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="keperluan" class="form-label">Keperluan</label>
                    <textarea class="form-control" id="keperluan" name="keperluan" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Ajukan Peminjaman</button>
            </form>
        </div>
                    
                     <footer>
            <div class="container">
                <p>&copy; 2025 Peminjaman Ruangan - Ajukan Peminjaman</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registrasi Akun Baru</title>
    <!-- Anda bisa gunakan CSS yang sama dengan dashboard agar konsisten -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Buat Akun Baru</h3>
                    </div>
                    <div class="card-body">
                        <%-- Tampilkan pesan error jika ada --%>
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>

                        <%-- Tampilkan pesan sukses jika ada --%>
                        <% if (request.getAttribute("success") != null) { %>
                            <div class="alert alert-success">
                                <%= request.getAttribute("success") %>
                            </div>
                        <% } %>

                        <form action="register" method="post">
                            <div class="mb-3">
                                <label for="regUsername" class="form-label">Username</label>
                                <input type="text" class="form-control" id="regUsername" name="regUsername" required>
                            </div>
                            <div class="mb-3">
                                <label for="regPassword" class="form-label">Password</label>
                                <input type="password" class="form-control" id="regPassword" name="regPassword" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Daftar</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <p>Sudah punya akun? <a href="login.jsp">Login di sini</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
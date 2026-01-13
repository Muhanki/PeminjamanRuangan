<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registrasi - Peminjaman Ruangan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; height: 100vh; font-family: 'Arial', sans-serif; }
        .login-container { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); width: 100%; max-width: 500px; }
        .error { color: red; text-align: center; margin-bottom: 15px; }
        .success { color: green; text-align: center; margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center mb-4">Peminjaman Ruangan</h2>

        <%-- Tampilkan pesan error atau sukses yang dikirim oleh Controller --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("success") %></div>
        <% } %>

        <!-- Tabs untuk Login dan Registrasi -->
        <ul class="nav nav-tabs" id="authTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Login</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">Registrasi</button>
            </li>
        </ul>
        <div class="tab-content" id="authTabsContent">
            <!-- Tab Login -->
            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                <!-- FORM INI AKAN MENGIRIM DATA KE LoginController -->
                <form action="login" method="post" class="mt-3">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>
            </div>
            <!-- Tab Registrasi -->
            <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                <!-- FORM INI SUDAH BENAR, MENGIRIM DATA KE RegisterController -->
                <form action="register" method="post" class="mt-3">
                    <div class="mb-3">
                        <label for="regUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="regUsername" name="regUsername" required>
                    </div>
                    <div class="mb-3">
                        <label for="regPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="regPassword" name="regPassword" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Daftar</button>
                </form>
            </div>
        </div>
        <p class="text-center mt-3"><a href="index.jsp">Kembali ke Home</a></p>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
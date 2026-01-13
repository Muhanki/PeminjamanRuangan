<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger" role="alert">
            <h4>Terjadi Kesalahan!</h4>
            <p><strong>Detail Error:</strong> <%= request.getAttribute("errorMessage") %></p>
            <hr>
            <p class="mb-0">Silakan coba lagi atau hubungi administrator.</p>
            <a href="dashboard.jsp" class="btn btn-primary">Kembali ke Dashboard</a>
        </div>
    </div>
</body>
</html>
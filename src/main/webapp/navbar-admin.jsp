<%-- navbar-user.jsp --%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container d-flex justify-content-between">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/dashboard.jsp">Peminjaman Ruangan</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%= request.getContextPath() %>/admin/kelolaPeminjaman.jsp">Kelola Peminjaman</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/kelolaUser">Kelola User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/formRuangan">Kelola Ruangan</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/admin/about">About Us</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <span class="navbar-text me-3 text-white">
                    Halo, <%= session.getAttribute("loggedInUser") %>! (User)
                </span>
                <a class="btn btn-outline-light btn-sm" href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
            </div>  
        </div>
    </div>
</nav>
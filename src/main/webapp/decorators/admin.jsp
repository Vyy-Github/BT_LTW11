<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><dec:title default="Admin Panel - BookStore" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <dec:head />
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Header Admin -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold text-warning" href="${pageContext.request.contextPath}/admin/books">⚙️ ADMIN CONTROL PANEL</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">← Về trang chủ User</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
            </ul>
        </div>
    </nav>

    <!-- Thân trang Admin -->
    <div class="container-fluid mt-4 px-4 flex-grow-1">
        <dec:body />
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-auto border-top border-secondary">
        <p class="mb-0 text-muted">Hệ thống Quản trị WebBookStore_24110392</p>
    </footer>
</body>
</html>
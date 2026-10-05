<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><dec:title default="WebBookStore_24110392" /></title>
    <!-- Dùng Bootstrap 5 cho nhanh và đẹp -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <dec:head />
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
    <!-- Header / Menu -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">📚 BookStore</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
                    
                    <!-- Menu Giỏ hàng và Lịch sử đặt hàng -->
                    <li class="nav-item">
                        <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/cart">🛒 Giỏ hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-info fw-bold" href="${pageContext.request.contextPath}/order-history">📦 Lịch sử đơn hàng</a>
                    </li>
                    
                    <!-- Xử lý logic hiển thị Menu theo Session -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                            <!-- Nút Đăng xuất -->
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng xuất (${sessionScope.account.fullname})</a>
                            </li>
                            <!-- Trang quản trị chỉ hiện nếu là Admin -->
                            <c:if test="${sessionScope.account.is_admin == true}">
                                <li class="nav-item">
                                    <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/admin/books">Trang quản trị</a>
                                </li>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <!-- Nút Đăng nhập -->
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Thân trang (Nội dung động sẽ được đổ vào đây) -->
    <div class="container mt-4 flex-grow-1">
        <dec:body />
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <div class="container">
            <p class="mb-0 fw-semibold">Họ tên: Phan Nhật Vy | MSSV: 24110392 | Mã đề: 02</p>
        </div>
    </footer>
</body>
</html>
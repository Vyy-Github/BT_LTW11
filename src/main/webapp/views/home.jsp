<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hero Banner -->
<div class="p-5 mb-4 bg-primary text-white rounded-3 shadow text-center" style="background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80'); background-size: cover; background-position: center; position: relative;">
    <div style="background-color: rgba(0,0,0,0.6); position: absolute; top:0; left:0; width:100%; height:100%; border-radius: inherit;"></div>
    <div class="container-fluid py-5" style="position: relative; z-index: 1;">
        <h1 class="display-4 fw-bold">Chào mừng đến với Trạm Sách Tương Lai</h1>
        <p class="col-md-8 mx-auto fs-4">Nơi cung cấp những tựa sách lập trình, kinh tế và tiểu thuyết bản quyền mới nhất với mức giá cực kỳ ưu đãi.</p>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-warning btn-lg fw-bold mt-3">Khám phá ngay</a>
    </div>
</div>

<!-- Sách mới về (Hiển thị 3 cuốn) -->
<h3 class="mb-4 fw-bold border-bottom pb-2">🔥 Sách Mới Lên Kệ</h3>
<div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach items="${listB}" var="book" end="2">
        <div class="col">
            <div class="card h-100 shadow-sm border-0">
                <img src="${book.cover_image}" class="card-img-top p-3" alt="${book.title}" style="height: 300px; object-fit: contain; background: #f8f9fa;">
                <div class="card-body text-center">
                    <h5 class="card-title text-truncate fw-bold text-primary">${book.title}</h5>
                    <p class="card-text text-danger fs-5 fw-bold">${book.price} VNĐ</p>
                </div>
                <div class="card-footer bg-white border-0 text-center pb-3">
                    <a href="${pageContext.request.contextPath}/book-detail?id=${book.bookid}" class="btn btn-outline-primary w-100">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
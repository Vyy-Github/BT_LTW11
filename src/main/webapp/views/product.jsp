<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold m-0">Tất Cả Sản Phẩm</h3>
    <span class="text-muted">Đang hiển thị trang ${tag}</span>
</div>

<!-- Grid Layout hiển thị sách -->
<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <c:forEach items="${listB}" var="book">
        <div class="col">
            <div class="card h-100 shadow-sm book-card border-0">
                <div class="text-center p-3 bg-light">
                    <img src="${book.cover_image}" class="img-fluid rounded shadow-sm" alt="${book.title}" style="height: 250px; object-fit: cover;">
                </div>
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title text-primary fw-bold mb-1">${book.title}</h5>
                    <p class="text-muted small mb-2">NXB: ${book.publisher}</p>
                    <div class="d-flex justify-content-between align-items-center mt-auto">
                        <span class="fs-5 text-danger fw-bold">${book.price} đ</span>
                        <span class="badge bg-success">Còn ${book.quantity} cuốn</span>
                    </div>
                </div>
                <div class="card-footer bg-white border-top-0 pt-0">
                    <a href="${pageContext.request.contextPath}/book-detail?id=${book.bookid}" class="btn btn-primary w-100 fw-bold">Chi tiết</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Phân trang -->
<nav class="mt-5">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item ${tag == 1 ? 'disabled' : ''}">
            <a class="page-link" href="products?index=${tag - 1}">&laquo; Trang trước</a>
        </li>
        <c:forEach begin="1" end="${endP}" var="i">
            <li class="page-item ${tag == i ? 'active' : ''}">
                <a class="page-link" href="products?index=${i}">${i}</a>
            </li>
        </c:forEach>
        <li class="page-item ${tag == endP ? 'disabled' : ''}">
            <a class="page-link" href="products?index=${tag + 1}">Trang sau &raquo;</a>
        </li>
    </ul>
</nav>

<!-- Thêm xíu CSS cho đẹp -->
<style>
    .book-card { transition: transform 0.2s, box-shadow 0.2s; }
    .book-card:hover { transform: translateY(-5px); box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important; }
</style>
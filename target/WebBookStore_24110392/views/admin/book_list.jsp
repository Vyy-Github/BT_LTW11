<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-4 bg-white p-4 rounded shadow">
    <h2 class="text-primary fw-bold mb-4">Quản Lý Danh Sách Sách (Admin)</h2>
    
    <a href="${pageContext.request.contextPath}/admin/books?action=add" class="btn btn-success fw-bold mb-3">
        + Thêm Sách Mới
    </a>
    
    <table class="table table-hover table-bordered text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>Mã Sách</th>
                <th>Ảnh Bìa</th>
                <th>Tên Sách</th>
                <th>Nhà Xuất Bản</th>
                <th>Giá Tiền</th>
                <th>Kho</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listB}" var="book">
                <tr>
                    <td>${book.bookid}</td>
                    <td>
                        <img src="${book.cover_image}" alt="cover" style="width: 50px; height: 70px; object-fit: cover;">
                    </td>
                    <td class="text-start fw-bold text-primary">${book.title}</td>
                    <td>${book.publisher}</td>
                    <td class="text-danger fw-bold">${book.price} đ</td>
                    <td>${book.quantity}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/books?action=edit&id=${book.bookid}" class="btn btn-sm btn-warning fw-bold">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/books?action=delete&id=${book.bookid}" class="btn btn-sm btn-danger fw-bold" onclick="return confirm('Bạn có chắc chắn muốn xóa cuốn sách này?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- THANH PHÂN TRANG -->
    <nav aria-label="Page navigation" class="mt-4">
        <ul class="pagination justify-content-center">
            <c:forEach begin="1" end="${endP}" var="i">
                <li class="page-item ${tag == i ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/admin/books?index=${i}">${i}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>
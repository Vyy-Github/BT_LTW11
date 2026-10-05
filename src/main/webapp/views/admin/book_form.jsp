<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card shadow-sm mx-auto" style="max-width: 800px;">
    <div class="card-header bg-dark text-white">
        <h4 class="mb-0">${not empty book ? 'Sửa thông tin Sách' : 'Thêm Sách Mới'}</h4>
    </div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/admin/books" method="POST">
            <input type="hidden" name="action" value="${not empty book ? 'update' : 'insert'}">
            <c:if test="${not empty book}">
                <input type="hidden" name="bookid" value="${book.bookid}">
            </c:if>

            <div class="row mb-3">
                <div class="col-md-8">
                    <label>Tiêu đề sách</label>
                    <input type="text" name="title" class="form-control" value="${book.title}" required>
                </div>
                <div class="col-md-4">
                    <label>Mã ISBN</label>
                    <input type="number" name="isbn" class="form-control" value="${book.isbn}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Nhà xuất bản (Publisher)</label>
                    <input type="text" name="publisher" class="form-control" value="${book.publisher}">
                </div>
                <div class="col-md-6">
                    <label>Ngày xuất bản (YYYY-MM-DD)</label>
                    <input type="date" name="publish_date" class="form-control" value="${book.publish_date}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label>Giá (VNĐ)</label>
                    <input type="number" step="0.01" name="price" class="form-control" value="${book.price}" required>
                </div>
                <div class="col-md-4">
                    <label>Số lượng</label>
                    <input type="number" name="quantity" class="form-control" value="${book.quantity}" required>
                </div>
                <div class="col-md-4">
                    <label>Link Ảnh Bìa</label>
                    <input type="text" name="cover_image" class="form-control" value="${book.cover_image}">
                </div>
            </div>

            <div class="mb-3">
                <label>Mô tả chi tiết</label>
                <textarea name="description" class="form-control" rows="4">${book.description}</textarea>
            </div>

            <button type="submit" class="btn btn-primary px-5">Lưu Dữ Liệu</button>
            <a href="${pageContext.request.contextPath}/admin/books" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</div>
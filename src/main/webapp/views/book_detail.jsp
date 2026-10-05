<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card shadow-sm mb-4">
    <div class="row g-0">
        <!-- Ảnh bìa -->
        <div class="col-md-4 p-4 d-flex justify-content-center align-items-start bg-light border-end">
            <img src="${not empty book.cover_image ? book.cover_image : 'https://placehold.co/250x350?text=Cover'}" 
                 class="img-fluid rounded border shadow" alt="${book.title}">
        </div>
        
        <!-- Chi tiết sách -->
        <div class="col-md-8">
            <div class="card-body p-4">
                <h3 class="card-title text-primary fw-bold">Tiêu đề: ${book.title}</h3>
                <hr>
                <p class="fs-5 mb-2"><strong>Mã isbn:</strong> ${book.isbn}</p>
                <p class="fs-5 mb-2"><strong>Tác giả:</strong> Chưa cập nhật</p>
                <p class="fs-5 mb-2"><strong>Publisher:</strong> ${book.publisher}</p>
                <p class="fs-5 mb-2"><strong>Publisher_date:</strong> ${book.publish_date}</p>
                <p class="fs-5 mb-2"><strong>Quantity:</strong> ${book.quantity}</p>
                <p class="fs-5 mb-2 text-warning fw-bold"><strong>Reviews (${reviewCount})</strong></p>
                <h4 class="text-danger mt-3 fw-bold">Giá: ${book.price} VNĐ</h4>
                <p class="mt-3"><strong>Mô tả:</strong> ${book.description}</p>
                
                <!-- Form Thêm vào giỏ hàng -->
                <form action="${pageContext.request.contextPath}/cart-add" method="get" class="mt-4">
                    <input type="hidden" name="bookId" value="${param.id}"> 
                    <button type="submit" class="btn btn-warning fw-bold px-4 py-2 text-white shadow-sm">
                        🛒 Thêm vào giỏ hàng
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Khối Reviews -->
<div class="card shadow-sm mb-4 border-info">
    <div class="card-header bg-info text-white fw-bold fs-5">
        Reviews
    </div>
    <ul class="list-group list-group-flush">
        <c:choose>
            <c:when test="${empty reviews}">
                <li class="list-group-item text-muted">Chưa có bình luận nào. Hãy là người đầu tiên!</li>
            </c:when>
            <c:otherwise>
                <!-- Vòng lặp in [users]: [review_text] -->
                <c:forEach items="${reviews}" var="r">
                    <li class="list-group-item py-3">
                        <strong>[${r.fullname}]:</strong> 
                        <span class="ms-1">${r.review_text}</span>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<!-- Khối Form thêm reviews -->
<div class="card shadow-sm border-success">
    <div class="card-header bg-success text-white fw-bold fs-5">
        Form thêm reviews
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${not empty sessionScope.account}">
                <form action="${pageContext.request.contextPath}/book-detail" method="POST">
                    <!-- Sửa luôn biến này thành param.id để tránh lỗi nếu submit form review -->
                    <input type="hidden" name="bookid" value="${param.id}">
                    <div class="mb-3">
                        <textarea name="review_text" class="form-control" rows="3" placeholder="Viết đánh giá của bạn vào đây..." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary px-4 fw-bold">[Submit]</button>
                </form>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning mb-0">
                    Bạn cần <a href="${pageContext.request.contextPath}/login" class="fw-bold text-decoration-none">Đăng nhập</a> để có thể bình luận.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
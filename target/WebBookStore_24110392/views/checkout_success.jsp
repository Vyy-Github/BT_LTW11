<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt hàng thành công</title>
</head>
<body>
    <div class="container mt-5 text-center">
        <div class="card shadow border-0 rounded-4 mx-auto" style="max-width: 600px;">
            <div class="card-body p-5">
                <!-- Icon Success -->
                <div class="mb-4">
                    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#198754" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                    </svg>
                </div>
                
                <h2 class="fw-bold text-success mb-3">Đặt Hàng Thành Công!</h2>
                <p class="fs-5 text-muted mb-4">Cảm ơn bạn đã mua sắm. Đơn hàng thanh toán COD của bạn đã được ghi nhận và đang chờ xử lý.</p>
                
                <hr class="mb-4">
                
                <div class="d-flex justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-primary btn-lg fw-bold px-4">
                        Tiếp tục mua sắm
                    </a>
                    <a href="${pageContext.request.contextPath}/order-history" class="btn btn-primary btn-lg fw-bold px-4 shadow-sm">
                        Xem đơn hàng
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
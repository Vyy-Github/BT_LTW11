<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row justify-content-center mt-5">
    <div class="col-md-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h4 class="mb-0">Đăng nhập hệ thống</h4>
            </div>
            <div class="card-body">
                <!-- Bắt tham số msg từ VerifyOTPController chuyển sang -->
                <c:if test="${param.msg == 'RegisteredSuccessfully'}">
                    <div class="alert alert-success text-center">
                        Đăng ký tài khoản thành công! Vui lòng đăng nhập.
                    </div>
                </c:if>
                
                <!-- Thông báo lỗi đăng nhập -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger text-center">
                        ${error}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <input type="email" name="email" class="form-control" required placeholder="Nhập địa chỉ email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Mật khẩu</label>
                        <input type="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
                    </div>
                    <button type="submit" class="btn btn-primary w-100 fw-bold">Đăng nhập</button>
                </form>
                
                <div class="mt-3 text-center">
                    <p class="mb-0">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Đăng ký ngay</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
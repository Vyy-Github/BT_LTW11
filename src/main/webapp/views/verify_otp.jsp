<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row justify-content-center mt-5">
    <div class="col-md-5">
        <div class="card shadow">
            <div class="card-header bg-success text-white text-center">
                <h4>Xác thực OTP</h4>
            </div>
            <div class="card-body text-center">
                <p class="text-muted">Chúng tôi đã gửi 1 mã OTP 6 số vào email của bạn.</p>
                <p class="text-danger">${error}</p>
                <form action="${pageContext.request.contextPath}/verify-otp" method="POST">
                    <div class="mb-3">
                        <input type="text" name="otp" class="form-control text-center fs-4 fw-bold" placeholder="Nhập mã OTP" maxlength="6" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Xác thực & Kích hoạt</button>
                </form>
            </div>
        </div>
    </div>
</div>
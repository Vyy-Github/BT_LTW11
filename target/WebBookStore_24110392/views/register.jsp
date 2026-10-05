<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row justify-content-center mt-5">
    <div class="col-md-6">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h4>Đăng ký tài khoản</h4>
            </div>
            <div class="card-body">
                <p class="text-danger text-center">${error}</p>
                <form action="${pageContext.request.contextPath}/register" method="POST">
                    <div class="mb-3">
                        <label>Họ và Tên</label>
                        <input type="text" name="fullname" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Số điện thoại</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Mật khẩu</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đăng ký & Nhận OTP</button>
                </form>
            </div>
        </div>
    </div>
</div>
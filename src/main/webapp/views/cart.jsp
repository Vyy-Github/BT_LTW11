<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <%-- NẾU CHƯA ĐĂNG NHẬP: BÁO LỖI VÀ CHẶN LẠI --%>
    <c:when test="${empty sessionScope.account}">
        <div class="container text-center mt-5">
            <div class="alert alert-warning shadow-sm p-5 rounded-3" role="alert">
                <h2 class="alert-heading fw-bold mb-3">🔒 Vui lòng đăng nhập!</h2>
                <p class="fs-5">Bạn cần đăng nhập vào hệ thống để xem giỏ hàng và thanh toán.</p>
                <hr class="my-4">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg fw-bold px-4">Đến trang Đăng nhập ngay</a>
            </div>
        </div>
    </c:when>

    <%-- NẾU ĐÃ ĐĂNG NHẬP: HIỂN THỊ GIỎ HÀNG --%>
    <c:otherwise>
        <div class="container mt-4">
            <h2 class="fw-bold text-primary mb-4">🛒 Giỏ Hàng Của Bạn</h2>
            <div class="card shadow-sm border-0">
                <div class="card-body p-0">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4 py-3">ID Sách</th>
                                <th class="py-3">Số lượng</th>
                                <th class="text-end pe-4 py-3">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cartList}" var="item">
                                <tr>
                                    <td class="ps-4 fw-bold text-secondary">#${item.bookId}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/cart-update" method="post" class="d-flex align-items-center">
                                            <input type="hidden" name="id" value="${item.id}">
                                            <input type="number" name="quantity" value="${item.quantity}" min="1" max="10" class="form-control text-center me-2" style="width: 90px; font-weight: bold;">
                                            <button type="submit" class="btn btn-sm btn-outline-success fw-bold px-3">Cập nhật</button>
                                        </form>
                                    </td>
                                    <td class="text-end pe-4">
                                        <a href="${pageContext.request.contextPath}/cart-remove?id=${item.id}" class="btn btn-sm btn-danger fw-bold px-3">❌ Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty cartList}">
                                <tr>
                                    <td colspan="3" class="text-center py-5 text-muted">
                                        <h4 class="mb-3">Giỏ hàng của bạn đang trống</h4>
                                        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-primary fw-bold">Tiếp tục mua sắm</a>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Nút Thanh toán -->
            <c:if test="${not empty cartList}">
                <div class="text-end mt-4 mb-5">
                    <form action="${pageContext.request.contextPath}/checkout" method="post">
                        <button type="submit" class="btn btn-warning btn-lg fw-bold px-5 shadow text-dark" style="border-radius: 8px;">
                            📦 Tiến hành Thanh toán COD
                        </button>
                    </form>
                </div>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>
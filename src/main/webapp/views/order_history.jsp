<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <%-- NẾU CHƯA ĐĂNG NHẬP: BÁO LỖI VÀ CHẶN LẠI --%>
    <c:when test="${empty sessionScope.account}">
        <div class="container text-center mt-5">
            <div class="alert alert-warning shadow-sm p-5 rounded-3" role="alert">
                <h2 class="alert-heading fw-bold mb-3">🔒 Vui lòng đăng nhập!</h2>
                <p class="fs-5">Bạn cần đăng nhập vào hệ thống để có thể xem lịch sử đặt hàng cá nhân.</p>
                <hr class="my-4">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg fw-bold px-4">Đến trang Đăng nhập ngay</a>
            </div>
        </div>
    </c:when>

    <%-- NẾU ĐÃ ĐĂNG NHẬP: HIỂN THỊ LỊCH SỬ --%>
    <c:otherwise>
        <div class="container mt-4 mb-5">
            <h2 class="fw-bold text-info mb-4">📦 Lịch sử đặt hàng của bạn</h2>

            <!-- Thanh lọc trạng thái -->
            <ul class="nav nav-pills mb-4 flex-wrap gap-2">
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'ALL' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=ALL">Tất cả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Đơn hàng mới' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Đơn hàng mới">Đơn hàng mới</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Đã xác nhận' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Đã xác nhận">Đã xác nhận</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Chuẩn bị hàng' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Chuẩn bị hàng">Chuẩn bị hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Vận chuyển' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Vận chuyển">Vận chuyển</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Giao hàng' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Giao hàng">Giao hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Đã giao' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Đã giao">Đã giao</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Đơn hàng hủy' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Đơn hàng hủy">Đơn hàng hủy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold shadow-sm border ${currentStatus == 'Đơn hàng hoàn' ? 'active' : 'text-dark bg-white'}" href="${pageContext.request.contextPath}/order-history?status=Đơn hàng hoàn">Đơn hàng hoàn</a>
                </li>
            </ul>

            <!-- Bảng danh sách đơn hàng -->
            <div class="card shadow-sm border-0">
                <div class="card-body p-0">
                    <table class="table table-hover table-striped align-middle mb-0">
                        <thead class="table-dark">
                            <tr>
                                <th class="ps-4 py-3">Mã Đơn</th>
                                <th class="py-3">Ngày Đặt</th>
                                <th class="py-3">Tổng Tiền</th>
                                <th class="py-3">Phương Thức</th>
                                <th class="text-center pe-4 py-3">Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderList}" var="order">
                                <tr>
                                    <td class="ps-4 fw-bold text-primary">#${order.id}</td>
                                    <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm" /></td>
                                    <td class="text-danger fw-bold"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="VNĐ"/></td>
                                    <td><span class="badge bg-secondary px-2 py-1">${order.paymentMethod}</span></td>
                                    <td class="text-center pe-4">
                                        <c:choose>
                                            <c:when test="${order.status == 'Đơn hàng hủy' || order.status == 'Đơn hàng hoàn'}">
                                                <span class="badge bg-danger fs-6 p-2">${order.status}</span>
                                            </c:when>
                                            <c:when test="${order.status == 'Đã giao'}">
                                                <span class="badge bg-success fs-6 p-2">${order.status}</span>
                                            </c:when>
                                            <c:when test="${order.status == 'Đơn hàng mới'}">
                                                <span class="badge bg-primary fs-6 p-2">${order.status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning text-dark fs-6 p-2">${order.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty orderList}">
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">
                                        <h5 class="mb-0">Bạn chưa có đơn hàng nào ở trạng thái này.</h5>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
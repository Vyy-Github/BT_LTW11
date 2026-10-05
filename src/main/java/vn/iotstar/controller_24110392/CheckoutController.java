package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vn.iotstar.dao_24110392.CartItemDAO;
import vn.iotstar.dao_24110392.OrderDAO;
import vn.iotstar.model_24110392.CartItem;
// Import model User của bạn (vd: vn.iotstar.model_24110392.User) để lấy ID người dùng thực tế

@WebServlet(urlPatterns = { "/checkout" })
public class CheckoutController extends HttpServlet {
    CartItemDAO cartDao = new CartItemDAO();
    OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // KIỂM TRA ĐĂNG NHẬP: Lấy ID từ session (Thay 'account' bằng tên biến lưu User
        // của bạn)
        // Nếu project chưa có Login hoàn chỉnh, bạn có thể tạm giữ `int userId = 1;`
        int userId = 1;

        List<CartItem> cartList = cartDao.getCartByUserId(userId);

        if (cartList != null && !cartList.isEmpty()) {
            boolean success = orderDao.placeOrder(userId, cartList);
            if (success) {
                // Đặt hàng thành công -> Chuyển sang trang thông báo xịn xò
                req.getRequestDispatcher("/views/checkout_success.jsp").forward(req, resp);
                return;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
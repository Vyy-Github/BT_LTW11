package vn.iotstar.controller_24110392;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.model_24110392.CartItem;
import vn.iotstar.dao_24110392.CartItemDAO;

@WebServlet(urlPatterns = { "/cart", "/cart-add", "/cart-update", "/cart-remove" })
public class CartController extends HttpServlet {
    CartItemDAO cartDao = new CartItemDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        HttpSession session = req.getSession();

        // GIẢ SỬ MẶC ĐỊNH USER ID = 1 (Để test nhanh cho kịp tiến độ)
        // Khi nào có chức năng Login, bạn mở code lấy session này ra:
        // int userId = ((User) session.getAttribute("account")).getId();
        int userId = 1;

        if (path.equals("/cart")) {
            // Lấy danh sách hiển thị
            req.setAttribute("cartList", cartDao.getCartByUserId(userId));
            req.getRequestDispatcher("/views/cart.jsp").forward(req, resp);
        } else if (path.equals("/cart-add")) {
            int bookId = Integer.parseInt(req.getParameter("bookId"));
            int quantity = 1; // Mặc định thêm 1 cuốn

            CartItem existItem = cartDao.checkExist(userId, bookId);
            if (existItem != null) {
                // Nếu sách đã có, cộng dồn số lượng
                cartDao.updateQuantity(existItem.getId(), existItem.getQuantity() + quantity);
            } else {
                // Nếu chưa có, insert mới
                cartDao.insert(new CartItem(0, userId, bookId, quantity));
            }
            resp.sendRedirect(req.getContextPath() + "/cart");
        } else if (path.equals("/cart-remove")) {
            int id = Integer.parseInt(req.getParameter("id"));
            cartDao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if (path.equals("/cart-update")) {
            int id = Integer.parseInt(req.getParameter("id"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            // YÊU CẦU CỦA ĐỀ: THAY ĐỔI SỐ LƯỢNG TRONG GIỚI HẠN
            if (quantity < 1)
                quantity = 1;
            if (quantity > 10)
                quantity = 10; // Đặt giới hạn tối đa tùy ý

            cartDao.updateQuantity(id, quantity);
            resp.sendRedirect(req.getContextPath() + "/cart");
        }
    }
}
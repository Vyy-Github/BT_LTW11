package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.iotstar.dao_24110392.OrderDAO;
import vn.iotstar.model_24110392.Order;

@WebServlet(urlPatterns = { "/order-history" })
public class OrderHistoryController extends HttpServlet {
    OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int userId = 1; // Vẫn dùng ID mặc định để test

        // Nhận trạng thái từ thanh lọc (URL parameter)
        String status = req.getParameter("status");
        if (status == null) {
            status = "ALL"; // Nếu không bấm gì thì mặc định hiện TẤT CẢ
        }

        List<Order> orderList = orderDao.getOrdersByUserIdAndStatus(userId, status);

        req.setAttribute("orderList", orderList);
        req.setAttribute("currentStatus", status); // Truyền lại status để tô màu nút đang active

        req.getRequestDispatcher("/views/order_history.jsp").forward(req, resp);
    }
}
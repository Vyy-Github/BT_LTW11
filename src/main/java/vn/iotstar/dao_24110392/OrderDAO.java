package vn.iotstar.dao_24110392;

import vn.iotstar.model_24110392.CartItem;
import vn.iotstar.model_24110392.Order;
import vn.iotstar.config_24110392.DBConnection_24110392; // Đổi lại đúng tên class config của bạn nếu cần
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public boolean placeOrder(int userId, List<CartItem> cartList) {
        Connection conn = null;
        boolean isSuccess = false;

        try {
            conn = DBConnection_24110392.getConnection();
            conn.setAutoCommit(false);

            // 1. Tính tổng tiền dựa trên giá gốc của sách trong Database
            double totalAmount = 0;
            String sqlGetPrice = "SELECT price FROM books WHERE bookid = ?";
            PreparedStatement psPrice = conn.prepareStatement(sqlGetPrice);

            // Mảng lưu tạm giá của từng cuốn sách để dùng lại ở bước 3
            List<Double> actualPrices = new ArrayList<>();

            for (CartItem item : cartList) {
                psPrice.setInt(1, item.getBookId());
                ResultSet rsPrice = psPrice.executeQuery();
                double price = 0;
                if (rsPrice.next()) {
                    price = rsPrice.getDouble("price");
                }
                actualPrices.add(price);
                totalAmount += item.getQuantity() * price;
            }

            // 2. Tạo đơn hàng mới
            String sqlOrder = "INSERT INTO orders (user_id, order_date, total_amount, payment_method, status) VALUES (?, NOW(), ?, 'COD', 'Đơn hàng mới')";
            PreparedStatement psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setDouble(2, totalAmount);
            psOrder.executeUpdate();

            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // 3. Thêm chi tiết đơn hàng (lưu cứng giá tại thời điểm mua)
            String sqlDetail = "INSERT INTO order_details (order_id, book_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psDetail = conn.prepareStatement(sqlDetail);
            for (int i = 0; i < cartList.size(); i++) {
                CartItem item = cartList.get(i);
                psDetail.setInt(1, orderId);
                psDetail.setInt(2, item.getBookId());
                psDetail.setInt(3, item.getQuantity());
                psDetail.setDouble(4, actualPrices.get(i)); // Giá lấy từ DB
                psDetail.addBatch();
            }
            psDetail.executeBatch();

            // 4. Xóa giỏ hàng
            String sqlClearCart = "DELETE FROM cart_items WHERE user_id = ?";
            PreparedStatement psClearCart = conn.prepareStatement(sqlClearCart);
            psClearCart.setInt(1, userId);
            psClearCart.executeUpdate();

            conn.commit();
            isSuccess = true;
        } catch (Exception e) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
        return isSuccess;
    }

    // HÀM LẤY LỊCH SỬ ĐƠN HÀNG (GIỮ NGUYÊN NHƯ CŨ)
    public List<Order> getOrdersByUserIdAndStatus(int userId, String status) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ?";
        if (status != null && !status.isEmpty() && !status.equals("ALL")) {
            sql += " AND status = ?";
        }
        sql += " ORDER BY order_date DESC";

        try {
            Connection conn = DBConnection_24110392.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            if (status != null && !status.isEmpty() && !status.equals("ALL")) {
                ps.setString(2, status);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setReceiverName(rs.getString("receiver_name"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
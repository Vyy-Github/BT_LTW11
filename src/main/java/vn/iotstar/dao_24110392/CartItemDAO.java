package vn.iotstar.dao_24110392;

import vn.iotstar.model_24110392.CartItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.config_24110392.DBConnection_24110392;

public class CartItemDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // LẤY DANH SÁCH GIỎ HÀNG THEO USER
    public List<CartItem> getCartByUserId(int userId) {
        List<CartItem> list = new ArrayList<>();
        String query = "SELECT * FROM cart_items WHERE user_id = ?";
        try {
            conn = DBConnection_24110392.getConnection();// ĐỔI TÊN CLASS KẾT NỐI DB CỦA BẠN VÀO ĐÂY
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("book_id"),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // KIỂM TRA SÁCH ĐÃ CÓ TRONG GIỎ CHƯA
    public CartItem checkExist(int userId, int bookId) {
        String query = "SELECT * FROM cart_items WHERE user_id = ? AND book_id = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new CartItem(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("book_id"), rs.getInt("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // THÊM SÁCH VÀO GIỎ
    public void insert(CartItem item) {
        String query = "INSERT INTO cart_items(user_id, book_id, quantity) VALUES (?, ?, ?)";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, item.getUserId());
            ps.setInt(2, item.getBookId());
            ps.setInt(3, item.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // CẬP NHẬT SỐ LƯỢNG (GIỚI HẠN)
    public void updateQuantity(int id, int quantity) {
        String query = "UPDATE cart_items SET quantity = ? WHERE id = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // XÓA SÁCH KHỎI GIỎ
    public void delete(int id) {
        String query = "DELETE FROM cart_items WHERE id = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
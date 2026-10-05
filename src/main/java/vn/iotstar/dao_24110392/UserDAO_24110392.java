package vn.iotstar.dao_24110392;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.iotstar.config_24110392.DBConnection_24110392;
import vn.iotstar.model_24110392.User_24110392;

public class UserDAO_24110392 {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Hàm kiểm tra đăng nhập (Câu 2)
    public User_24110392 checkLogin(String email, String password) {
        // Câu lệnh truy vấn khớp email và mật khẩu
        String query = "SELECT * FROM users WHERE email = ? AND passwd = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            // Nếu có kết quả trả về -> Đăng nhập thành công, map vào Object User
            if (rs.next()) {
                return new User_24110392(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("fullname"),
                        rs.getInt("phone"),
                        rs.getString("passwd"),
                        rs.getTimestamp("signup_date"),
                        rs.getTimestamp("last_login"),
                        rs.getBoolean("is_admin"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu sai email hoặc password
    }

    // 2. Hàm thêm User mới vào Database (Dùng cho Đăng ký - Câu 2)
    public boolean insertUser(User_24110392 user) {
        String query = "INSERT INTO users (email, fullname, phone, passwd, signup_date, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFullname());
            ps.setInt(3, user.getPhone());
            ps.setString(4, user.getPasswd());
            ps.setTimestamp(5, user.getSignup_date());
            ps.setBoolean(6, user.isIs_admin());

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0; // Trả về true nếu insert thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
package vn.iotstar.config_24110392;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection_24110392 {
    // Cấu hình URL kết nối tới Database MySQL vừa tạo
    private static final String URL = "jdbc:mysql://localhost:3306/WebBookStore_24110392?useSSL=false&characterEncoding=UTF-8";

    // Mặc định username/password của XAMPP hoặc MySQL local (đổi 123456 nếu
    // password của bạn khác)
    private static final String USER = "root";
    private static final String PASSWORD = "mysql2006@";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Đăng ký Driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Mở kết nối
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Kết nối Database WebBookStore_24110392 thành công!");
        } catch (Exception e) {
            System.out.println("Lỗi kết nối Database: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    // Hàm main để chạy test thử kết nối ngay lập tức
    public static void main(String[] args) {
        getConnection();
    }
}
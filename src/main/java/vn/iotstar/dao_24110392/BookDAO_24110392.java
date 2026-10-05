package vn.iotstar.dao_24110392;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.config_24110392.DBConnection_24110392;
import vn.iotstar.model_24110392.Book_24110392;

public class BookDAO_24110392 {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Hàm đếm tổng số lượng sách trong bảng (Để tính số lượng trang)
    public int getTotalBooks() {
        String query = "SELECT COUNT(*) FROM books";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 2. Hàm lấy danh sách Sách có phân trang (Câu 3: 3sp/trang)
    // Trong MySQL, dùng LIMIT offset, số_lượng
    public List<Book_24110392> getBooksByPage(int index, int itemsPerPage) {
        List<Book_24110392> list = new ArrayList<>();
        // Tính toán vị trí bắt đầu lấy dữ liệu (offset)
        int offset = (index - 1) * itemsPerPage;

        String query = "SELECT * FROM books ORDER BY bookid DESC LIMIT ?, ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, offset);
            ps.setInt(2, itemsPerPage);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Book_24110392(
                        rs.getInt("bookid"),
                        rs.getInt("isbn"),
                        rs.getString("title"),
                        rs.getString("publisher"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getDate("publish_date"),
                        rs.getString("cover_image"),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. Hàm lấy chi tiết 1 cuốn sách theo ID (Dùng cho chức năng Sửa)
    public Book_24110392 getBookById(int id) {
        String query = "SELECT * FROM books WHERE bookid = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Book_24110392(
                        rs.getInt("bookid"), rs.getInt("isbn"), rs.getString("title"),
                        rs.getString("publisher"), rs.getDouble("price"), rs.getString("description"),
                        rs.getDate("publish_date"), rs.getString("cover_image"), rs.getInt("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 4. Hàm Thêm sách mới
    public boolean insertBook(Book_24110392 book) {
        String query = "INSERT INTO books (isbn, title, publisher, price, description, publish_date, cover_image, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, book.getIsbn());
            ps.setString(2, book.getTitle());
            ps.setString(3, book.getPublisher());
            ps.setDouble(4, book.getPrice());
            ps.setString(5, book.getDescription());
            ps.setDate(6, book.getPublish_date());
            ps.setString(7, book.getCover_image());
            ps.setInt(8, book.getQuantity());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Hàm Cập nhật sách
    public boolean updateBook(Book_24110392 book) {
        String query = "UPDATE books SET isbn=?, title=?, publisher=?, price=?, description=?, publish_date=?, cover_image=?, quantity=? WHERE bookid=?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, book.getIsbn());
            ps.setString(2, book.getTitle());
            ps.setString(3, book.getPublisher());
            ps.setDouble(4, book.getPrice());
            ps.setString(5, book.getDescription());
            ps.setDate(6, book.getPublish_date());
            ps.setString(7, book.getCover_image());
            ps.setInt(8, book.getQuantity());
            ps.setInt(9, book.getBookid());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 6. Hàm Xóa sách
    public boolean deleteBook(int id) {
        String query = "DELETE FROM books WHERE bookid = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
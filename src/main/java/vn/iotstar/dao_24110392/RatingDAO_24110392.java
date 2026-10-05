package vn.iotstar.dao_24110392;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.config_24110392.DBConnection_24110392;
import vn.iotstar.model_24110392.Rating_24110392;

public class RatingDAO_24110392 {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Lấy danh sách review theo bookid (Join với users để lấy fullname)
    public List<Rating_24110392> getReviewsByBook(int bookid) {
        List<Rating_24110392> list = new ArrayList<>();
        String query = "SELECT r.*, u.fullname FROM rating r JOIN users u ON r.userid = u.id WHERE r.bookid = ? ORDER BY r.rating DESC";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Rating_24110392(
                        rs.getInt("userid"), rs.getInt("bookid"),
                        rs.getInt("rating"), rs.getString("review_text"),
                        rs.getString("fullname")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Thêm bình luận mới (Hoặc cập nhật nếu đã bình luận)
    public boolean insertOrUpdateReview(Rating_24110392 r) {
        String query = "INSERT INTO rating (userid, bookid, rating, review_text) VALUES (?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE rating = ?, review_text = ?";
        try {
            conn = DBConnection_24110392.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, r.getUserid());
            ps.setInt(2, r.getBookid());
            ps.setInt(3, r.getRating());
            ps.setString(4, r.getReview_text());
            ps.setInt(5, r.getRating());
            ps.setString(6, r.getReview_text());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
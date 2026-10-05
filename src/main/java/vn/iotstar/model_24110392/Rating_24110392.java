package vn.iotstar.model_24110392;

public class Rating_24110392 {
    private int userid;
    private int bookid;
    private int rating;
    private String review_text;

    // Trường bổ sung để join bảng users lấy tên hiển thị
    private String fullname;

    public Rating_24110392() {
    }

    public Rating_24110392(int userid, int bookid, int rating, String review_text, String fullname) {
        this.userid = userid;
        this.bookid = bookid;
        this.rating = rating;
        this.review_text = review_text;
        this.fullname = fullname;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview_text() {
        return review_text;
    }

    public void setReview_text(String review_text) {
        this.review_text = review_text;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
}
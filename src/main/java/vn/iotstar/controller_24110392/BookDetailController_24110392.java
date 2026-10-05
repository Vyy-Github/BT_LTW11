package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao_24110392.BookDAO_24110392;
import vn.iotstar.dao_24110392.RatingDAO_24110392;
import vn.iotstar.model_24110392.Book_24110392;
import vn.iotstar.model_24110392.Rating_24110392;
import vn.iotstar.model_24110392.User_24110392;

@WebServlet(urlPatterns = { "/book-detail" })
public class BookDetailController_24110392 extends HttpServlet {

    BookDAO_24110392 bookDao = new BookDAO_24110392();
    RatingDAO_24110392 ratingDao = new RatingDAO_24110392();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        // 1. Lấy thông tin chi tiết sách
        Book_24110392 book = bookDao.getBookById(id);
        // 2. Lấy danh sách reviews
        List<Rating_24110392> reviews = ratingDao.getReviewsByBook(id);

        req.setAttribute("book", book);
        req.setAttribute("reviews", reviews);
        req.setAttribute("reviewCount", reviews.size());

        req.getRequestDispatcher("/views/book_detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập trước khi bình luận
        HttpSession session = req.getSession();
        User_24110392 user = (User_24110392) session.getAttribute("account");

        int bookid = Integer.parseInt(req.getParameter("bookid"));

        if (user == null) {
            // Chưa đăng nhập thì bắt quay qua trang đăng nhập
            resp.sendRedirect(req.getContextPath() + "/login?error=PleaseLoginFirst");
            return;
        }

        String reviewText = req.getParameter("review_text");
        int rating = 5; // Tạm fix cứng 5 sao, bạn có thể tự thêm ô nhập rating

        Rating_24110392 newReview = new Rating_24110392(user.getId(), bookid, rating, reviewText, user.getFullname());
        ratingDao.insertOrUpdateReview(newReview);

        // Load lại trang chi tiết sau khi comment xong
        resp.sendRedirect(req.getContextPath() + "/book-detail?id=" + bookid);
    }
}
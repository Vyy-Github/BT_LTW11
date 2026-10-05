package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao_24110392.BookDAO_24110392;
import vn.iotstar.model_24110392.Book_24110392;

// NHẬN CẢ 2 ĐƯỜNG DẪN
@WebServlet(urlPatterns = { "/home", "/products" })
public class HomeController_24110392 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy đường dẫn hiện tại người dùng đang truy cập
        String path = req.getServletPath();

        String indexPage = req.getParameter("index");
        if (indexPage == null)
            indexPage = "1";
        int index = Integer.parseInt(indexPage);

        BookDAO_24110392 dao = new BookDAO_24110392();

        // CHIA LOGIC: Trang products hiện 6 cuốn (Grid), trang home hiện 3 cuốn
        int pageSize = path.equals("/products") ? 6 : 3;

        int count = dao.getTotalBooks();
        int endPage = count / pageSize;
        if (count % pageSize != 0)
            endPage++;

        List<Book_24110392> list = dao.getBooksByPage(index, pageSize);

        req.setAttribute("listB", list);
        req.setAttribute("endP", endPage);
        req.setAttribute("tag", index);

        // ĐIỀU HƯỚNG GIAO DIỆN
        if (path.equals("/products")) {
            req.getRequestDispatcher("/views/product.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
        }
    }
}
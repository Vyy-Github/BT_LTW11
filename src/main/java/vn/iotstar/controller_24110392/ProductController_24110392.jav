package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.util.List;

// QUAN TRỌNG: Phải là javax, không được dùng jakarta
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao_24110392.BookDAO_24110392;
import vn.iotstar.model_24110392.Book_24110392;

// Đăng ký đường dẫn /products
@WebServlet(urlPatterns = {"/products"})
public class ProductController_24110392 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String indexPage = req.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        BookDAO_24110392 dao = new BookDAO_24110392();
        
        int pageSize = 6; // Hiển thị 6 cuốn sách 1 trang
        int count = dao.getTotalBooks();
        int endPage = count / pageSize;
        if (count % pageSize != 0) {
            endPage++;
        }

        List<Book_24110392> list = dao.getBooksByPage(index, pageSize);

        req.setAttribute("listB", list);
        req.setAttribute("endP", endPage);
        req.setAttribute("tag", index);

        // Trỏ về trang giao diện product.jsp
        req.getRequestDispatcher("/views/product.jsp").forward(req, resp);
    }
}
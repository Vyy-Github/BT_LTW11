package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

// Bắt buộc dùng javax
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao_24110392.BookDAO_24110392;
import vn.iotstar.model_24110392.Book_24110392;

@WebServlet(urlPatterns = {"/admin/books"})
public class AdminBookController_24110392 extends HttpServlet {
    
    BookDAO_24110392 bookDao = new BookDAO_24110392();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                req.getRequestDispatcher("/views/admin/book_form.jsp").forward(req, resp);
                break;
            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                Book_24110392 bEdit = bookDao.getBookById(idEdit);
                req.setAttribute("book", bEdit);
                req.getRequestDispatcher("/views/admin/book_form.jsp").forward(req, resp);
                break;
            case "delete":
                int idDel = Integer.parseInt(req.getParameter("id"));
                bookDao.deleteBook(idDel);
                resp.sendRedirect(req.getContextPath() + "/admin/books");
                break;
            default:
                String indexPage = req.getParameter("index");
                if (indexPage == null) indexPage = "1";
                int index = Integer.parseInt(indexPage);
                
                int pageSize = 10; 
                int count = bookDao.getTotalBooks();
                int endPage = count / pageSize;
                if (count % pageSize != 0) endPage++;

                List<Book_24110392> list = bookDao.getBooksByPage(index, pageSize);
                req.setAttribute("listB", list);
                req.setAttribute("endP", endPage);
                req.setAttribute("tag", index);
                
                req.getRequestDispatcher("/views/admin/book_list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        
        String action = req.getParameter("action"); 
        String bookidStr = req.getParameter("bookid"); 
        
        Book_24110392 book = new Book_24110392();
        if (bookidStr != null && !bookidStr.isEmpty()) {
            book.setBookid(Integer.parseInt(bookidStr));
        }
        book.setIsbn(Integer.parseInt(req.getParameter("isbn")));
        book.setTitle(req.getParameter("title"));
        book.setPublisher(req.getParameter("publisher"));
        book.setPrice(Double.parseDouble(req.getParameter("price")));
        book.setDescription(req.getParameter("description"));
        book.setPublish_date(Date.valueOf(req.getParameter("publish_date")));
        book.setCover_image(req.getParameter("cover_image"));
        book.setQuantity(Integer.parseInt(req.getParameter("quantity")));

        if ("update".equals(action)) {
            bookDao.updateBook(book);
        } else {
            bookDao.insertBook(book);
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/books");
    }
}
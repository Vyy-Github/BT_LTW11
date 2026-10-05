package vn.iotstar.controller_24110392;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao_24110392.UserDAO_24110392;
import vn.iotstar.model_24110392.User_24110392;

@WebServlet(urlPatterns = { "/login" })
public class LoginController_24110392 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Hiển thị giao diện đăng nhập
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO_24110392 userDao = new UserDAO_24110392();
        // Gọi hàm checkLogin đã viết ở DAO
        User_24110392 user = userDao.checkLogin(email, password);

        if (user != null) {
            // Đăng nhập thành công -> Lưu thông tin vào Session
            HttpSession session = req.getSession();
            session.setAttribute("account", user);

            // Kiểm tra vai trò: Admin -> /admin/home, User thường -> /home
            if (user.isIs_admin()) {
                resp.sendRedirect(req.getContextPath() + "/admin/books");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            // Đăng nhập thất bại -> Trả về trang đăng nhập kèm thông báo lỗi
            req.setAttribute("error", "Email hoặc mật khẩu không chính xác!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
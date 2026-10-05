package vn.iotstar.controller_24110392;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/logout" })
public class LogoutController_24110392 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Xóa session
        HttpSession session = req.getSession();
        session.removeAttribute("account");

        // Chuyển hướng về trang đăng nhập
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
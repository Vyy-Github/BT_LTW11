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

@WebServlet(urlPatterns = { "/verify-otp" })
public class VerifyOTPController_24110392 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String userOtp = req.getParameter("otp");

        HttpSession session = req.getSession();
        String sessionOtp = (String) session.getAttribute("otpCode");
        User_24110392 tempUser = (User_24110392) session.getAttribute("tempUser");

        if (sessionOtp != null && sessionOtp.equals(userOtp)) {
            // OTP hợp lệ -> Lưu vào Database
            UserDAO_24110392 userDao = new UserDAO_24110392();
            boolean isInserted = userDao.insertUser(tempUser);

            if (isInserted) {
                // Xóa session tạm
                session.removeAttribute("otpCode");
                session.removeAttribute("tempUser");
                // Chuyển hướng tới trang Đăng nhập
                resp.sendRedirect(req.getContextPath() + "/login?msg=RegisteredSuccessfully");
            } else {
                req.setAttribute("error", "Lỗi lưu Database!");
                req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/verify_otp.jsp").forward(req, resp);
        }
    }
}
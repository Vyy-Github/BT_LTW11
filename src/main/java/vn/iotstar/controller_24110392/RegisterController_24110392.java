package vn.iotstar.controller_24110392;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.model_24110392.User_24110392;
import vn.iotstar.service_24110392.EmailService_24110392;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController_24110392 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phoneStr = req.getParameter("phone");
        String password = req.getParameter("password");
        int phone = 0;

        try {
            phone = Integer.parseInt(phoneStr);
        } catch (Exception e) {
        }

        // Tạo đối tượng User tạm (chưa lưu vào DB vội)
        User_24110392 tempUser = new User_24110392();
        tempUser.setEmail(email);
        tempUser.setFullname(fullname);
        tempUser.setPhone(phone);
        tempUser.setPasswd(password);
        tempUser.setSignup_date(new Timestamp(System.currentTimeMillis()));
        tempUser.setIs_admin(false); // Mặc định là user thường

        // Sinh mã OTP 6 số
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        String otp = String.format("%06d", number);

        // Gửi OTP qua mail
        boolean isSent = EmailService_24110392.sendOTP(email, otp);

        if (isSent) {
            // Lưu tạm User và OTP vào Session để qua trang xác thực
            HttpSession session = req.getSession();
            session.setAttribute("tempUser", tempUser);
            session.setAttribute("otpCode", otp);

            resp.sendRedirect(req.getContextPath() + "/verify-otp");
        } else {
            req.setAttribute("error", "Lỗi gửi mail OTP. Vui lòng thử lại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}
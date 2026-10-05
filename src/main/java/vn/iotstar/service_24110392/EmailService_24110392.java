package vn.iotstar.service_24110392;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService_24110392 {
    // Cấu hình Email gửi đi
    private static final String FROM_EMAIL = "pnv14062006@gmail.com";
    private static final String APP_PASSWORD = "ftaxnnzbqsufzohl"; 

    public static boolean sendOTP(String toEmail, String otp) {
        boolean isSent = false;
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Mã OTP Đăng ký tài khoản WebBookStore");
            message.setText("Chào bạn,\n\nMã OTP để kích hoạt tài khoản của bạn là: " + otp
                    + "\n\nVui lòng không chia sẻ mã này cho bất kỳ ai.");

            Transport.send(message);
            isSent = true;
            System.out.println("Gửi OTP thành công tới: " + toEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSent;
    }
}
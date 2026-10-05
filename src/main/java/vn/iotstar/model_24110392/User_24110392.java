package vn.iotstar.model_24110392;

import java.sql.Timestamp;

public class User_24110392 {
    private int id;
    private String email;
    private String fullname;
    private int phone;
    private String passwd;
    private Timestamp signup_date; // Dùng Timestamp cho DATETIME
    private Timestamp last_login;
    private boolean is_admin; // Dùng boolean cho kiểu BIT trong DB

    // Constructor không tham số
    public User_24110392() {
    }

    // Constructor đầy đủ tham số
    public User_24110392(int id, String email, String fullname, int phone, String passwd, Timestamp signup_date,
            Timestamp last_login, boolean is_admin) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.passwd = passwd;
        this.signup_date = signup_date;
        this.last_login = last_login;
        this.is_admin = is_admin;
    }

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public Timestamp getSignup_date() {
        return signup_date;
    }

    public void setSignup_date(Timestamp signup_date) {
        this.signup_date = signup_date;
    }

    public Timestamp getLast_login() {
        return last_login;
    }

    public void setLast_login(Timestamp last_login) {
        this.last_login = last_login;
    }

    public boolean isIs_admin() {
        return is_admin;
    }

    public void setIs_admin(boolean is_admin) {
        this.is_admin = is_admin;
    }
}
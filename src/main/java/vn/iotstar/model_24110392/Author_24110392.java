package vn.iotstar.model_24110392;

import java.sql.Date;

public class Author_24110392 {
    private int author_id;
    private String author_name;
    private Date date_of_birth;

    public Author_24110392() {
    }

    public Author_24110392(int author_id, String author_name, Date date_of_birth) {
        this.author_id = author_id;
        this.author_name = author_name;
        this.date_of_birth = date_of_birth;
    }

    // Getters và Setters
    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }
}
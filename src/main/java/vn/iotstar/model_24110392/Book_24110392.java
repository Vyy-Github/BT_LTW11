package vn.iotstar.model_24110392;

import java.sql.Date;

public class Book_24110392 {
    private int bookid;
    private int isbn;
    private String title;
    private String publisher;
    private double price;
    private String description;
    private Date publish_date; // Dùng Date cho kiểu DATE
    private String cover_image;
    private int quantity;

    public Book_24110392() {
    }

    public Book_24110392(int bookid, int isbn, String title, String publisher, double price, String description,
            Date publish_date, String cover_image, int quantity) {
        this.bookid = bookid;
        this.isbn = isbn;
        this.title = title;
        this.publisher = publisher;
        this.price = price;
        this.description = description;
        this.publish_date = publish_date;
        this.cover_image = cover_image;
        this.quantity = quantity;
    }

    // Getters và Setters
    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(Date publish_date) {
        this.publish_date = publish_date;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
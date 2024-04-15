package com.yx.po;

/**
 * @author Weiney
 * @ToDo Book实体类，用于用户检索图书列表
 * @create 2023-06-16 0:01
 */
public class BookBean {
    private String name;    // 图书名称
    private String author;  // 作者
    private String publish; // 出版商
    private String isbn;    // IDBN
    private String introduction;    // 介绍
    private String language;    // 语言
    private double price;   // 价格

    public BookBean() {
    }

    public BookBean(String name, String author, String publish, String isbn, String introduction, String language, double price) {
        this.name = name;
        this.author = author;
        this.publish = publish;
        this.isbn = isbn;
        this.introduction = introduction;
        this.language = language;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BookBean{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publish='" + publish + '\'' +
                ", isbn='" + isbn + '\'' +
                ", introduction='" + introduction + '\'' +
                ", language='" + language + '\'' +
                ", price=" + price +
                '}';
    }
}

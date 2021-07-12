package ebook.model;

public class Product {
    private int id;
    private String sku;
    private String name;
    private Category category;
    private PublishingCompany publishingCompany;
    private String author;
    private int price;
    private int quantity;
    private String description;
    private String avatar;

    public Product() {
        this.id = -1;
        this.sku = "";
        this.name = "";
        this.category = null;
        this.publishingCompany = null;
        this.author = "";
        this.price = -1;
        this.quantity = -1;
        this.description = "";
        this.avatar = "";
    }

    public Product(int id, String sku, String name, Category category, PublishingCompany publishingCompany, String author, int price, int quantity, String description, String avatar) {
        this.id = id;
        this.sku = sku;
        this.name = name;
        this.category = category;
        this.publishingCompany = publishingCompany;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public PublishingCompany getPublishingCompany() {
        return publishingCompany;
    }

    public void setPublishingCompany(PublishingCompany publishingCompany) {
        this.publishingCompany = publishingCompany;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}

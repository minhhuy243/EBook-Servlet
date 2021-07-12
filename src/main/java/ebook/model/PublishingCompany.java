package ebook.model;

public class PublishingCompany {
    private int id;
    private String name;

    public PublishingCompany() {
        this.id = -1;
        this.name = "";
    }

    public PublishingCompany(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

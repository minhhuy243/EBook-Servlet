package ebook.model;

public class PurchaseDetail {
    private Purchase purchase;
    private Product product;
    private int quantity;
    private int totalAmount;

    public PurchaseDetail() {
        this.purchase = null;
        this.product = null;
        this.quantity = -1;
        this.totalAmount = -1;
    }

    public PurchaseDetail(Purchase purchase, Product product, int quantity, int totalAmount) {
        this.purchase = purchase;
        this.product = product;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
    }

    public Purchase getPurchase() {
        return purchase;
    }

    public void setPurchase(Purchase purchase) {
        this.purchase = purchase;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }
}

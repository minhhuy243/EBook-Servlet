package ebook.biz;

import ebook.dao.PurchaseDao;
import ebook.dao.PurchaseDetailDao;
import ebook.model.Product;
import ebook.model.ProductCart;
import ebook.model.Purchase;
import ebook.model.PurchaseDetail;

import java.util.List;

public class CheckoutBiz {

    private PurchaseDao purchaseDao;
    private PurchaseDetailDao purchaseDetailDao;

    public CheckoutBiz() {
        this.purchaseDao = new PurchaseDao();
        this.purchaseDetailDao = new PurchaseDetailDao();
    }

    public Purchase save(Purchase purchase, List<ProductCart> productCartList) {
        int purchaseGeneratedId = purchaseDao.save(purchase);
        purchase.setId(purchaseGeneratedId);

        PurchaseDetail purchaseDetail = new PurchaseDetail();
        purchaseDetail.setPurchase(purchase);

        for(ProductCart productCart : productCartList) {
            purchaseDetail.setProduct(productCart.getProduct());
            purchaseDetail.setQuantity(productCart.getQuantity());
            purchaseDetail.setTotalAmount(productCart.getProduct().getPrice() * productCart.getQuantity());
            purchaseDetailDao.save(purchaseDetail);
        }

        return purchase;
    }


}

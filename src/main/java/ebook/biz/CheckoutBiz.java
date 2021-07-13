package ebook.biz;

import ebook.dao.ProductDao;
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
    private ProductDao productDao;

    public CheckoutBiz() {
        this.purchaseDao = new PurchaseDao();
        this.purchaseDetailDao = new PurchaseDetailDao();
        this.productDao = new ProductDao();
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

            int quantity = productCart.getProduct().getQuantity() - productCart.getQuantity();
            productDao.updateByQuantity(productCart.getProduct().getId(), quantity);
        }



        return purchase;
    }


}

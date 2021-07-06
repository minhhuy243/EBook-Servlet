package ebook.biz;

import ebook.dao.CategoryDao;
import ebook.dao.ProductDao;
import ebook.dao.PublishingCompanyDao;
import ebook.model.Category;
import ebook.model.Product;
import ebook.model.PublishingCompany;

import java.util.List;

public class ProductBiz {

    private ProductDao productDao;
    private CategoryDao categoryDao;
    private PublishingCompanyDao publishingCompanyDao;

    public ProductBiz() {
        productDao = new ProductDao();
        categoryDao = new CategoryDao();
        publishingCompanyDao = new PublishingCompanyDao();
    }

    public int countAll(){
        return productDao.countAll();
    }

    public List<Product> findForPagination(int offset, int limit) {
        List<Product> productList = productDao.findForPagination(offset, limit);

        for(Product product : productList) {
            String categoryId = product.getCategory().getId();
            Category category = categoryDao.findById(categoryId);
            product.getCategory().setName(category.getName());

            int publishingCompanyId = product.getPublishingCompany().getId();
            PublishingCompany publishingCompany = publishingCompanyDao.findById(publishingCompanyId);
            product.getPublishingCompany().setName(publishingCompany.getName());
        }

        return productList;
    }
}

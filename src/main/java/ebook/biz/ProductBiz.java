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

    public List<Category> findAllCategory() {
        return categoryDao.findAll();
    }

    public List<PublishingCompany> findAllPublishing() {
        return publishingCompanyDao.findAll();
    }

    public int countAll(){
        return productDao.countAll();
    }

    public List<Product> findAll(int offset, int limit) {
        List<Product> productList = productDao.findAll(offset, limit);

//        for(Product product : productList) {
//            String categoryId = product.getCategory().getId();
//            Category category = categoryDao.findById(categoryId);
//            product.getCategory().setName(category.getName());
//
//            int publishingCompanyId = product.getPublishingCompany().getId();
//            PublishingCompany publishingCompany = publishingCompanyDao.findById(publishingCompanyId);
//            product.getPublishingCompany().setName(publishingCompany.getName());
//        }

        return productList;
    }

    public int countByName(String name){
        return productDao.countByName(name);
    }

    public List<Product> findByName(String name, int offset, int limit) {
        return productDao.findByName(name, offset, limit);
    }

    public int countByCategoryOrPublishing(String categoryId){
        return productDao.countByCategoryOrPublishing(categoryId);
    }

    public List<Product> findByCategoryOrPublishing(String categoryId, int offset, int limit) {
        return productDao.findByCategoryOrPublishing(categoryId, offset, limit);
    }

    // Detail Product
    public Product findById(int id) {
        Product product = productDao.findById(id);

        String categoryId = product.getCategory().getId();
        Category category = categoryDao.findById(categoryId);
        product.getCategory().setName(category.getName());

        int publishingCompanyId = product.getPublishingCompany().getId();
        PublishingCompany publishingCompany = publishingCompanyDao.findById(publishingCompanyId);
        product.getPublishingCompany().setName(publishingCompany.getName());

        return product;
    }

    // Home
    public List<Product> findTop10() {
        return productDao.findTop10();
    }
}

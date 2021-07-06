package ebook.dao;

import ebook.config.MySqlConnection;
import ebook.model.Category;
import ebook.model.Product;
import ebook.model.PublishingCompany;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ProductDao {
    public List<Product> findForPagination(int offset, int limit) {
        Connection connection = MySqlConnection.getConnection();
        List<Product> productList = new LinkedList<>();

        try {
            String query = "select * from product limit ?, ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, offset);
            statement.setInt(2, limit);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getInt("product_id"));
                product.setSku(rs.getString("sku"));
                product.setName(rs.getString("name"));
                product.setCategory(new Category(rs.getString("category_id"), ""));
                product.setPublishingCompany(new PublishingCompany(rs.getInt("publishing_company_id"), ""));
                product.setAuthor(rs.getString("author"));
                product.setPrice(rs.getInt("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setDescription(rs.getString("description"));
                product.setAvatar(rs.getString("avatar"));

                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productList;
    }

    public int countAll() {
        Connection connection = MySqlConnection.getConnection();
        int count = -1;
        try {
            String query = "select count(*) from product";

            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return count;
    }

    public Product findBySku(int id) {
        Connection connection = MySqlConnection.getConnection();

        try {
            String query = "select * from product where product_id = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getInt("product_id"));
                product.setSku(rs.getString("sku"));
                product.setName(rs.getString("name"));
                product.setCategory(new Category(rs.getString("category_id"), ""));
                product.setPublishingCompany(new PublishingCompany(rs.getInt("publishing_company_id"), ""));
                product.setAuthor(rs.getString("author"));
                product.setPrice(rs.getInt("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setDescription(rs.getString("description"));
                product.setAvatar(rs.getString("avatar"));

                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}

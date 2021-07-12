package ebook.dao;

import ebook.config.MySqlConnection;
import ebook.model.Category;
import ebook.model.Product;
import ebook.model.PublishingCompany;
import ebook.model.Purchase;

import java.sql.*;

public class PurchaseDao {

    public int save(Purchase purchase) {
        Connection connection = MySqlConnection.getConnection();

        try {
            String query = "insert into purchase(user_id, name, deliveryAddress, phonenumber, email, createdat, total)" +
                    "values (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, purchase.getUser().getId());
            statement.setString(2, purchase.getName());
            statement.setString(3, purchase.getAddress());
            statement.setString(4, purchase.getPhoneNumber());
            statement.setString(5, purchase.getEmail());
            statement.setString(6, purchase.getCreatedAt().toString());
            statement.setInt(7, purchase.getTotal());

            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if(generatedKeys.next()) {
                return generatedKeys.getInt(1);
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

        return -1;
    }
}

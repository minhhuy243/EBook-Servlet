package ebook.dao;

import ebook.config.MySqlConnection;
import ebook.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CategoryDao {
    public Category findById(String id) {
        Connection connection = MySqlConnection.getConnection();

        try {
            String query = "select * from category where category_id = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getString("category_id"));
                category.setName(rs.getString("category_name"));

                return category;
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

package ebook.dao;

import ebook.config.MySqlConnection;
import ebook.model.PublishingCompany;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PublishingCompanyDao {
    public PublishingCompany findById(int id) {
        Connection connection = MySqlConnection.getConnection();

        try {
            String query = "select * from publishing_company where publishing_company_id = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                PublishingCompany publishingCompany = new PublishingCompany();
                publishingCompany.setId(rs.getInt("publishing_company_id"));
                publishingCompany.setName(rs.getString("publishing_company_name"));

                return publishingCompany;
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

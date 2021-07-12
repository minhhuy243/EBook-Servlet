package ebook.dao;

import ebook.config.MySqlConnection;
import ebook.model.Purchase;
import ebook.model.PurchaseDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PurchaseDetailDao {

    public int save(PurchaseDetail purchaseDetail) {
        Connection connection = MySqlConnection.getConnection();

        try {
            String query = "insert into purchasedetail(purchase_id, product_id, quantity, totalamount)" +
                    "values (?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, purchaseDetail.getPurchase().getId());
            statement.setInt(2, purchaseDetail.getProduct().getId());
            statement.setInt(3, purchaseDetail.getQuantity());
            statement.setInt(4, purchaseDetail.getTotalAmount());

            return statement.executeUpdate();
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

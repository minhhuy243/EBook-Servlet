package ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ebook.config.MySqlConnection;
import ebook.model.User;

public class UserDao {
	
	public User findByEmail(String email) {
		Connection connection = MySqlConnection.getConnection();
		
		try {
			String query = "select * from user where email = ?";
			
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, email);
			
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				User user = new User(); 
				
				user.setId(rs.getInt("user_id"));
				user.setEmail(email);
				user.setPassword(rs.getString("password"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setAddress(rs.getString("address"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				
				return user;
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
	
	public User findByEmailAndPassword(User user) {
		Connection connection = MySqlConnection.getConnection();
		
		try {
			String query = "select * from user where email = ? AND password = ?";
			
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPassword());
			
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt("user_id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setAddress(rs.getString("address"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				
				return user;
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
	
	public int add(User user) {
		int result = -1;
		Connection connection = MySqlConnection.getConnection();
		
		try {
			String query = "insert into user(email, password, last_name, first_name, address, phonenumber) "
					+ "values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getLastName());
			statement.setString(4, user.getFirstName());
			statement.setString(5, user.getAddress());
			statement.setString(6, user.getPhoneNumber());
			
			result = statement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int updatePasswordByEmail(User user) {
		int result = -1;
		Connection connection = MySqlConnection.getConnection();

		try {
			String query = "update user set password = ? where email = ?";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getPassword());
			statement.setString(2, user.getEmail());

			result = statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
}

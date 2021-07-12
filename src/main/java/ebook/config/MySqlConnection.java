package ebook.config;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	/* database connection information */
//	private static final String url = "jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_79698f772917849";
//	private static final String username = "b6afcb701a72c4";
//	private static final String password = "c1707a61";
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			URI jdbUri = new URI(System.getenv("JAWSDB_URL"));

			String username = jdbUri.getUserInfo().split(":")[0];
			String password = jdbUri.getUserInfo().split(":")[1];
			String port = String.valueOf(jdbUri.getPort());
			String jdbUrl = "jdbc:mysql://" + jdbUri.getHost() + ":" + port + jdbUri.getPath();
			return DriverManager.getConnection(jdbUrl, username, password);
		} catch (ClassNotFoundException e) {
			// TODO:
			e.printStackTrace();
			System.out.println("Driver could not be found.");
		} catch (SQLException | URISyntaxException e) {
			// TODO:
			e.printStackTrace();
			System.out.println("Can not connect to database.");
		}
		return null;
	}
}

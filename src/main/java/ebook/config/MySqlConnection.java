package ebook.config;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	/* database connection information */
	private static final String url = "jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_79698f772917849";
	private static final String username = "b6afcb701a72c4";
	private static final String password = "c1707a61";
	
	public static Connection getConnection() {
		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			return DriverManager.getConnection(url, username, password);
			URI jdbUri = new URI(System.getenv("JAWSDB_URL"));

			String username = jdbUri.getUserInfo().split(":")[0];
			String password = jdbUri.getUserInfo().split(":")[1];
			String port = String.valueOf(jdbUri.getPort());
			String jdbUrl = "jdbc:mysql://" + jdbUri.getHost() + ":" + port + jdbUri.getPath();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
}

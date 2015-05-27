package umspack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	static Connection con;
	static
	{
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("ConnectDb Driver have error");
			}
			try {
				con = DriverManager.getConnection("jdbc:Mysql://localhost:3306/sanaroo_db","root","root");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("ConnectDb URL have problem");
			}
			System.out.println("Connection Initiating");
	}
	public static Connection initiateConnection()
	{		return con;	}


}

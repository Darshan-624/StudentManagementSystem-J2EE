package com.studentapp.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	public static Connection getConn() {
		Connection  con = null;
		
		try {
//			Class.forName("com.mysql.jdbc.cj.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp",
					"root",
					"Darshan@24");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return con;
	}
}

package com.account.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

public class DBUtils {
	@Autowired
	DataSource dataSource;
	
	//private  Connection conn;

	public Connection getConnection() {
		try {
			//conn = DriverManager.getConnection("jdbc:mysql://localhost/account_db?user=root&password=admin");
			return dataSource.getConnection();
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return null;
		}
	}
	
	public void testConnection() {
		try(Connection con = dataSource.getConnection();){
			if (null != con){
				System.out.println("Connected");
			}else {
				System.out.println("None Connection");
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}
	
	
}

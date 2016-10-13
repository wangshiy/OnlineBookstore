package com.mercury.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcUtil {
	private static final String DRIVER= "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@Shiyu:1521:XE";
	private static final String USERNAME = "wangshiy_jdbc";
	private static final String PASSWORD = "Wgo2013sld";
	public static Connection getConnection(){
		Connection conn=null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}

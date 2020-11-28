package controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private String id;
	private String password;
	private Connection conn;
	private String db;
	private String jdbc_driver;
	private String jdbc_url;
	
	public DBConnection(String db){
		this.db = db;
		id = "root";
		password = "5079";
		jdbc_driver = "com.mysql.jdbc.Driver";
		jdbc_url = "jdbc:mysql://localhost/"+db+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";		
		
	}
	
	public Connection connect(){		
		try {			
			Class.forName(jdbc_driver);
			conn = (Connection) DriverManager.getConnection(jdbc_url,id,password);			
		}catch(Exception e) {
			System.out.println("연결 오류" + e);
		}								
		return conn;		 
	}
}

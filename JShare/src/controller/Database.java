package controller;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Database {
	
	private Connection conn;	
	private PreparedStatement pstmt;
	private String sql;
	private ResultSet rs;
	private String table;
	
	public Database(String table) {		
		this.table = table;
		DBConnection conn = new DBConnection("jshare");		
		this.conn = conn.connect();		
	}
	
	// select 관련
	private ResultSet query(String sql, String value) throws SQLException {		
		pstmt = conn.prepareStatement(sql);
		if(value !=null) {
			pstmt.setString(1, value);
		}
        ResultSet rs = pstmt.executeQuery();
        
        return rs;
	}
	 
	
	// insert, update, delete 관련
	public boolean update(String sql, String[] values) throws SQLException {
		pstmt = conn.prepareStatement(sql);
		int i =1;
		for(String value : values) {
			pstmt.setString(i, value);			
			i++;
		}
		
        boolean rs = pstmt.execute();   
        return rs;
	}
	
	
	public ResultSet select(String offset) {
		try {
			sql = "SELECT * FROM " + table + " LIMIT 5 ";
			if(offset != null) {
				sql += " OFFSET " + offset;
			}					
			rs = query(sql, null);
		}catch(SQLException e) {
			System.out.print("SQL 오류  " + e);					
		}
		return rs;
	}
	
	// 값이 있는지 조회
	public ResultSet selectById(String id, String value, String offset){		
		try {
			if(offset != null) {
				sql = "SELECT * FROM " + table + " WHERE " + id + " = ? LIMIT 5 OFFSET " + offset; 
			}else {
				sql = "SELECT * FROM " + table + " WHERE " + id + " = ? ";							
			}
			
			rs = query(sql, value);			
		}catch(SQLException e) {
			System.out.print("SQL 오류  " + e);
		}
		return rs;
	}
	
	public int total(String column, String value) throws SQLException {		
		sql = "SELECT COUNT(*) FROM " + table;
		if(column != null) {
			sql += " WHERE " + column + " = ? ";
			rs = query(sql, value);
		}else {
			rs = query(sql, null);	
		}		
		int count = 0;
		while(rs.next()) {			
			count = rs.getInt(1);
		}		
		return count;
	}
	
	
	public boolean insert(String[] values) throws SQLException{		
		try {
			sql = "INSERT INTO " + table + " VALUES(?,?)";
			update(sql, values);
		}catch(SQLException e) {
			System.out.println(sql);
			System.out.print("SQL 오류  " + e);					
		}
		return true;
	}
	
	public boolean delete(String[] values) throws SQLException{		
		try {
			sql = "delete from" + table + "where id=14";
			update(sql, values);
		}catch(SQLException e) {
			System.out.println(sql);
			System.out.print("SQL 오류  " + e);					
		}
		return true;
	}
	
}

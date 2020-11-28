package controller;

import java.io.IOException;
import java.sql.*;


public class BoardController{
		
	
	public ResultSet categoryList() {
		String table = "category";
		Database cate = new Database(table);
		ResultSet category = cate.select(null);
		return category;
	}						

} 

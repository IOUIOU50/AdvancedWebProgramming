package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/template/board")
public class CategoryController extends HttpServlet{
   
   private static final long serialVersionUID = 1L;   
   private Database postTable;
   private Database categoryTable;
   private String categoryId;
   private ResultSet result;
   
   public CategoryController() {      
      postTable = new Database("post");
      categoryTable = new Database("category");
   }
   
   
   public int getList(String value) throws SQLException {
      int displayPage = 0;
      int displayRow = 5;
      int totalList = postTable.total(null, null);
      if(value != null) {
         totalList = postTable.total("category_id", value);          
         displayPage = (int) Math.ceil((double)totalList/displayRow);
         return displayPage;
      }
         displayPage = (int) Math.ceil((double)totalList/displayRow);
         
         return displayPage;
      
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String offset= null;
      int totalList = 0;            
      int page = 1;
      String title = null;
           
      
      if(request.getParameter("search") != null) {
         title = request.getParameter("search");        
      }
      
      // offset 설정
      if(request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page")); // 정수로 변환
         offset = Integer.toString((page-1)*5);
      }else {
         offset = "0";   
      }
                      
           
      if(request.getParameter("category") != null) { // 카테고리가 있을 경우
         categoryId = request.getParameter("category"); // category id 받음         
//         result = postTable.selectById("category_id", categoryId, offset);  
         
         result = postTable.selectInnerJoin("category", "category_id", "category_id", categoryId , offset, title);
         try {
            totalList = getList(categoryId);
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } // 카테고리별 리스트 생성
         
         request.setAttribute("list", result);
         request.setAttribute("totalList", totalList);         
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("./board.html.jsp");
          dispatcher.forward(request, response);         
      }else { // 전체 리스트 반환                              
         result = postTable.select(offset);                              
         
         try {
            totalList = getList(null);                        
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } // 전체를 반환                           
         ResultSet result2 = postTable.innerJoin("category","category_id", offset,title);
      
         request.setAttribute("list", result2);
         request.setAttribute("totalList", totalList);         
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("./board.html.jsp");
         dispatcher.forward(request, response);
      }
   }   

}
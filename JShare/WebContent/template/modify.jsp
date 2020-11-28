<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="controller.DBConnection"%>  

 <%
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/jsharing_integrated?useUnicode=true&characterEncoding=utf-8";
	String id = "root";
	String pass = "5079";
	
	String title = null;
	String context = null;
	int price = 0;
	java.util.Date period = null;
	String userId = null;
	
	int idx = Integer.parseInt(request.getParameter("id"));
	
	try {
		
// 		Connection conn = DriverManager.getConnection(url,id,pass);
		Connection conn = new DBConnection("jsharing_integrated").connect();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT post_title, post_context, post_price, post_period, user_id  FROM post WHERE post_id=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		
		if(rs.next()){
			title = rs.getString(1);
			context = rs.getString(2);
			price = rs.getInt(3);
			period = rs.getDate(4);
			userId = rs.getString(5);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e) {
		out.println( e.toString() );
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <script language = "javascript">  // 자바 스크립트 시작

function modifyCheck()
  {
   var form = document.modifyform;
   
   
  if( form.title.value == null)
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( form.context.value == null)
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  }
 </script>
 
 </head>
 <body>
 <jsp:include page = "header.jsp"/>				
 
<table>
<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="text-align:center;">
      <td></td>
      <td>수정</td>
      <td></td>
     </tr>
    </table>
   <table>
        <tr>
      <td>&nbsp;</td>
      <td align="center">글번호</td>
      <td><input type=text name=id size=50  maxlength=50 value="<%=idx%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td><input type=text name=name size=50  maxlength=50 value="<%=session.getAttribute("id")%>" readonly></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">대여기간</td>
      <td><input type=text name=period size=50  maxlength=50 value="<%=period%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr>
      <td>&nbsp;</td>
      <td align="center">가격</td>
      <td><input type=text name=price size=50  maxlength=50 value="<%=price%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name=context cols=50 rows=13><%=context%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
      <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
 <jsp:include page = "footer.html"/>
</body>
 </html>
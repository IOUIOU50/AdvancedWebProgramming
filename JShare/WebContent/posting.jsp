<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
 <title>게시글</title>
 </head>
 
 <style>
 body {
      padding: 0;
      margin: 0;
      background : rgba(0, 0, 0, 0);
    }

    .header {
      margin: 20px 0;
      text-align: center;
      position : relative;
    }

    .header a {

    }

    hr {
      margin-top: 30px;
    }

    .title {
      display: inline;
      margin-right: 100px;
    }

    .menu {
      text-decoration : none;
      margin-left: 30px;
      color :black;
    }

    .category a {
      text-decoration: none;
      padding: 0 10px;
      color: black;
      transition: 0.3s;
    }

    .category a:hover {
      color: white;
      background-color: #111010d1;
    }

    .search {
      width: 400px;
      border-radius: 10px;
      padding: 7px 3px;
    }

    .board {
      width: 60%;
      margin: auto;
      text-align: center;
    }

    #title {
      width: 60%;
    }

    i{
      font-size : 25px;
    }
    .fa-search{
      position : absolute;
      z-index: 1;
      top : 20px;
      right : 40.2%;
      font-size : 24px;
      color : black;
    }
    input.search:focus{
      outline : none;
    }
    table{
    width : 60%;
    margin : auto;
    }
    </style>
 <body>
 <header>
    <div class="header">
      <h1 class="title">JSharing</h1>
        <a href=""><i class="fas fa-search"></i></a>
        <input type="text" name="search" class="search">
        <a href="./sharing" class = "menu"><i class="far fa-handshake"></i>  쉐어링 하기  </a>
        <a href="./board" class = "menu"><i class="far fa-clipboard"></i>  게시판</a>
      <hr>

      <ul class="category">
        <a href="">전자기기</a>
        <a href="">스포츠</a>
        <a href="">가구</a>
        <a href="">패션/잡화</a>
        <a href="">취미</a>
      </ul>
    </div>
  </header>
<hr>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;
			font-weight: bold; 
			font-size: 1.5em;
			line-height: 1.0em; 
			font-family: arial;" >
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      	<td>[덕진구/금암동] 전자레인지 빌려드려요</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76"></td>
      <td width="0"><img src="images.jpg" alt="My Image" width="400" height="200"></td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">분류</td>
      <td width="0">전자기기</td>
     </tr>
        <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">희망 가격</td>
      <td width="0">200,000원</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">대여기간</td>
      <td width="0">2개월</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">내용</td>
      <td width="0">11/20일까지만 올리고 내려요.<br>
사용감 있어요.<br>
내부 닦고 사용하세요.<br>
시간이 없어 닦아드리지 못해하고 성능 좋아요.<br><br>

현재도 50만원대로 팔리는 제품이에요.<br>
3년정도 사용했어요.</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="0">20</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성자</td>
      <td width="0">문현호</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="0">2020-11-13</td>
     </tr>
    

                <tr>
      <td width="0"></td>
                </tr>
               
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399">
	<input type=button value="답글">
	<input type=button value="목록">
	<input type=button value="수정">
	<input type=button value="삭제">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>

</html>
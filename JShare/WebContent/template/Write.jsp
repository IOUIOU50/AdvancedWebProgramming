<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
		if(session.getAttribute("id")==null){
			out.print("<script>self.window.alert('로그인이 필요합니다.'); location.href=\'login.html';</script>");
		}
	%>
<!DOCTYPE html>
<html>

<head>
<title>JSharing-셰어링하기</title>
</head>
<style>
.table {
	margin: auto;
	width: 70%;
}
</style>

<body>
	<jsp:include page="header.jsp" />
	<table>
		<tr
			style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
			<td width="5"><img src="img/table_left.gif" width="5"
				height="30" /></td>
			<td>글쓰기</td>
			<td width="5"><img src="img/table_right.gif" width="5"
				height="30" /></td>
		</tr>
	</table>
	<form name=writeform method="POST" enctype="multipart/form-data"
		action="Write_ok.jsp" pageEncoding="UTF-8">
		<table class="table">
			<tr>
				<td>&nbsp;</td>
				<td align="center">제목</td>
				<td><input name="title" size="50" maxlength="100"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">분류</td>
				<td><select name="category" id="category">
						<option value="1">전자기기</option>
						<option value="2">스포츠</option>
						<option value="3">패션/잡화</option>
						<option value="4">가구</option>
						<option value="5">취미</option>
				</select>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">희망가격</td>
				<td><input name="price" size="50" maxlength="50"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">대여기간</td>
				<td><input name="period" size="10" maxlength="50" margin="1">까지(yyyy-mm-dd
					형태로 작성)</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			<tr>
				<td>&nbsp;</td>
				<td align="center">사진첨부</td>
				<td><input type="file" name="file">(최대 3MB)</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">내용</td>
				<td><textarea name="context" cols="50" rows="13"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="4"></td>
			</tr>
			<tr align="center">
				<td>&nbsp;</td>
				<td colspan="2"><input type=button value="등록"
					onclick="javascript:writeCheck()"> <input type=button
					value="취소" onclick="javascript:history.back(-1)">
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	<script language="javascript">
		// 자바 스크립트 시작

		function writeCheck() {
			var form = document.writeform;

			form.submit();
		}
	</script>
</body>

</html>
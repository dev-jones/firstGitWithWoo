<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="viewPage.jsp" name="frmName" method="post" enctype="multipart/form-data">
	user<br>
	<input name="user"><br>
	
	title<br>
	<input name="title"><br>
	
	file<br>
	<input type="file" name="uploadFile"><br>
	<input type="submit" value="uploadPic">
</form>
</body>
</html>
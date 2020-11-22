<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String saveFolder = "C:/Users/DELL/Documents/workspace/SelfieToFormal/WebContent/filestorage";
String encType = "UTF-8";
int maxSize = 100 * 1024 * 1024;

ServletContext context = getServletContext();
ArrayList saveFiles = new ArrayList();
ArrayList origFiles = new ArrayList();

String user = "";
String title ="";
String content = "";

try {
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	user = multi.getParameter("user");
	title = multi.getParameter("title");
	content = multi.getParameter("content");
	
	Enumeration files = multi.getFileNames();
	
	while(files.hasMoreElements()) {
		
		String name = (String)files.nextElement();
		
		saveFiles.add(multi.getFilesystemName(name));
		origFiles.add(multi.getOriginalFileName(name));
	}
%>
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
	<tr>
		<td width="10%" bgcolor="#FFCC00">
			<div align="center"><strong>user</strong></div>
		</td>
		<td width="30%">
			<%=user %>
		</td>
		<td width="10%" bgcolor="#FFCC00">
			<div align="center"><strong>title</strong></div>
		</td>
		<td width="30%">
			<%=title %>
		</td>
	</tr>
	<tr>
		<td width="10%" bgcolor="#FFCC00">
			<div align="center"><strong>content</strong></div>
		</td>
		<td width="50%" colspan="3">
			<textarea rows="5" cols="50" disabled="disabled"><%=content %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" bgcolor="#ffffff">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4"><strong>업로드된 파일들입니다.</strong></td>
	</tr>
	<%
	for(int i = 0; i < saveFiles.size(); i++) {
	%>
		<tr bgcolor="#FFCC00">
			<td colspan="4">
				<a href="<%="./filestorage/" + saveFiles.get(i) %>"><strong><%=origFiles.get(i) %></strong></a>
			</td>
		</tr>
	<%
	}
	%>
</table>
<%	
}catch (Exception e) {
	System.out.println("e : " + e);
}
%>

</body>
</html>
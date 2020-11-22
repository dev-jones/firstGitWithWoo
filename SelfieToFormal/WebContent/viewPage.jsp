<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String encType="UTF-8";
int maxSize = 1024 * 1024 * 100;

try {
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	Enumeration params = multi.getParameterNames();
	
	while(params.hasMoreElements()) {
		
		String name = (String)params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + " = " + value + "<br>");
		
	}
	
	Enumeration files = multi.getFileNames();
	
	while(files.hasMoreElements()) {
		
		String name = (String)files.nextElement();
		
		String filename = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		
		File f = multi.getFile(name);
		
		out.println("파라미터 이름 : " + name + "<br>");
		out.println("실제 파일이름 : " + original + "<br>");
		out.println("저장된 파일이름 : " + filename + "<br>");
		
		if(f != null) {
			out.println("크기 : " + f.length() + " 바이트");
			out.println("<br>");
		}
		
	}
	
	
}catch (IOException e) {
	System.out.println("e : " + e);
}catch (Exception ex) {
	System.out.println("ex : " + ex);
}

%>


</body>
</html>
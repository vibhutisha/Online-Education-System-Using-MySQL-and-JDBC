<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Help</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userEmail=request.getParameter("UserGmail"); 
//session.setAttribute("userid",userid); 
String prob=request.getParameter("Problem");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineeducationsystem","root","vibhuti"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into helps values ('"+userEmail+"','"+prob+"')"); 
%>

<p> Your query has been successfully submitted!! We will get back to you soon</p>
<a href="index.html">Home</a>
</body>
</html>
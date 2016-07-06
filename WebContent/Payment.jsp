<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
</head>
<body><body>
<h4>Payment successfully processed</h4>
<a href="index.html">Home</a>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String studID=request.getParameter("userid"); 
	String studName=request.getParameter("name"); 

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineeducationsystem","root",""); 
Statement st= con.createStatement(); 
int i=st.executeUpdate("insert into payment values ('"+studName+"','"+studID+"')");
%>
</body>
</html>
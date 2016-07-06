<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo Regjsp</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user_name=request.getParameter("fullname"); 
String user=request.getParameter("userid"); 
session.putValue("userid",user); 
String pwd=request.getParameter("pwd");  
String email=request.getParameter("email"); 
String phone = request.getParameter("phone");
String subject=request.getParameter("subject");
String courseid=request.getParameter("courseid");
String video="video";
String schedule="schedule";
String lectureslide="lec";
String syllabus="syllabus";
String a_manage="a_manage";
String adminid="root";

try{
	Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineeducationsystem","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs; 
//int i=st.executeUpdate("insert into course_faculty values ('"+user_name+"','"+user+"','"+pwd+"','"+email+"','"+phone+"')"); 

int i=st.executeUpdate("insert into course_faculty values ('"+subject+"','"+courseid+"','"+123+"','"+25+"','"+video+"','"+schedule+"','"+lectureslide+"','"+syllabus+"','"+phone+"','"+email+"','"+user+"','"+user_name+"','"+subject+"','"+a_manage+"','"+40+"','"+adminid+"')"); 
}
catch(SQLException e){
	e.printStackTrace();
}
out.println("Registered"); 


%>
<a href ="login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>certificate</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%

String receiveCertsuserID=request.getParameter("User_ID"); 
String receiveCertccourseID=request.getParameter("Course_ID");
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineeducationsystem","root",""); 
Statement st= con.createStatement(); 
int i=st.executeUpdate("insert into receivecertificate values ('"+receiveCertsuserID+"','"+receiveCertccourseID+"')"); 
}
catch(SQLException e){
	e.printStackTrace();
}
out.println("Thanks. We will email you the certificate within two working days");
%>
</br></br>
<a href="index.html">Home</a>

</body>
</html>
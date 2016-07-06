<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>New Student Registration Page</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style55.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Succesfully <span>Registered!</span></span></h1>
		</div>
		
		<%
String user_name=request.getParameter("fullname"); 
String user=request.getParameter("userid"); 
session.putValue("userid",user); 
String pwd=request.getParameter("pwd");  
String email=request.getParameter("email"); 
String phone = request.getParameter("phone");
 

try{
	Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineeducationsystem","root","vibhuti"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into student values ('"+user_name+"','"+user+"','"+pwd+"','"+email+"','"+phone+"')"); 
}
catch(SQLException e){
	e.printStackTrace();
}
out.println("Registered"); 


%>
		
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2><a href ="login2.jsp">LOGIN</a></h2>
			</div>
			</div>
			<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2><a href ="index.html">HOME PAGE</a></h2>
			</div>
			</div>
	</div>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>List of Students</title>
    
    
    
    
        <link rel="stylesheet" href="css/style66.css">

    
    
    
  </head>

  <body>

    <html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Table Style</title>
	<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
</head>

<body>
<div class="table-title">
<h3>List of Students</h3>
</div>
<%!
		public class Actor{
	
	String URL = "jdbc:mysql://localhost:3306/onlineeducationsystem";
	String USERNAME = "root";
	String PASSWORD = "vibhuti";
	
	Connection connection = null;
	PreparedStatement selectActors = null;
	ResultSet resultSet = null;
	
	
	public Actor() {
		try{
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			selectActors = connection.prepareStatement(
					"SELECT name, studentuserID, password,email,phonenumber FROM student" 
					);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public ResultSet getActors(){
		
		try{
			resultSet = selectActors.executeQuery();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return resultSet;	
	}
}
%>
<%
		Actor actor = new Actor();
		ResultSet actors = actor.getActors();
		

%>

<table class="table-fill">
<thead>
<tr>
<th class="text-left">Student Name</th>
<th class="text-left">Student ID</th>
<th class="text-left">Password</th>
<th class="text-left">Email ID</th>
<th class="text-left">Phone</th>
</tr>
</thead>
<tbody class="table-hover">
<% while (actors.next()){ %>
<tr>
<td class="text-left"><%= actors.getString("name") %></td>
<td class="text-left"><%= actors.getString("studentuserID") %></td>
<td class="text-left"><%= actors.getString("password") %></td>
<td class="text-left"><%= actors.getString("email") %></td>
<td class="text-left"><%= actors.getString("phonenumber") %></td>

</tr>
<% } %>
</tbody>
</table>

<h3><a href="adminhome.jsp">Back</a></h3>
  

  </body>
    
    
    
    
    
  </body>
</html>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    
    
    
    
        <link rel="stylesheet" href="css/style66.css">

    
    
    
  </head>

  <body onLoad = "displayResults()">

    
<head>
	<meta charset="utf-8" />
	<title>Delete Student</title>
	<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
</head>

<body>
<div class="table-title">
<h3>Delete Student</h3>
</div>
<%!
		public class Actor{
	
	String URL = "jdbc:mysql://localhost:3306/onlineeducationsystem";
	String USERNAME = "root";
	String PASSWORD = "vibhuti";
	
	Connection connection = null;
	PreparedStatement selectActors = null;
	PreparedStatement deleteActor = null;
	ResultSet resultSet = null;
	
	
	public Actor() {
		try{
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			selectActors =  connection.prepareStatement(
					"SELECT name, studentuserID, password, email, phonenumber FROM student");
			
			deleteActor =  connection.prepareStatement(
					"DELETE FROM student WHERE studentuserID = ?");
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public ResultSet getActors() {
		try{
			resultSet = selectActors.executeQuery();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return resultSet;
	}
	
	public int deleteActor(String id){
		
		int result = 0;
		try{
			deleteActor.setString(1,id); // set ID for 1 column like for ctor name = somthing set corresponding ID
			result = deleteActor.executeUpdate();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		return result;
		
	}
}
%>

<%
	int result = 0;

	Actor actor = new Actor();
	ResultSet actors = actor.getActors();
	String actorId = new String();
	
	if(request.getParameter("submit") != null){
		actorId = request.getParameter("actor");
		result = actor.deleteActor(actorId);
	}
%>
<form name="myForm" action="newdeletestudent.jsp" method="POST">

<table class="table-fill">
<thead>
<tr>
<th class="text-left">Student Name</th>
</tr>
</thead>
<tbody class="table-hover">

<tr>
<td class="text-left"><select name="actor"><% while (actors.next()){ %><option value="<%= actors.getInt("studentuserID") %>"><%= actors.getString("name") %></option><%} %></select></td>

</tr>
</tbody>
</table>

<input type="hidden" name="hidden" value="<%= result %>" />
<input type="submit" value="DELETE STUDENT" name="submit" />


</form>

<SCRIPT LANGUAGE="JavaScript">
<!--
	function displayResults()
	{
		if(document.myForm.hidden.value=1){
				alert("Data Deleted")
		}
	}
	//-->
</SCRIPT>

<h3><a href="index.html">Return to Homepage</a></h3>



<h3><a href="adminhome.jsp">Back</a></h3>
  

  </body>
    
    
    
    
    
  </body>
</html>

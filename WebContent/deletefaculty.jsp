<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting a Faculty!</title>
</head>
<body onLoad = "displayResults()">
<h1>Deleting a Faculty!</h1>
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
					"SELECT name, courseID, fees, videos, schedule,lectureslides, syllabus, facultyphonenumber, facultyemailID, facultyID FROM course_faculty");
			
			deleteActor =  connection.prepareStatement(
					"DELETE FROM course_faculty WHERE courseID = ?");
			
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
<form name="myForm" action="deletefaculty.jsp" method="POST">
<table border="0">
	<tbody>
		<tr>
			<td>faculty name: </td>
			<td><select name="actor">
				<% while (actors.next()){ %>
				<option value="<%= actors.getString("courseID") %>"><%= actors.getString("name") %></option>
				<%} %>
			</select></td>
		</tr>
	</tbody>
</table>
<input type="hidden" name="hidden" value="<%= result %>" />
<input type="submit" value="Submit" name="submit" />


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

<h1><a href="index.html">Return to Homepage</a></h1>


</body>
</html>
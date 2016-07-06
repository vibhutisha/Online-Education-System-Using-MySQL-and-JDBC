<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>List of Courses Avalaible!!</h1>
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
					"SELECT name, courseID, fees FROM course_faculty" 
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

		<table border="1">
		<tbody>
		<tr>
			<td>Faculty Name</td>
			<td>Course ID</td>
			<td>Fees</td>
		</tr>
		<% while (actors.next()){ %>
		<tr>
			<td><%= actors.getString("name") %></td>
			<td><%= actors.getString("courseID") %></td>
			<td><%= actors.getInt("fees") %></td>
		</tr>
		<% } %>
		</tbody>
		</table>
		

<form action="newenroll.jsp" method="post" >

Student ID :<input type="text" name="studentID" />
Course ID :<input type="text" name="courseID" />
<input type="submit" />
</form>

</body>
</html>
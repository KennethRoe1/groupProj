<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type ="text/css" href= "styles/main.css">
<meta charset="utf-8">
<title>1-2-1 Fitness</title>
</head>
<body>
<div class="banner">
<img src="images/head.JPG" alt="Gym logo" width="60%" height="180"/>
</div>
<div id="nav_bar">
  	<ul>
  	<li><a href="userinfo.jsp">Account Info</a></li>
    <li><a href="AddStaff.html">Add Staff</a></li>
	<li><a href="DeleteStaff.jsp">Delete Staff</a></li>
	<li><a href="FitnessClasses.html">Update Staff Details</a></li>
	<li><a href="ContactUs.html">View Staff Details</a></li>
	<li><a href='logout.jsp'>Log Out</a></li>
 	</ul>
</div>
<form action="DeleteStaff1.jsp" method="get" name="delete_staff_form" id="delete_staff_form">
	<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	int count=0;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/fitness";
	    con = DriverManager.getConnection(url, "root", "");
	    stmt = con.createStatement();
	    rs = stmt.executeQuery("Select users.user_id, first_name, last_name, email, pasword, dob from users INNER JOIN staff on users.user_id=staff.user_id;");
	%>
	<div class="delete_staff_table">
	<fieldset>
		<legend>Delete Staff</legend>
		<table width="100%">

			<tr><th>First_Name</th><th>Last_Name</th><th>Email</th><th>Password</th><th>DOB</th><th>Type</th><th>Select</th></tr>
	
			<% while (rs.next()) {%>

			<tr>
			<td><%=rs.getString("first_name")%></td><td><%=rs.getString("last_name")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("pasword")%></td><td><%=rs.getString("dob")%></td><td>Front Desk Staff</td>
			<td><input type="radio" name="radioButton" value=<%=rs.getString("user_id")%>></td>
			</tr>
			<% count++; %>
			<% } %>
	
			<%rs = stmt.executeQuery("Select users.user_id, first_name, last_name, email, pasword, dob from users INNER JOIN trainer on users.user_id=trainer.user_id;"); %>
	
			<% while (rs.next()) {%>

			<tr>
			<td><%=rs.getString("first_name")%></td><td><%=rs.getString("last_name")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("pasword")%></td><td><%=rs.getString("dob")%></td><td>Personal Trainer</td>
			<td><input type="radio" name="radioButton" value=<%=rs.getString("user_id")%>></td>
			</tr>
			<% count++; %>
			<% } %>
	
			<%rs = stmt.executeQuery("Select users.user_id, first_name, last_name, email, pasword, dob from users INNER JOIN manager on users.user_id=manager.user_id;"); %>
	
			<% while (rs.next()) {%>

			<tr>
			<td><%=rs.getString("first_name")%></td><td><%=rs.getString("last_name")%></td><td><%=rs.getString("email")%></td><td><%=rs.getString("pasword")%></td><td><%=rs.getString("dob")%></td><td>Manager</td>
			<td><input type="radio" name="radioButton" value=<%=rs.getString("user_id")%>></td>
			</tr>
			<% count++; %>
			<% } %>
			
			<%rs.close();%>
			<%stmt.close();%>
			<%con.close();%>
	
			</table>
			</fieldset>
		</div>
	<br>
	

	<% } catch (SQLException se) { %>
	<%= se.getMessage() %>
	<% } %>

<div class="delete_staff_buttons">
	<fieldset id="buttons">
		<legend>Delete Selected Staff</legend>
		<input type="submit" id="delete" value="delete">
		<a href="homeManager.html"><input type="button" id="cancel" value="cancel"></a>
	</fieldset>
</div>
</form>
</body>
</html>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Staff Page</title>
<link rel="stylesheet" type="text/css" href="styles/121fitness.css">
<link rel="shortcut icon" href="images/logo.jpg">
</head>

<body>

<header>
		<div class="banner">
				<h2>1-2-1 Fitness</h2>
				<h3>Are you ready</h3>
				<h1>For the training session of your life?</h1>
				<ul>
					<li><a href='home'>Home</a></li>
					<li><a href='about'>About Us</a></li>
					<li><a href='book'>Make a Booking</a></li>
					<li><a href='equipment'>Equipment</a></li>
				</ul>
		</div>
</header>

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
		<a href="ManageStaff.html"><input type="button" id="cancel" value="cancel"></a>
	</fieldset>
</div>
</form>
</body>
</html>
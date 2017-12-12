<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type ="text/css" href= "styles/main.css">
<meta charset="utf-8">
<title>1-2-1 Fitness: Update Staff</title>
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
	<li><a href="UpdateStaff.jsp">Update Staff Details</a></li>
	<li><a href="ViewStaff.jsp">View Staff Details</a></li>
	<li><a href='logout.jsp'>Log Out</a></li>
 	</ul>
</div>

<form action="UpdateStaff2.jsp" method="get" name="update_staff_form" id="update_staff_form">
<h1>Update Staff</h1>

<%
	String radioButton = request.getParameter("radioButton");
	String firstName = "";
	String lastName = "";
	String emailAddress = "";
	String password = "";
	String dob = "";
	String role = "";
	String user_Id = radioButton;
	
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	// get parameters from the request
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/fitness";
	    con = DriverManager.getConnection(url, "root", "");
	    stmt = con.createStatement();
	    
	    //Check to see if the user id (radiobutton) exists in the staff table
	    //If it does, set the role equal to Front Desk Staff and the retrieve the
	    // remaining details from the users table.
	    
	    rs=null;
	    rs = stmt.executeQuery("Select * from staff where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ " exists in staff table. \n");
	    	role = "Front Desk Staff";
	  	}
	    rs=null;
	    rs = stmt.executeQuery("Select * from trainer where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ " exists in staff table. \n");
	    	role = "Personal Trainer";
	  	}
	    rs=null;
	    rs = stmt.executeQuery("Select * from manager where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ " exists in staff table. \n");
	    	role = "Management Staff";
	  	}
	   
	    
	    rs = stmt.executeQuery("Select user_id, first_name, last_name, email, pasword, dob from users where user_id="+radioButton+";");
	   	while (rs.next()) {
	    	firstName = rs.getString("first_name");
			lastName = rs.getString("last_name");
			emailAddress = rs.getString("email");
			password = rs.getString("pasword");
			dob = rs.getString("dob");
	    }
	   	
	    rs.close();
	   	stmt.close();
	   	con.close();
%>

	<% } catch (SQLException se) { %>
	<%= se.getMessage() %>
	<% } %>
	
	<div class="input_staff_info">
	<fieldset>
		<legend>Update Staff</legend>
		<input type="hidden" name="user_id" id="user_id" value= <%= user_Id %>><br>
		<label class="labelStyle" for="first_name">First Name</label>
		<input type="text" name="first_name" id="first_name" value= <%= firstName %>><br>
		<label class="labelStyle" for="last_name">Last Name</label>
		<input type="text" name="last_name" id="last_name" value= <%= lastName %>><br>
		<label class="labelStyle "for="email">Email</label>
		<input type="text" name="email" id="email" value= <%= emailAddress %>><br>
		<label class="labelStyle" for="password">Password</label>
		<input type="password" name="password" id="password" value= <%= password %>><br>
		<label class="labelStyle" for="dob">Date of Birth</label>
		<input type="text" name="Date_of_Birth" id="Date_of_Birth" value= <%= dob %>><br>
		<label class="labelStyle" for="role">Role</label>
		<select name = "role">
		<% if (role == "Front Desk Staff") { %>
			<option selected="selected" value = "Front Desk Staff">Front Desk Staff</option>
		<% } else { %>
			<option value = "Front Desk Staff">Front Desk Staff</option>
		<% } %>
		<% if (role == "Personal Trainer") { %>
			<option selected="selected" value = "Personal Trainer">Personal Trainer</option>
		<% } else { %>
			<option value = "Personal Trainer">Personal Trainer</option>
		<% } %>
		<% if (role == "Management Staff") { %>
			<option selected="selected" value = "Management Staff">Management Staff</option>
		<% } else { %>
			<option value = "Management Staff">Management Staff</option>
		<% } %>
		</select><br>

	</fieldset>
</div>

<div class="update_staff_buttons">
	<fieldset id="buttons">
		<legend>Update Selected Staff</legend>
		<input type="submit" id="update" value="update">
		<a href="homeManager.html"><input type="button" id="cancel" value="cancel"></a>
	</fieldset>
</div>	
</form>
</body>
</html>
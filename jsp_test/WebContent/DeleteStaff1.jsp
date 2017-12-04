<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Staff</title>
<link rel="stylesheet" href="styles/1-2-1_Staff_Mgt.css"/>
</head>
<body>

<h1>Delete Staff</h1>

<%
	String radioButton = request.getParameter("radioButton");
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
	    //If it does, delete it frm the staff table and then delete the user from the useres table
	    
	    rs=null;
	    rs = stmt.executeQuery("Select * from staff where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ " exists in staff table. \n");
	    	int deletion = stmt.executeUpdate ("Delete from staff where user_id="+radioButton+";");
		    if (deletion > 0) {
		    	out.println ("Success deleting user_id: "+radioButton+" from staff table \n");
		    } else {
		    	out.println ("Failed to delete user_id: "+radioButton+" from staff table \n");
		    }
	    }
	    rs=null;
	    rs = stmt.executeQuery("Select * from trainer where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ "exists in trainer table \n");
	    	int deletion = stmt.executeUpdate ("Delete from trainer where user_id="+radioButton+";");
		    if (deletion > 0) {
		    	out.println ("Success deleting user_id: "+radioButton+" from trainer table \n");
		    } else {
		    	out.println ("Failed to delete user_id: "+radioButton+" from trainer table \n");
		    }
	    }
	    rs=null;
	    rs = stmt.executeQuery("Select * from manager where user_id="+radioButton+";");
	    if (rs != null && rs.next()) {
	    	out.println ("User_id: "+radioButton+ "exists in manager table \n");
	    	int deletion = stmt.executeUpdate ("Delete from manager where user_id="+radioButton+";");
		    if (deletion > 0) {
		    	out.println ("Success deleting user_id: "+radioButton+" from manager table \n");
		    } else {
		    	out.println ("Failed to delete user_id: "+radioButton+" from manager table \n");
		    }
	    }
	    
	    //rs = stmt.executeQuery("Select user_id, first_name, last_name, email, pasword, dob from users where user_id="+radioButton+";");
	    int deletion = stmt.executeUpdate ("Delete from users where user_id="+radioButton+";");
	    if (deletion > 0) {
	    	out.println ("Success deleting user_id: "+radioButton+" from users table \n");
	    } else {
	    	out.println ("Failed to delete user_id: "+radioButton+" from users table \n");
	    }
	    
	    rs.close();
	    stmt.close();
	    con.close();
%>

	<% } catch (SQLException se) { %>
	<%= se.getMessage() %>
	<% } %>
	
	<%
	String redirectURL = "ManageStaff.html";
	response.sendRedirect(redirectURL);
	%>
</body>
</html>
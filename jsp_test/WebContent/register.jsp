<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you for registering</title>
</head>
<body>
	<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	// get parameters from the request
	//INSERT INTO customer(first_name, last_name, email, pasword, dob)  VALUES ('mike','hunt', 'testmail10@email.com','pas', '2000-11-11');
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String emailAddress = request.getParameter("emailAddress");
	String password = request.getParameter("password");
	String dob = request.getParameter("dateofbirth");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/fitness";
	    con = DriverManager.getConnection(url, "root", "");
	    stmt = con.createStatement();
	}
	catch(Exception e){System.out.print("Failed to initialise DB Connection");}
	try
	{					
		stmt.executeUpdate("INSERT INTO customer(first_name, last_name, email, pasword, dob) VALUES('"+firstName+"','"+lastName+"','"+emailAddress+"','"+password+"','"+dob+"');");
	}
	catch(Exception e1){e1.getMessage();}
	%>
	
	<table cellspacing="5" cellpadding="5" border="1">
		<tr>
			<td align="right">First name:</td>
			<td><%= firstName %></td>
		</tr>
		<tr>
			<td align="right">Last name:</td>
			<td><%= lastName %></td>
		</tr>
			<tr><td align="right">Email address:</td>
			<td><%= emailAddress %></td>
		</tr>
		<tr>
			<tr><td align="right">Password:</td>
			<td><%= password %></td>
		</tr>
		<tr>
			<tr><td align="right">Date of Birth:</td>
			<td><%= dob %></td>
		</tr>
	</table>
	
</body>
</html>
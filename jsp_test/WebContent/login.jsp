<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%
    String email = request.getParameter("email");    
    String password = request.getParameter("password");
    int id=0;
    String firstName="";
	String lastName="";
	String emailAddress="";
	String dob="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where email='" + email + "' and pasword='" + password + "'");
    if (rs.next())
    {
    	id=rs.getInt("user_id");
    	firstName=rs.getString("first_name");
    	lastName=rs.getString("last_name");
    	emailAddress=rs.getString("email");
    	dob=rs.getString("dob");
    }
    else {out.println("Invalid password <a href='index.jsp'>try again</a>");}
%>
<table cellspacing="5" cellpadding="5" border="1">
		<tr>
			<td align="right">ID:</td>
			<td><%= id %></td>
		</tr>
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
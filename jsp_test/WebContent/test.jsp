<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td><b>ID</b></td>
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>E-mail</b></td>
<td><b>Password</b></td>
<td><b>Date of Birth</b></td>
</tr>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs=null;
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
	rs= stmt.executeQuery("select * from users");
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("user_id") %></td>
		<td><%=rs.getString("first_name") %></td>
		<td><%=rs.getString("last_name") %></td>
		<td><%=rs.getString("email") %></td>
		<td><%=rs.getString("pasword") %></td>
		<td><%=rs.getString("dob") %></td>
		</tr>
		<%
	}
}
catch(Exception e1){e1.printStackTrace();}
%>
</table>
</body>
</html>
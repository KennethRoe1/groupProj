<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id=(String)session.getAttribute("customer_id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("Select * from booking where customer_id ="+id);
    ResultSetMetaData metaData = rs.getMetaData();
%>
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
  	<li><a href=""> Book a Class </a></li>
  	<li><a href="bookingsCustomer.jsp"> View Bookings </a></li>
    <li><a href=""> View Schedule </a></li>
    <li><a href=""> Cancel a Class </a></li>
	<li><a href='logout.jsp'>LOG OUT</a></li>
 	</ul>
</div>
<table>
<%
try
{					
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("booking_num") %></td>
		<td><%=rs.getString("customer_id") %></td>
		<td><%=rs.getString("date_") %></td>
		<td><%=rs.getString("start_time") %></td>
		<td><%=rs.getString("finish_time") %></td>
		<td><%=rs.getString("catagory") %></td>
		<td><%=rs.getString("status_") %></td>
		</tr>
		<%
	}
}
catch(Exception e1){e1.printStackTrace();}
    %>
</table>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id=(String)session.getAttribute("staff_id");
	String bNum = request.getParameter("radioButton");
	System.out.println(bNum);
	String tID = request.getParameter("trainerID");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
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
    <li><a href=""> CREATE BOOKING </a></li>
    <li><a href="viewRequest.jsp"> VIEW REQUESTS </a></li>
    <li><a href="trainerScheduleFDS.jsp"> VIEW TRAINER TIMETABLE </a></li>
	<li><a href='logout.jsp'>LOG OUT</a></li>
 	</ul>
</div>
<table>
<%
	rs = st.executeQuery("Select trainer_id, concat(first_name, ' ', last_name) as name from trainers where trainer_id="+tID);
	while(rs.next())
	{%>
		<td><%=rs.getString("trainer_id")%></td>
		<td><%=rs.getString("name")%></td>
<% }%>
</table>
<table>
<%
	rs = st.executeQuery("Select booking_num from booking where booking_num ="+bNum);
	while(rs.next())
	{%>
		<td><%=rs.getString("booking_num")%></td>
<% }%>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id=(String)session.getAttribute("trainer_id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT session_.session_num, booking.booking_num, booking.catagory, booking.date_, booking.start_time, booking.finish_time, booking.status_, customers.customer_id, concat(customers.first_name,' ', customers.last_name) as customer, trainers.trainer_id, concat(trainers.first_name,' ', trainers.last_name) as trainer FROM booking inner join session_ on session_.booking_num=booking.booking_num inner join customers on customers.customer_id=booking.customer_id inner join trainers on session_.trainer_id=trainers.trainer_id where session_.trainer_id="+id);
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
    <li><a href="trainerSchedule.jsp"> View Schedule </a></li>
    <li><a href="report.html"> Report </a></li>
    <li><a href="logout.jsp"> Log Out </a></li>
 	</ul>
</div>
<fieldset>
<table width="100%">
<tr>
<th>Date</th>
<th>Start</th>
<th>Finish</th>
<th>Type</th>
<th>Customer</th>
</tr>
<%
try
{					
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("date_") %></td>
		<td><%=rs.getString("start_time") %></td>
		<td><%=rs.getString("finish_time") %></td>
		<td><%=rs.getString("catagory") %></td>
		<td><%=rs.getString("customer") %></td>
		</tr>
		<%
	}
}
catch(Exception e1){e1.printStackTrace();}
%>
</table>
</fieldset>
</body>
</html>
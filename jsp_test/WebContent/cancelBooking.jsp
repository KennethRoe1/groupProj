<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
int count=0;
    String id=(String)session.getAttribute("customer_id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("Select * from booking where customer_id ="+id);
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
    <li><a href="cancelBooking.jsp"> Cancel a Class </a></li>
	<li><a href='logout.jsp'>LOG OUT</a></li>
 	</ul>
</div>
<form action="deleteBooking.jsp" method="get" name="delete_booking_form" id="delete_booking_form">
	<fieldset>
		<legend>Delete Staff</legend>
		<table width="100%">
	<%try
	{
			 while (rs.next()) {%>

			<tr>
			<td><%=rs.getString("booking_num")%></td><td><%=rs.getString("date_")%></td><td><%=rs.getString("start_time")%></td><td><%=rs.getString("finish_time")%></td><td><%=rs.getString("catagory")%></td><td><%=rs.getString("status_")%></td>
			<td><input type="radio" name="radioButton" value=<%=rs.getString("user_id")%>></td>
			</tr>
			<% count++;
			}
			
			rs.close();
			st.close();
			con.close();%>
	
			</table>
			</fieldset>
	<% }
	catch (SQLException se) {se.getMessage();} %>

<div class="delete_booking_button">
		<input type="submit" id="delete" value="delete">
		<a href="cancelBooking.html"><input type="button" id="cancel" value="cancel"></a>
</div>
</form>
</body>

</html>
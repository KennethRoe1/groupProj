<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id=(String)session.getAttribute("staff_id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("Select user_id, customer_id, concat(first_name, ' ', last_name) as name from customers");
%>
<!Doctype html>
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
    <li><a href="bookingFDS.jsp"> CREATE BOOKING </a></li>
    <li><a href="viewRequest.jsp"> VIEW REQUESTS </a></li>
    <li><a href="trainerScheduleFDS.jsp"> VIEW TRAINER TIMETABLE </a></li>
	<li><a href='logout.jsp'>LOG OUT</a></li>
 	</ul>
</div>
<fieldset>
<legend>Create a Booking</legend>
<form id="form" action="CreateBooking1.jsp" method="get"> 
        <label id="bookingDate"  for="bookingDate">Booking Date:</label><input id="bookingDate" type="date" name="bookingDate"><br>
        <label id="start_time" for="start_time">Start Time:</label><input type="time" name="start_time"><br>
		<label id="finish_time" for="finish_time">Finish Time:</label><input type="time" name="finish_time"><br>
        <label  id="class"for="class">Class</label>
        <select name = "catagory">
        <option value="Boxercise">Boxercise</option>
  		<option value="Spin">Spin</option>
  		<option value="BootCamp">BootCamp</option>
  		<option value="Step">Step</option>
  		<option value="Pilates">Pilates</option>
        <option value="Kettlebells">Kettlebells</option>
  		<option value="HIIT">HIIT</option>
  		<option value="Lifting">Lifting</option>
		<option value="TRX">TRX</option>
		</select>
		<br>
		Customer:<select name = "customerID">
		<%while(rs.next()){System.out.println(rs.getString("customer_id"));%>
			<option value=<%= rs.getString("customer_id") %>><%= rs.getString("name") %></option>
			<%}%>
		</select>
		<br>
		<input type="submit" value="Submit" />
</form>
</fieldset>
</body>
</html>

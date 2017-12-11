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
    rs = st.executeQuery("Select booking.*, customers.user_id, concat(customers.first_name, ' ',customers.last_name) as customer from booking inner join customers ON booking.customer_id = customers.customer_id where status_ = 'pending'");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type ="text/css" href= "styles/main.css">
<meta charset="utf-8">
<title>1-2-1 Fitness</title>
<script type="text/javascript">
function showfield(name){
  if(name=='accept')document.getElementById('div1').innerHTML='Other: <input type="text" name="other" />';
  else document.getElementById('div1').innerHTML='';
}
</script>
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
<form action="viewRequest1.jsp" method="get" name="set_status" id="set_status">
<div>
<fieldset>
<table width="100%">
<%
try
{					
	while(rs.next())
	{
		//testing
		System.out.println(rs.getString("booking_num"));
		%>
		<tr>
		<td><%=rs.getString("customer") %></td>
		<td><%=rs.getString("date_") %></td>
		<td><%=rs.getString("start_time") %></td>
		<td><%=rs.getString("finish_time") %></td>
		<td><%=rs.getString("catagory") %></td>
		<td><%=rs.getString("status_") %></td>
		<td><input type="radio" name="radioButton" value=<%=rs.getString("booking_num")%>></td>
		</tr>
		<%
	}
}
catch(Exception e1){e1.printStackTrace();}
    %>
</table>
</fieldset>
</div>
<br>
<fieldset id="buttons">
<legend>Change Status</legend>
<div>
<% rs = st.executeQuery("Select trainer_id, concat(first_name, ' ', last_name) as name from trainers"); %>
	<select name="select_status" id="select_status" onchange="showfield(this.options[this.selectedIndex].value)">
		<option selected="selected">Please select ...</option>
		<option value="decline">Decline</option>
		<option value="accept">Accept</option>
	</select>
	Select a Persoal Trainer:
	<select name = "trainerID">
		<%
		while(rs.next()){
			System.out.println(rs.getString("name"));%>
			<option value=<%= rs.getString("trainer_id") %>><%= rs.getString("name") %></option>
			<%}%>
	</select>
	<input type="submit" id="set_status" value="Set Status">
	</fieldset>
</div>
</form>
</body>
</html>
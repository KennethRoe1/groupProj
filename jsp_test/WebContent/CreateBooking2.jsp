<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	// get parameters from the request
	
	String bookingDate = request.getParameter("bookingDate");
	String className = request.getParameter("catagory");
	String startTime = request.getParameter("start_time");
	String uID=(String)session.getAttribute("user_id");
	int user_Id = Integer.parseInt(uID.trim());
	out.println("User_Id is: " +user_Id);
	out.println("uID is: " +uID);
	String customer_Id = "";
	int bookingNum = 0;
	String finishTime = null;
	Date startTimeFormatted = null;
	
	Date finishDate = null;

	try {
	    startTimeFormatted = new SimpleDateFormat("HH:mm").parse(startTime);
	    //finishDate = finishDate + 120;
	    out.println("startTime is: " +startTime);
	    out.println("finishTime is: " +finishDate);
	    Calendar cal2 = Calendar.getInstance();
	    cal2.setTime(startTimeFormatted);
	    cal2.add(Calendar.HOUR_OF_DAY, 2);
	    out.println("cal2 is: " +cal2.getTime());
	    SimpleDateFormat finishTimeFormat = new SimpleDateFormat("HH:mm");
	    out.println("The time I'm looking for is: " +finishTimeFormat.format(cal2.getTime())); 
	    finishTime = finishTimeFormat.format(cal2.getTime());
	    out.println("The finishTime I'm looking for is: " +finishTime);
	}
	catch(Exception e){System.out.print("Enter the time in HH:mm format");}
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/fitness";
	    con = DriverManager.getConnection(url, "root", "");
	    stmt = con.createStatement();
		rs = stmt.executeQuery("Select customer_id from customer where user_id = " +user_Id+";");
	} catch(Exception e){System.out.print("Failed to initialise DB Connection");} 
	
	while (rs.next()) {
		customer_Id = rs.getString("customer_id");
	}
	
	out.println("Customer_Id is: " +customer_Id);
	if (user_Id == 0) {
		String redirectURL = "login.html";
		response.sendRedirect(redirectURL);
	}
	
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
			stmt.executeUpdate("INSERT INTO booking(customer_id, date_, start_time, finish_time) VALUES('"+customer_Id+"','"+bookingDate+"','"+startTime+"','"+finishTime+"');",Statement.RETURN_GENERATED_KEYS);
			rs = stmt.getGeneratedKeys();
			if (rs.next()){
				bookingNum = rs.getInt(1);
			}
	}
	catch(Exception e1){e1.getMessage();}
    rs.close();
	stmt.close();
    con.close();
%> 
	
	<%
	//String redirectURL = "index.html";
	//response.sendRedirect(redirectURL);
	%>
	
	<table cellspacing="5" cellpadding="5" border="1">
		<tr>
			<td align="right">Booking Date:</td>
			<td><%= bookingDate %></td>
		</tr>
		<tr>
			<td align="right">Class name:</td>
			<td><%= className %></td>
		</tr>
		<tr>
			<td align="right">Start Time:</td>
			<td><%= startTime %></td>
		</tr>
		<tr>
			<td align="right">Finish Time:</td>
			<td><%= finishDate %></td>
		</tr>
	</table>
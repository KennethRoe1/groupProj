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
	String finishTime = request.getParameter("finish_time");
	String cID=request.getParameter("customerID");
	
	
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
		stmt.executeUpdate("INSERT INTO booking(customer_id, date_, start_time, finish_time,catagory,status_) VALUES("+cID+",'"+bookingDate+"','"+startTime+"','"+finishTime+"','"+className+"','pending');");
	}
	catch(Exception e1){e1.getMessage();}
	response.sendRedirect("viewRequest.jsp");
%> 
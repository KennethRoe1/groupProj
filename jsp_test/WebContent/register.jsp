<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
	<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	String uid="";
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String emailAddress = request.getParameter("emailAddress");
	String password = request.getParameter("password");
	String dob = request.getParameter("dateofbirth");
	
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
		stmt.executeUpdate("INSERT INTO users(first_name, last_name, email, pasword, dob) VALUES('"+firstName+"','"+lastName+"','"+emailAddress+"','"+password+"','"+dob+"');");
	}
	catch(Exception e1){e1.getMessage();}
	try
	{
		
		rs=stmt.executeQuery("select user_id from users where email='"+emailAddress+"'");
		if(rs.next()){uid=rs.getString("user_id");}
		System.out.println(emailAddress+" "+uid);
		stmt.executeUpdate("INSERT INTO `customer`(`customer_id`, `user_id`) values(NULL, "+uid+");");
	}
	catch(Exception e1){e1.getMessage();}
	response.sendRedirect("login.html");
	%>
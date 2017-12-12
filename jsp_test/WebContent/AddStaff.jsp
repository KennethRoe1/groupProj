<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
	<%
	Connection con = null;
	Statement stmt = null;
	// get parameters from the request
	
	String firstName = request.getParameter("first_name");
	String lastName = request.getParameter("last_name");
	String emailAddress = request.getParameter("email");
	String password = request.getParameter("password");
	String dob = request.getParameter("Date_of_Birth");
	String role = request.getParameter("role");
	int userId = 0;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/fitness";
	    con = DriverManager.getConnection(url, "root", "admin");
	    stmt = con.createStatement();
	}
	catch(Exception e){System.out.print("Failed to initialise DB Connection");}
	try
	{
		if (role.equals("Front Desk Staff")) {
			stmt.executeUpdate("INSERT INTO users(first_name, last_name, email, pasword, dob) VALUES('"+firstName+"','"+lastName+"','"+emailAddress+"','"+password+"','"+dob+"');",Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()){
				userId = rs.getInt(1);
			}
			stmt.executeUpdate("INSERT INTO staff(user_id) VALUES('"+userId+"');");
		} else if (role.equals("Personal Trainer")) {
			stmt.executeUpdate("INSERT INTO users(first_name, last_name, email, pasword, dob) VALUES('"+firstName+"','"+lastName+"','"+emailAddress+"','"+password+"','"+dob+"');",Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()){
				userId = rs.getInt(1);
			}
			stmt.executeUpdate("INSERT INTO trainer(user_id) VALUES('"+userId+"');");
		} else if (role.equals("Management Staff")) {
			stmt.executeUpdate("INSERT INTO users(first_name, last_name, email, pasword, dob) VALUES('"+firstName+"','"+lastName+"','"+emailAddress+"','"+password+"','"+dob+"');",Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()){
				userId = rs.getInt(1);
			}
			stmt.executeUpdate("INSERT INTO manager(user_id) VALUES('"+userId+"');");
		}
	}
	catch(Exception e1){e1.getMessage();}
	%> 
	
	<%
	String redirectURL = "homeManager.html";
	response.sendRedirect(redirectURL);
	%>
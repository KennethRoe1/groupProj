<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
	<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	// get parameters from the request
	
	int userId =  Integer.parseInt(request.getParameter("user_id"));
	String firstName = request.getParameter("first_name");
	String lastName = request.getParameter("last_name");
	String emailAddress = request.getParameter("email");
	String password = request.getParameter("password");
	String dob = request.getParameter("Date_of_Birth");
	String role = request.getParameter("role");
	//String userId = request.getParameter("user_Id");
	
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
		stmt.executeUpdate("UPDATE users SET first_name = '"+firstName+"', last_name = '"+lastName+"', email = '"+emailAddress+"', pasword = '"+password+"', dob = '"+dob+"' where user_id="+userId+";");
		if (role.equals("Front Desk Staff")) {
			rs=null;
		    rs = stmt.executeQuery("Select * from staff where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in staff table. \n");
		  	} else {
		  		stmt.executeUpdate("INSERT INTO staff(user_id) VALUES('"+userId+"');");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from trainer where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in trainer table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from trainer where user_id="+userId+";");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from manager where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in manager table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from manager where user_id="+userId+";");
		  	}
		} else if (role.equals("Personal Trainer")) {
			rs=null;
		    rs = stmt.executeQuery("Select * from trainer where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in trainer table. \n");
		  	} else {
		  		stmt.executeUpdate("INSERT INTO trainer (user_id) VALUES('"+userId+"');");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from staff where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in staff table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from staff where user_id="+userId+";");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from manager where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in manager table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from manager where user_id="+userId+";");
		  	}
		} else if (role.equals("Management Staff")) {
			rs=null;
		    rs = stmt.executeQuery("Select * from manager where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in manager table. \n");
		  	} else {
		  		stmt.executeUpdate("INSERT INTO manager (user_id) VALUES('"+userId+"');");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from trainer where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in trainer table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from trainer where user_id="+userId+";");
		  	}
		    rs=null;
		    rs = stmt.executeQuery("Select * from staff where user_id="+userId+";");
		    if (rs != null && rs.next()) {
		    	out.println ("User_id: "+userId+ " exists in staff table. \n");
		    	int deletion = stmt.executeUpdate ("Delete from staff where user_id="+userId+";");
		  	}
	    	rs.close();
		    stmt.close();
	    	con.close();
		}
	}
	catch(Exception e1){e1.getMessage();}
	
	%> 
	
	<%
	String redirectURL = "homeManager.html";
	response.sendRedirect(redirectURL);
	%>
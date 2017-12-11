<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id=(String)session.getAttribute("staff_id");
	String bNum = request.getParameter("radioButton");
	String status = request.getParameter("select_status");
	String tID = request.getParameter("trainerID");
	System.out.println(bNum);
	System.out.println(status);
	System.out.println(tID);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    try
	{
    	if(status.equals("accept"))
    	{
    		st.executeUpdate("INSERT INTO session_(booking_num, trainer_id) VALUES("+bNum+","+tID+");");
        	st.executeUpdate("Update booking set status_='accepted' where booking_num="+bNum);
    	}
    	else if(status.equals("decline"))
    	{
    		st.executeUpdate("Update booking set status_='declined' where booking_num="+bNum);
    	}
    	else
    	{System.out.println("error with selection");};
	}
	catch(Exception e1){e1.getMessage();}
    response.sendRedirect("viewRequest.jsp");
%>

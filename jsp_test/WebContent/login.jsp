<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String email = request.getParameter("email");    
    String password = request.getParameter("password");
    String id="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where email='" + email + "' and pasword='" + password + "'");
    if (rs.next())
    {
    	id=rs.getString("user_id");
    	session.setAttribute("user_id",id);
    	response.sendRedirect("redirect.jsp");
    }
    else {out.println("Invalid password <a href='index.html'>try again</a>");}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<% // till have to Redirects from login.jsp, identifies if user is customer,trainer,staff or manager and redirects accordingly 
	//SELECT customer.customer_id, users.user_id FROM customer INNER JOIN users ON customer.user_id=users.user_id
	session.getAttribute("user_id");
	String uID=(String)session.getAttribute("user_id");
	System.out.println(uID);
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitness","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT users.user_id, manager.manager_id, staff.staff_id, trainer.trainer_id, customer.customer_id FROM users left JOIN manager ON users.user_id=manager.user_id left JOIN staff ON users.user_id=staff.user_id left JOIN trainer ON users.user_id=trainer.user_id left JOIN customer ON users.user_id=customer.user_id where users.user_id="+uID+";");
    ResultSetMetaData rsmd = rs.getMetaData();
    int setCN = rsmd.getColumnCount();
    System.out.println(setCN);
    if (rs.next())
    {
    	String man=rs.getString("manager_id");
    	String staff=rs.getString("staff_id");
    	String train=rs.getString("trainer_id");
    	String cust=rs.getString("customer_id");
    	System.out.println(man+", "+staff+", "+train+", "+cust);
    	if(man != null)
    	{
    		System.out.println("manager");
    		response.sendRedirect("homeManager.jsp");
    	}
    	if(staff != null)
    	{
    		System.out.println("staff");
    		response.sendRedirect("homeFDStaff.jsp");
    	}
    	if(train != null)
    	{
    		System.out.println("trainer");
    		response.sendRedirect("homeTrainer.jsp");
    	}
    	if(cust != null)
    	{
    		System.out.println("customer");
    		response.sendRedirect("homeCustomer.jsp");
    	}
    }
%>
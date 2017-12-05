<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<% // till have to Redirects from login.jsp, identifies if user is customer,trainer,staff or manager and redirects accordingly 
	//SELECT customer.customer_id, users.user_id FROM customer INNER JOIN users ON customer.user_id=users.user_id
	String type ="";
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
    		type = "manager";
    		System.out.println(type+" "+man);
    		session.setAttribute("user_type",type);
    		session.setAttribute("manager_id",man);
    		response.sendRedirect("homeManager.html");
    	}
    	if(staff != null)
    	{
    		type = "staff";
    		System.out.println(type+" "+staff);
    		session.setAttribute("user_type",type);
    		session.setAttribute("staff_id",staff);
    		response.sendRedirect("homeFDStaff.html");
    	}
    	if(train != null)
    	{
    		type = "trainer";
    		System.out.println(type+" "+train);
    		session.setAttribute("user_type",type);
    		session.setAttribute("trainer_id",train);
    		response.sendRedirect("homeTrainer.html");
    	}
    	if(cust != null)
    	{
    		type = "customer";
    		System.out.println(type+" "+cust);
    		session.setAttribute("user_type",type);
    		session.setAttribute("customer_id",cust);
    		response.sendRedirect("homeCustomer.html");
    	}
    }
%>
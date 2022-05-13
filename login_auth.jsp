<%@page import="JPMS.signup_connection"%>
<%@page import="org.omg.CORBA.Request"%>

<%@page language="java" import="java.sql.*, java.util.*, java.io.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pswd");
try
{
String query="select * from login where username=? and password=?";
Connection con=signup_connection.getcon();
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, uname);
ps.setString(2, pass);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	String usern=rs.getString("username");
	String pswd=rs.getString("password");
	int uid=rs.getInt("uid");
	session.setAttribute("uid", uid);
	session.setAttribute("username", usern);
	session.setAttribute("pswrd", pswd);

	response.sendRedirect("dashboard.html");
}
else
{
	response.sendRedirect("error.html");
}

}
catch(Exception e)
{
	out.println(e);
}
%>
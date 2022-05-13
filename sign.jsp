<%@page import="JPMS.signup_connection"%>
<%@page import="org.omg.CORBA.Request"%>

<%@page language="java" import="java.sql.*, java.util.*, java.io.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String mob=request.getParameter("ph");
String email=request.getParameter("email");
String uname=request.getParameter("uname");
String pass=request.getParameter("pswd");

try
{
String query1="insert into user(fname,lname,mobile,email) values (?,?,?,?)";
int status1=0;
int status2=0;
Connection con=signup_connection.getcon();
PreparedStatement ps=con.prepareStatement(query1,Statement.RETURN_GENERATED_KEYS);
ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,mob);
ps.setString(4,email);
status1=ps.executeUpdate();
ResultSet rs=ps.getGeneratedKeys();



String query2="insert into login(uid,username,password) values (?,?,?)";
PreparedStatement ps1=con.prepareStatement(query2);
if(rs.next())
{
	int userid=rs.getInt(1);
	ps1.setInt(1, userid);
}
ps1.setString(2,uname);
ps1.setString(3,pass);
status2=ps1.executeUpdate();

if(status1 > 0)
{
	if(status2 > 0)
	{
		response.sendRedirect("Login.html");
	}
}
}
catch(Exception e)
{
	out.println(e);
}

%> 

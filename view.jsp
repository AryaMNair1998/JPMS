<%@page import="JPMS.signup_connection"%>
<%@page import="org.omg.CORBA.Request"%>

<%@page language="java" import="java.sql.*, java.util.*, java.io.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Details</title>
</head>
<body style="background-color: lightgray;">
<%
try
{
Object userid=session.getAttribute("uid");
Object username=session.getAttribute("username");
int usid=(int)userid;
String query="select * from user where id=?";
Connection con=signup_connection.getcon();
PreparedStatement ps=con.prepareStatement(query);
ps.setInt(1, usid);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	String firstname=rs.getString("fname");
	String lastname=rs.getString("lname");
	String phone=rs.getString("mobile");
	String email=rs.getString("email");
	session.setAttribute("frstname",firstname);
	session.setAttribute("lstname",lastname);
	session.setAttribute("phne",phone);
	session.setAttribute("mail",email);
}
}
catch(Exception e)
{
	out.println(e);
}
%>
<div style="text-align: center;">
<h1> Details</h1>
</div>

<div class="container">
  <div class="row">
    <div class="col-sm">
    </div>
    <div class="col-sm">
      <form>
      <div class="form-group">
   <label for="pswd">Employee ID</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("uid")%>">
    
  </div>
  <div class="form-group">
    <label for="fname">First Name</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("frstname")%>">
    
  </div>
  <div class="form-group">
   <label for="lname">Last Name</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("lstname")%>">
    
  </div>
  <div class="form-group">
   <label for="ph">Mobile Number</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("phne")%>">
    
  </div>
  <div class="form-group">
   <label for="email">E-mail</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("mail")%>" >
    
  </div>
  <div class="form-group">
   <label for="uname">User Name</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("username")%>">
    
  </div>
  <div class="form-group">
   <label for="uname">Password</label>
    <input type="text" class="form-control" value="<%=session.getAttribute("pswrd")%>">
    
  </div>
  
</form>
    </div>
    <div class="col-sm">
     
    </div>
  </div>
</div>
<!--  
<form>
<h1>Details</h1>
   Employee  user Id:<input type="text" value="<%=session.getAttribute("uid")%>"><br>
   
   First Name:<input type="text" value="<%=session.getAttribute("frstname")%>"><br>
   Last Name:<input type="text" value="<%=session.getAttribute("lstname")%>"><br>
    Mobile Number:<input type="text" value="<%=session.getAttribute("phne")%>"><br>
     E-mail:<input type="text" value="<%=session.getAttribute("mail")%>"><br>
     Employee user-name:<input type="text" value="<%=session.getAttribute("username")%>"><br>
  </form>-->
</body>
</html>
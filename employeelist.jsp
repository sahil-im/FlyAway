<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>


<%
if(session.getAttribute("UserName") == null)
{
	response.sendRedirect("admin.jsp");
}
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">FlyAway</a>
      <button
        class="navbar-toggler"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#navbarText"
        aria-controls="navbarText"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="AdminWelcome.html" target="_blank" >Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="employee.jsp" target="_blank" >EmployeeDetails</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="FlightRoutes.jsp" target="_blank" >FlightDetails</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="bookingorders.jsp" target="_blank" > BookingOrders</a>
          </li>

        </ul>
        <span class="navbar-text">
            <form action="AdminLogout">
                <input type="submit" value="LogOut">
            </form>
        </span>
      </div>
    </div>
  </nav>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3307/flyaway";
String userId = "root";
String password = "password";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<br>
<br>
<br>



<div>
    <h4 align ="center" style ="color:#8946A6">Employee List</h4>
 
        <br>
        <table align="center" cellpadding="5" cellspacing="5" border="1">

<tr style ="background-color:#7CD1B8">
		<th>SL.No &nbsp;</th>
        <th>FullName&nbsp;</th>
        <th>EMail &nbsp;</th>
        <th>PhoneNumber &nbsp;</th>
        <th>UserName &nbsp;</th>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr >

<td><%=resultSet.getString("SL_No") %></td>
<td><%=resultSet.getString("FullName") %></td>
<td><%=resultSet.getString("Email") %></td>
<td><%=resultSet.getString("PhoneNumber") %></td>
<td><%=resultSet.getString("UserName") %></td>

</tr>

<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
                
</div>




</body>
</html>
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
if(session.getAttribute("Email") == null)
{
	response.sendRedirect("login.html");
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
            <a class="nav-link active" aria-current="page" href="index.jsp" target="_blank" >Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin.jsp" target="_blank" >AdminLogin</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.html" target="_blank" >UserLogin</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="registration.html" target="_blank" >SignUp</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="OrderHistory.jsp" target="_blank" >OrderHistory</a>
          </li>

        </ul>
        <span class="navbar-text">
            <form action="LogOut">
                <input type="submit" value="LogOut">
            </form>
        </span>
      </div>
    </div>
  </nav>
	
	<h4 align ="center" style = "color:#8B9A46"> Booking Details</h4>
	


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
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String date =(String) session.getAttribute("Date");
int travlellers = (int) session.getAttribute("Travellers");
int flightno = (int)session.getAttribute("FlightNumber");
String sql ="SELECT * FROM flights where FlightNo= '"+flightno+"'";
resultSet = statement.executeQuery(sql);
%>
<table align ="center" >

<tr style ="background-color:#7CD1B8"> 
<td>FlightNo &nbsp;</td>
<td>FlightCompany &nbsp;</td>
<td>TravelingDate &nbsp;</td>
<td>SourceLocation &nbsp;</td>
<td>DepartureTime &nbsp;</td>
<td>DestinationLocation &nbsp;</td>
<td>ArrivalTime &nbsp;</td>
<td>NoOfTravellers &nbsp;</td>
<td>TotalAmount &nbsp;</td>

</tr>

<%
resultSet.next();
int totalamount =travlellers *(int)resultSet.getInt("price");
{
	session.setAttribute("BookingFlightNo", resultSet.getInt("FlightNo"));
	session.setAttribute("BookingFlightCompany",resultSet.getString("FlightCompany"));
	session.setAttribute("BookingDepartureTime", resultSet.getString("DepartureTime"));
	session.setAttribute("BookingArrivalTime",resultSet.getString("ArrivalTime"));
	session.setAttribute("TotalAmount", totalamount);
	
	
%>


<tr>

<td><%=resultSet.getInt("FlightNo")%></td>
<td><%=resultSet.getString("FlightCompany") %></td>
<td> <%=session.getAttribute("Date") %></td>
<td><%=session.getAttribute("Source") %></td>
<td><%=resultSet.getString("DepartureTime") %></td>
<td><%=session.getAttribute("Destination") %></td>
<td><%=resultSet.getString("ArrivalTime") %></td>
<td> <%=session.getAttribute("Travellers") %> </td>
<td>Total Price: Rs.<%= session.getAttribute("TotalAmount")%></td>
</tr>
</table>

<br>

<form action = "LoginServlet"  align ="center" > 
<input type="checkbox" name="Checkbox" >please verify details and click check box. <br><br>
<input type="hidden" name="modalForm" value="BookingPayment"/>
<input type = "submit" value ="Payment" >
</form>




<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>








</body>
</html>
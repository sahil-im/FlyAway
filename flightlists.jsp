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
if(session.getAttribute("SourceLocation") == null)
{
	response.sendRedirect("index.jsp");
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



<div>
    <h4 align ="center" style ="color:#8946A6">Flight List</h4>
 
        
 
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
int routeid =0;
if(session.getAttribute("Source").equals("Hyderabad") &&  session.getAttribute("Destination").equals("Goa"))
{
	routeid =1;
}
else if(session.getAttribute("Source").equals("Hyderabad") &&  session.getAttribute("Destination").equals("Mumbai"))
{
	routeid =2;
}
else if(session.getAttribute("Source").equals("Mumbai") &&  session.getAttribute("Destination").equals("Banglore"))
{
	routeid =3;
}
else if(session.getAttribute("Source").equals("Hyderabad") &&  session.getAttribute("Destination").equals("Delhi"))
{
	routeid =4;
}
else if(session.getAttribute("Source").equals("Delhi") &&  session.getAttribute("Destination").equals("Banglore"))
{
	routeid =5;
}
else
{
	routeid =0;
}
String date =(String) session.getAttribute("Date");
String sql ="SELECT * FROM flights where TravellingDate ='"+date+"' and Route_ID ='"+routeid+"' ";
resultSet = statement.executeQuery(sql);
%>
<h4 align ="center" style = "color:#8B9A46"> Traveling from <%= session.getAttribute("Source")%> to <%=session.getAttribute("Destination") %>  on <%=date %> </h4>
 <table align ="center" >

<tr style ="background-color:#7CD1B8" >
		<th>FlightNo   &nbsp;</th>
        <th>Flight Company &nbsp;</th>
        <th>Price &nbsp;</th>
        <th>DepartureTime &nbsp;</th>
        <th>ArrivalTime &nbsp;</th>
        <th>&nbsp; </th>
</tr>

<%
while(resultSet.next()){
%>


<tr>

<td><%=resultSet.getInt("FlightNo")%></td>
<td><%=resultSet.getString("FlightCompany") %></td>
<td><%=resultSet.getInt("price")%></td>
<td><%=resultSet.getString("DepartureTime") %></td>
<td><%=resultSet.getString("ArrivalTime") %></td>
<td>
<form action = "LoginServlet"> 
<input type="hidden" name="modalForm" value="Bookflight"/>
<input type="hidden" name="flightnumber" value=<%=resultSet.getInt("FlightNo")%>> 	

<input type = "submit" value ="Book Flight" >
</form>
</td>

</tr>

<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>
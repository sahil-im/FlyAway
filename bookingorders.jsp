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
  <br>
   <br>
    <br>
	<h4 align = "center" style ="color:#8946A6"> Booking Orders List ..</h4>
</body>
</html>
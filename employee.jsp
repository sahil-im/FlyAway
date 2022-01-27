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


<div>
    
    <h4 style ="color:#8946A6">Register New Employee Details</h4>
    <form action="EmployeeServlet">
        <table>
            <tr>
                <td>FullName :</td>
                <td>
                    <input type="text" name="FullName" id="" placeholder="Rajashekhar">
                </td>
            </tr>
            
            <tr>
                <td>Email :</td>
                <td>
                    <input type="email" name="Email" id="" placeholder="abc@gmail.com">
                </td>
            </tr>
            <tr>
                <td>Phone Number :</td>
                <td>
                    <input type="text" name="PhoneNumber" id="" placeholder="9632587410">
                </td>
            </tr>
            <tr>
                <td>UserName :</td>
                <td>
                    <input type="text" name="UserName" id="" placeholder="raja24">
                </td>
            </tr>

        </table>
       <input type="hidden" name="modalForm" value="register"/>
       <br>

       <b > <input type="submit" value="Save" ></b> 
            </form>
</div>

<hr>
<br>
<br>

<div>
 <h4 style ="color:#8946A6">Company Employee List</h4>

   <form action="EmployeeServlet">
        <input type="hidden" name="modalForm" value="lists"/>
        <input type="submit" value="EmployeeList">
   </form>

</div>

<hr>
<br>
<br>

<div>
 <h4 style ="color:#8946A6">Search Employee Details :</h4>
    <form action="EmployeeServlet">
        UserName:
        <input type="text" name="username" placeholder="raja24" >
        <input type="hidden" name="modalForm" value="search"/>
        <input type="submit" value ="Search">
    </form>

</div>

<hr>
<br>
<br>

<div>
    <h4 style ="color:#8946A6">Delete</h4>
    <form action="EmployeeServlet">
        UserName :
        <input type="text" name="username" id="" placeholder="raja24">
        <input type="hidden" name="modalForm" value="delete"/>
        <input type="submit" value="Delete">

    </form>
</div>
	
</body>
</html>
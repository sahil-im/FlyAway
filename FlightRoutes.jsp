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
	<h4 style ="color:#8946A6" >Some of the Reference Route Lists</h4>
<div>
        
    <table>
        <tr>
            <th>Route_ID</th>
            <th>Source Location</th>
            <th>Destination Location</th>
        </tr>
        <tr>
            <td>01</td>
            <td>Hyderabad</td>
            <td>Banglore</td>
        </tr>
        <tr>
            <td>02</td>
            <td>Hyderabad</td>
            <td>Mumbai</td>
        </tr>
        <tr>
            <td>03</td>
            <td>Mumbai</td>
            <td>Banglore</td>
        </tr>
        <tr>
            <td>04</td>
            <td>Hyderabad</td>
            <td>Delhi</td>
        </tr>
        <tr>
            <td>05</td>
            <td>Delhi</td>
            <td>Banglore</td>
        </tr>

        <tr>
            <td>05</td>
            <td>Delhi</td>
            <td>Banglore</td>
        </tr>

    </table>
    
</div>
<hr>
<br>
<h4 style ="color:#8946A6"> Add Routes into database </h4>

<div>
    <form action="AdminServlet">
        <table>
            <tr>
                <td>Route_ID :</td>
                <td><input type="text" name="routeid" id="" placeholder="04"></td>
            </tr>
            <tr>
                <td>Source Location: </td>
                <td>
                      <select name="sourcelocation" id="flights" required>
        
                        <option value="Banglore">Banglore</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Hyderabad">Hyderabad</option> 
                        <option value="Kolkatta">Kolkatta</option>
                        <option value="Mumbai">Mumbai</option>
                        
                      </select >
                </td>
            </tr>
            <tr>
                <td>DEstination Location :</td>
                <td>
                      <select name="destinationlocation" id="flights" required>
        
                        <option value="Banglore">Banglore</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Hyderabad">Hyderabad</option> 
                        <option value="Kolkatta">Kolkatta</option>
                        <option value="Mumbai">Mumbai</option>
                        
                      </select >
               
                </td>                  
               
            </tr>

        </table>
        <input type="hidden" name="modalForm" value="routeRegister"/>
        <input type="checkbox" name="chkbox" id="" required> 
        please verify the details and click on check box <br>
        <br>
        <input type="submit" value="Save">
    </form>
</div>
<hr>
<br>
<div>
    <h4 style ="color:#8946A6">Add New Flight Details</h4>  
    <form action="AdminServlet">
    <table>
        <tr>
            <td>Flight No:</td>
            <td><input type="text" name="flightno" id="" placeholder="01"></td>
        </tr>
        <tr>
            <td>Flight Company:</td>
            <td>
	            <select name="flightcompany" id="">
				    <option value="Air India">Air India</option>
				    <option value="IndiGo">IndiGo</option>
				    <option value="SpiceJet">SpiceJet</option>
				    <option value="AirAsia India">AirAsia India</option>
				    <option value="TruJet">TruJet</option>
				</select>
			</td>
        </tr>
        <tr>
            <td>One Seat Price :</td>
            <td><input type="text" name="price" placeholder="Rs.1999" id=""></td>
        </tr>
        <tr>
            <td>Traveling Date :</td>
            <td><input type="date" name="travelingdate" id=""></td>
        </tr>
        
        <tr>
		    <td>Available Seats :</td>
		    <td><input type="text" name="noofseats" id="" placeholder="10"></td>
		</tr>
        
        <tr>
            <td>Departure Time :</td>
            <td><input type="time" name="departuretime" id=""></td>
        </tr>
        <tr>
            <td>Arrival Time :</td>
            <td><input type="time" name="arrivaltime" id=""></td>
        </tr>
        <tr>
            <td>Route_ID :</td>
            <td><input type="text" name="routeid" id="" placeholder="04"></td>
        </tr>
        </table>
       <input type="hidden" name="modalForm" value="flightregister"/>

        <input type="submit" value="Save">
    </form>
</div>

</body>
</html>
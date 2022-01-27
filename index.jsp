<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>


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
            <a class="nav-link active" aria-current="page" href="index.jsp" >Home</a>
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



<div align="center">
    <h2>Search Flights</h2>
    <form action="FlightList">
        <table>
            <tr>
                <td>Source Location <b style ="color:red">*</b>:</td>
                <td>
                    <select name="StartLocation" id="flights" required>
        
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
                <td>Destination Location <b style ="color:red">*</b>:</td>
                <td>
                    <select name="DestinationLocation" id="flights" required>
	     
                        <option value="Banglore">Banglore</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Hyderabad">Hyderabad</option> 
                        <option value="Kolkatta">Kolkatta</option>
                        <option value="Mumbai">Mumbai</option>
              
                    </select>
                </td>                  
               
            </tr>

            <tr>
                <td>Traveling Date <b style ="color:red">*</b>: </td>
                <td><input type="date" name = "Traveldate" required></td>
            </tr>
            <tr>
                <td> Travelers <b style ="color:red">*</b>:</td>
                <td>
                    <select name="travellers" required>
    
                        <option value="1">01</option>
                        <option value="2">02</option>
                        <option value="3">03</option>
                        <option value="4">04</option>
                        <option value="5">05</option>
                    </select>
                </td>
            </tr>

        </table>
        <input type="checkbox" name="chkbox" id="" required>
        please check traveling locations should be different <br>
        and click on check box <b style ="color:red">*</b>
        <br>
        
        <input type="submit" value="Search Flights">
            </form>
    </div>
   
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
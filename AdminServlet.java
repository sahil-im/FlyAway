package com.flyaway;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String modalForm = request.getParameter("modalForm");
		
		System.out.println("AdminServlet");
		
		AdminService adobj = new AdminService();

		if(modalForm.equals("routeRegister"))
		{
			String sourceLocation = request.getParameter("sourcelocation");
			String destinationLocation = request.getParameter("destinationlocation");
			int routeid = Integer.parseInt(request.getParameter("routeid"));
			
			adobj.routeRegister(routeid,sourceLocation,destinationLocation);
			
		}
		else if(modalForm.equals("flightregister"))
		{
			int flightno = Integer.parseInt(request.getParameter("flightno"));
			String flightcompany = request.getParameter("flightcompany");
			int price = Integer.parseInt(request.getParameter("price"));
			int noofseats = Integer.parseInt(request.getParameter("noofseats"));
			String travelingdate = request.getParameter("travelingdate");
			String departuretime = request.getParameter("departuretime");
			String arrivaltime = request.getParameter("arrivaltime");
			int routeid = Integer.parseInt(request.getParameter("routeid"));
			
			adobj.flightRegister(flightno,flightcompany,price,travelingdate,noofseats,departuretime,arrivaltime,routeid);	
			
		}
	
	}

	

}
package com.flyaway;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FlightList extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startLocation = request.getParameter("StartLocation");
		String destinationLocation = request.getParameter("DestinationLocation");
		String traveldate = request.getParameter("Traveldate");
		int nooftravellers = Integer.parseInt(request.getParameter("travellers")) ;
		
		HttpSession session = request.getSession();
		session.setAttribute("Source", startLocation);
		session.setAttribute("Destination", destinationLocation);
		session.setAttribute("Date", traveldate);
		session.setAttribute("Travellers", nooftravellers);
		
		String date =(String) session.getAttribute("Date");
		System.out.println(date);
		
		
		if(startLocation.equals(destinationLocation)) {
			
			
								
			response.getWriter().println("Please select Start and Destination Locations Should be Different");
		
			response.sendRedirect("index.jsp");
		}
		else 
		{
			session.setAttribute("SourceLocation", startLocation);
			response.sendRedirect("flightlists.jsp");
			
		}
		
		
	}

}
package com.flyaway;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserServices dbobj = new UserServices();
		
	boolean found = dbobj.validateCustomer(email,password);
	HttpSession session = request.getSession();
	String modalform = request.getParameter("modalForm");
	
	if(modalform.equals("Bookflight"))
	{
		session.setAttribute("Bookflighton", "yes");
		session.setAttribute("Bookflighton", "yes");
		int flightno = Integer.parseInt(request.getParameter("flightnumber")) ;
		session.setAttribute("FlightNumber", flightno);
		System.out.print(flightno);
		
		if(session.getAttribute("Email") != null) {
		response.sendRedirect("booking.jsp");
		}
		else
		{
			response.sendRedirect("login.html");
		}
	}
	else if(modalform.equals("login"))
	{
		if(found == true) {
			response.getWriter().println("Login details Correct");
			
			session.setAttribute("Email", email);
			if(session.getAttribute("Bookflighton").equals("yes")) {
			response.sendRedirect("booking.jsp");
			}
			else {
			response.sendRedirect("index.jsp");
			}
		}
		else
		{
			request.setAttribute("Error","User Credentials are Invalid");
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.include(request, response);
			
		}
	 
	}
	else if(modalform.equals("BookingPayment"))
	{
		System.out.println("Booking Servlet");
		String emial =(String) session.getAttribute("Email");
		String date =(String) session.getAttribute("Date");
		String source =(String) session.getAttribute("Source");
		String departuretime =(String) session.getAttribute("BookingDepartureTime");
		String destination =(String) session.getAttribute("Destination");
		String arrivaltime =(String) session.getAttribute("BookingArrivalTime");
		int flightno = (int)session.getAttribute("BookingFlightNo");
		String flightcompany =(String) session.getAttribute("BookingFlightCompany");
		int nooftravllers = (int)session.getAttribute("Travellers");
		int totalamount = (int)session.getAttribute("TotalAmount");
		System.out.println(flightcompany);
		System.out.println(departuretime);
		dbobj.bookingOrderInsert(emial,date,source,departuretime,destination,arrivaltime,flightno,flightcompany,nooftravllers,totalamount);
		response.getWriter().println("Ticket Booking Sucessfully Completed !");
		response.sendRedirect("OrderHistory.jsp");
		
	}
	else
	{
		request.setAttribute("Error","User Credentials are Invalid");
		RequestDispatcher rd = request.getRequestDispatcher("login.html");
		rd.include(request, response);
		
	}
	
	} 

}
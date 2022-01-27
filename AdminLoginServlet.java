package com.flyaway;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AdminService dbobjj = new AdminService();
	boolean found =dbobjj.validateEmployee(username,password);
	
	HttpSession session = request.getSession();
	
	   		
		if(found == true)
		{			
			response.getWriter().println("Login details Correct");
			
			session.setAttribute("UserName", username);
			response.sendRedirect("AdminWelcome.jsp");
		 
		}
		
		else
		{
			response.getWriter().print("User Credentials are Invalid"); 
			response.sendRedirect("admin.jsp");
			
			
		}
	}


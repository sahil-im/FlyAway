package com.flyaway;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmployeeServlet
 */
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("UserName");
		String fullname = request.getParameter("FullName");
		String email = request.getParameter("Email");
		String phonenumber = request.getParameter("PhoneNumber");
		
		String modalForm = request.getParameter("modalForm");
		
		System.out.println("Employee Servlet details");
		
		HttpSession session =request.getSession();
		  session.setAttribute("modalForm", modalForm);
		
		AdminService adobj = new AdminService();
		if(modalForm.equals("register"))
		{
			adobj.employeeRegistarion(fullname,email,phonenumber,username);
		}
		else if(modalForm.equals("lists"))
		{
			response.sendRedirect("employeelist.jsp");
		}
		else if(modalForm.equals("search"))
		{
			System.out.println(session.getAttribute("modalForm"));
			
			response.sendRedirect("employeelist.jsp");
		}
		else if(modalForm.equals("delete"))
		{
			
		}
		else
		{
			System.out.print("Invalid Modal Form");
		}
	}

	

}
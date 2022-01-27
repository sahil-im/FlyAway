package com.flyaway;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pnumber =request.getParameter("pnumber");
		String password = request.getParameter("password");
		String confirmpasssword = request.getParameter("passwordRepeat");
		
		
		
		if(password.equals(confirmpasssword))
		{
			Member member = new Member(name, email, password, pnumber);
			UserServices dbobj = new UserServices();
			String result = dbobj.insert(member);
			response.getWriter().println(member.getName());
			response.getWriter().println(result);
			response.getWriter().println("Registration Sucessfully Completed");
		}
		else
		{
			response.getWriter().print("Password not matched with Confirm Password, Please enter correct passoword");
		}
	}


}
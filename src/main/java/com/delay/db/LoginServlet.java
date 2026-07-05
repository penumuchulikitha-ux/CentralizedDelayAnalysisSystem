package com.delay.db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		    String empNo = request.getParameter("empNo");
		    String password = request.getParameter("password");

		    if(empNo.equals("admin") && password.equals("admin")) 
		    {
		    	request.getSession().setAttribute("username", empNo);
		    	response.sendRedirect("DashboardServlet");
		    } else {
		        response.sendRedirect("login.jsp");
	     }
	}
}

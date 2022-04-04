package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//This Servlet is called when User wants to Logout
@WebServlet("/Logout")
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try(PrintWriter out = response.getWriter()){
			if(request.getSession().getAttribute("login")!= null) {
				//If user is logged in
		request.getSession().removeAttribute("login");
		//Remove users session attribute
		response.sendRedirect("./jsp/Login.jsp");
		
}		else {response.sendRedirect("index.jsp");
	
}
			

}
}}
package com.capstoneproject.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//This Servlet is called when Customer wants to add an item from a different Restaurant 
@WebServlet("/RemoveCartitems")
public class RemoveCartitems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ans = Integer.parseInt(request.getParameter("ans"));
		//Retrieve yes or no option from confirmation page
		if(ans==1) {	//If answer is "Yes"
			HttpSession session = request.getSession();
			session.removeAttribute("cart-list"); 
			//Remove Cart Items if the user proceeds to add items from different restaurant
			response.sendRedirect("./jsp/UserRestaurantPage.jsp");
			
			
		}else if(ans==2){	//Else if answer is "No"
			response.sendRedirect("./jsp/UserRestaurantPage.jsp");
			//If answer is NO, cart item session attribute is retained and user is redirected to previous page
		}

	}

	
}

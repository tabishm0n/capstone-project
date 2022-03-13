package com.capstoneproject.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/RemoveCartitems")
public class RemoveCartitems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ans = Integer.parseInt(request.getParameter("ans"));
		if(ans==1) {
			HttpSession session = request.getSession();
			session.removeAttribute("cart-list"); 
			
			response.sendRedirect("./jsp/UserRestaurantPage.jsp");
			
			
		}else if(ans==2){
			response.sendRedirect("./jsp/UserRestaurantPage.jsp");
			
		}

	}

	
}

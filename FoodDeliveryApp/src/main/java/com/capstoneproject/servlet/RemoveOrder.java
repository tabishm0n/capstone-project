package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.OrderDao;

//Servlet is called when Customer tries to create a new order from a restaurant while an order is already active from that restaurant
@WebServlet("/RemoveOrder")
public class RemoveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
		int ans = Integer.parseInt(request.getParameter("ans"));
		//Retrieve yes or no option from confirmation page
		String rid =request.getParameter("rid");
		String oid = request.getParameter("oid");
		if(ans==1) {	//If answer is "Yes"
			OrderDao orderDao = new OrderDao(DbCon.getConnection());
			orderDao.removeExistingOrder(Integer.parseInt(oid),Integer.parseInt(rid));
			//Execute SQL query to remove existing order details(for the same restaurant) from all related tables in database
			response.sendRedirect("./jsp/Cart.jsp");
		}else if(ans==2){	//Else if answer is "No"
			HttpSession session = request.getSession();
			session.removeAttribute("cart-list"); 
			//If Answer is NO, retain previous order and drop cart items
			response.sendRedirect("./jsp/UserOrders.jsp");
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

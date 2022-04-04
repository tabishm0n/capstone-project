package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.OrderDao;

//This Servlet is called when Deliverer pickups an order for delivery
@WebServlet("/PickupOrder")
public class PickupOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			String oid = request.getParameter("oid");
			String did = request.getParameter("did");
			String earning = request.getParameter("earning");
			//Retrieve parameters from previous page, here Order ID, Deliverer ID and earnings from trip
			if(oid!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.pickupOrder(Integer.parseInt(oid),Integer.parseInt(did),Float.parseFloat(earning));
				//Execute SQL query which updates order status for order and adds order details to deliverers order table
			}
			
				response.sendRedirect("./jsp/UserHomepage.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}

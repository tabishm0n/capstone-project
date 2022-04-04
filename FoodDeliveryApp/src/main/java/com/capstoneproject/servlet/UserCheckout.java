package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.OrderDao;
import com.capstoneproject.model.Cart;
import com.capstoneproject.model.Orderitems;
import com.capstoneproject.model.Orders;
import com.capstoneproject.model.User;

//This Servlet is called when Customer wants to Checkout items with current Cart list and place an Order
@WebServlet("/Checkout")
public class UserCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter();){
			Date date = new Date();
			java.sql.Timestamp sqldate = new java.sql.Timestamp(date.getTime());
			//Get Current Time
			ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
			//Retrieve all cart items
			int rid = Integer.parseInt(request.getParameter("rid"));
			User login = (User) request.getSession().getAttribute("auth");
			//Retrieve User details and Restaurant ID from where user has placed Order from
			List<Orders>orderslist = null;
			List<Orderitems>existingorder = null;
			int orderID =0;
			OrderDao oDao = new OrderDao(DbCon.getConnection());
			existingorder = oDao.checkOrdersExist(login.getId(),rid);
			//Check if an order is already active with the same Restaurant
			if(!existingorder.isEmpty()) {
				//If there is an active order from the same restaurant
				request.getSession().setAttribute("existingorder", existingorder);
				//Set session attribute for existing order
				request.getRequestDispatcher("./jsp/OrderRemoveConfirmation.jsp").forward(request, response);
				//Redirect to confirmation page
			}
			else if(cart_list != null && login!=null) {
				
				boolean result = oDao.insertOrders(login.getId(),rid);
				//Insert order details in order table
				orderID = oDao.orderId(login.getId());
				for(Cart c:cart_list) { 
					Orderitems order = new Orderitems();
					order.setMenuitem_id(c.getMenuitem_id());
					order.setUser_id(login.getId());
					order.setQuantity(c.getQuantity());
					order.setOrder_date(sqldate);
					//Set details of each Menu Item from the order
					boolean result2 = oDao.insertOrderitems(order,orderID);	
					//Insert menu item details into orderitems table
				}
				cart_list.clear();
				//Clear cart when order is placed
				response.sendRedirect("./jsp/UserOrders.jsp");
				//Redirect to Customers Orders Page
				
			}else {
				//If cart is empty
				if(login==null) {
					//If user is not logged in, do not make changes to database and redirect to login page
					response.sendRedirect("./jsp/Login.jsp");
				}response.sendRedirect("./jsp/Cart.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

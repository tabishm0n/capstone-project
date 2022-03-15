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


@WebServlet("/Checkout")
public class UserCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter();){
			Date date = new Date();
			java.sql.Timestamp sqldate = new java.sql.Timestamp(date.getTime());
			// Retrieve all cart items
			ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
			int rid = Integer.parseInt(request.getParameter("rid"));
			//user authentication
			User login = (User) request.getSession().getAttribute("auth");
			List<Orders>orderslist = null;
			List<Orderitems>existingorder = null;
			int orderID =0;
			OrderDao oDao = new OrderDao(DbCon.getConnection());
			existingorder = oDao.checkOrdersExist(login.getId(),rid);
			//check auth and cart list
			if(!existingorder.isEmpty()) {
				request.getSession().setAttribute("existingorder", existingorder);
				  request.getRequestDispatcher("./jsp/OrderRemoveConfirmation.jsp").forward(request, response);
					
			}
			else if(cart_list != null && login!=null) {
				
				boolean result = oDao.insertOrders(login.getId(),rid);
				orderID = oDao.orderId(login.getId());
				for(Cart c:cart_list) { 
					//prepare order object
					Orderitems order = new Orderitems();
					order.setMenuitem_id(c.getMenuitem_id());
					order.setUser_id(login.getId());
					order.setQuantity(c.getQuantity());
					order.setOrder_date(sqldate);
					//initiate the DAO class
					
					//Calling the insert method
					boolean result2 = oDao.insertOrderitems(order,orderID);					
				}
				
				cart_list.clear();
				response.sendRedirect("./jsp/UserOrders.jsp");
				
			}else {
				if(login==null) {
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

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
import com.capstoneproject.model.Order;
import com.capstoneproject.model.User;


@WebServlet("/Checkout")
public class UserCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter();){
			Date date = new Date();
			java.sql.Date sqldate = new java.sql.Date(date.getTime());
			// Retrieve all cart items
			ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
			//user authentication
			User login = (User) request.getSession().getAttribute("auth");
			//check auth and cart list
			if(cart_list != null && login!=null) {
				for(Cart c:cart_list) {
					//prepare order object
					Order order = new Order();
					order.setOrder_id(c.getMenuitem_id());
					order.setUser_id(login.getId());
					order.setQuantity(c.getQuantity());
					order.setOrder_date(sqldate);
					//initiate the DAO class
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					//Calling the insert method
					boolean result = oDao.insertOrder(order);
					if(!result) break;
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

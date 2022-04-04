package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.*;
import com.capstoneproject.model.*;

//This Servlet is called when User wants to delete account or when Admin is terminating the Users Account
@WebServlet("/RemoveUser")
public class RemoveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String usertype= (String)request.getSession().getAttribute("usertype");
			int uid = Integer.parseInt(request.getParameter("uid"));
			//Retrieve parameters from previous page, here user type and user ID
			try {
				UserDao userDao = new UserDao(DbCon.getConnection());
				User user_info = userDao.getUserInfo(uid);
				//Retrieve User Info from method
				if(user_info!=null) {
				boolean flag=false;
				if(usertype.equals("Admin")) {
					flag=true;
				}
				if(user_info.getUser_type().equals("Customer")) {
					//If user type is Customer
					OrderDao orderDao = new OrderDao(DbCon.getConnection());
					List<Orders> orderdetails = orderDao.userOrdersList(uid);
					//Create list of all orders placed by the Customer 
					for(Orders o:orderdetails) {
						//for loop to remove orders one by one
						userDao.deleteCustomerOrder(o.getOrder_id());
					}
					userDao.deleteCustomer(uid);
					//finally remove Customer from database itself
				}else if(user_info.getUser_type().equals("Restaurant")) {
					//If user type is Resturant Manager
					RestDao restDao = new RestDao(DbCon.getConnection());
					Rest Rest = restDao.getRestdetails(user_info);
					//Retrieve Restaurant owned by restaurant manager
					userDao.deleteRestaurantOwner(uid,Rest.getRestaurant_id());
					//delete restaurant details and restaurant manager from database
				}else if(user_info.getUser_type().equals("Delivery")) {
					//If user type is Deliverer
					User delivererinfo = userDao.getDelivererDetails(user_info);
					userDao.deleteDeliverer(uid,delivererinfo.getDeliverer_id());
					//Delete deliverer details from database
				}
				if(flag) {
					//if user is removed by admin, redirect to admin homepage
				response.sendRedirect("./jsp/UserHomepage.jsp");
				}else {
					//else if user himself deletes account, redirect to index page
					response.sendRedirect("index.jsp");
				}
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}


	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

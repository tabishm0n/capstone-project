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

/**
 * Servlet implementation class RemoveUser
 */
@WebServlet("/RemoveUser")
public class RemoveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String usertype= (String)request.getSession().getAttribute("usertype");
			int uid = Integer.parseInt(request.getParameter("uid"));
			try {
				UserDao userDao = new UserDao(DbCon.getConnection());
				User user_info = userDao.getUserInfo(uid);
				if(user_info!=null) {
				boolean flag=false;
				if(usertype.equals("Admin")) {
					flag=true;
				}
				if(user_info.getUser_type().equals("Customer")) {
					OrderDao orderDao = new OrderDao(DbCon.getConnection());
					List<Orders> orderdetails = orderDao.userOrdersList(uid);
					for(Orders o:orderdetails) {
						userDao.deleteCustomerOrder(o.getOrder_id());
					}
					userDao.deleteCustomer(uid);
				}else if(user_info.getUser_type().equals("Restaurant")) {
					RestDao restDao = new RestDao(DbCon.getConnection());
					Rest Rest = restDao.getRestdetails(user_info);
					userDao.deleteRestaurantOwner(uid,Rest.getRestaurant_id());
				}else if(user_info.getUser_type().equals("Delivery")) {
					User delivererinfo = userDao.getDelivererDetails(user_info);
					userDao.deleteDeliverer(uid,delivererinfo.getDeliverer_id());
				}
				if(flag) {
				response.sendRedirect("./jsp/UserHomepage.jsp");
				}else {
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

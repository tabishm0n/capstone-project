package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.OrderDao;
import com.capstoneproject.model.Orders;

//This Servlet is called when Customer wants to cancel a placed order
@WebServlet("/CancelOrder")
public class UserCancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try(PrintWriter out = response.getWriter()){
			String id = request.getParameter("id");
			//Retrieve parameter from previous page, in this case Order ID 
			if(id!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
				//Execute SQL query to remove order details for placed order from all related tables in the database
				
			}
			
				response.sendRedirect("./jsp/UserOrders.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

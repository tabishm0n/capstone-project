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

//This Servlet called when restaurant manager accepts users order
@WebServlet("/AcceptOrder")
public class AcceptOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String id = request.getParameter("id");
			//Requesting Paramaters from previous page, here order ID
			if(id!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.acceptOrder(Integer.parseInt(id));
				//This method sets order status to 2 which is "Order Prepared" and is displayed as message on user Orders Page
			}
			
				response.sendRedirect("./jsp/UserHomepage.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

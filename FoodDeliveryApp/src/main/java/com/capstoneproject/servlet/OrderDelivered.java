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
import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.User;

//This Servlet is called when Deliverer has delivered the order to Customer
@WebServlet("/OrderDelivered")
public class OrderDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			DecimalFormat dcf = new DecimalFormat("#.##");
			request.setAttribute("dcf", dcf);
			//Set numeric formatter
			String oid = request.getParameter("oid");
			String did = request.getParameter("did");
			float amount = Float.parseFloat(request.getParameter("amount"));
			//Retrieve parameters from previous page, here order ID, deliverer ID and deliverer earnings
			String formatamount = dcf.format(amount);
			if(oid!=null) {
				User auth = (User) request.getSession().getAttribute("auth");
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				UserDao userDao = new UserDao(DbCon.getConnection());
				User delivererinfo = userDao.getDelivererDetails(auth);
				//Retrieve deliverer details and store in User object
				float walletAmount = delivererinfo.getWallet();
				//Retrieve current wallet amount of deliverer
				float newamount = walletAmount+Float.parseFloat(formatamount);
				//Add earnings from current completed trip and wallet amount which gives total wallet amount
				orderDao.orderDelivered(Integer.parseInt(oid),Integer.parseInt(did),newamount);
				//Execute SQL query which updates order status for order and updates wallet amount of deliverer
				request.getSession().setAttribute("currentwallet", newamount);
				
			}
					
			response.sendRedirect("./jsp/UserProfilePage.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

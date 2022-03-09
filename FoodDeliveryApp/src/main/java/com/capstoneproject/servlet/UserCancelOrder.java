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

@WebServlet("/CancelOrder")
public class UserCancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try(PrintWriter out = response.getWriter()){
			String id = request.getParameter("id");
			if(id!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
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

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


@WebServlet("/PickupOrder")
public class PickupOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			String oid = request.getParameter("oid");
			String did = request.getParameter("did");
			if(oid!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.pickupOrder(Integer.parseInt(oid),Integer.parseInt(did));
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

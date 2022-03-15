package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.OrderDao;

/**
 * Servlet implementation class RemoveOrder
 */
@WebServlet("/RemoveOrder")
public class RemoveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
		int ans = Integer.parseInt(request.getParameter("ans"));
		String rid =request.getParameter("rid");
		String oid = request.getParameter("oid");
		if(ans==1) {
			OrderDao orderDao = new OrderDao(DbCon.getConnection());
			orderDao.removeExistingOrder(Integer.parseInt(oid),Integer.parseInt(rid));
			
			response.sendRedirect("./jsp/Cart.jsp");
			
			
		}else if(ans==2){
			HttpSession session = request.getSession();
			session.removeAttribute("cart-list"); 
			response.sendRedirect("./jsp/UserOrders.jsp");
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

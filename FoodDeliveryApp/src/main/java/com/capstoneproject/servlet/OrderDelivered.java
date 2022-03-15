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


@WebServlet("/OrderDelivered")
public class OrderDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			DecimalFormat dcf = new DecimalFormat("#.##");
			request.setAttribute("dcf", dcf);
			String oid = request.getParameter("oid");
			String did = request.getParameter("did");
			float amount = Float.parseFloat(request.getParameter("amount"));
			String formatamount = dcf.format(amount);
			if(oid!=null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				float walletAmount = orderDao.getWallet(Integer.parseInt(did));
				float newamount = walletAmount+Float.parseFloat(formatamount);
				orderDao.orderDelivered(Integer.parseInt(oid),Integer.parseInt(did),newamount);
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

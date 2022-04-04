package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.DishDao;
import com.capstoneproject.model.Cart;
import com.capstoneproject.model.Dish;

//This Servlet is called when Restaurant Manager wants to Remove Menu Item
@WebServlet("/DeleteMenuItem")
public class DeleteMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			int mid = Integer.parseInt(request.getParameter("mid"));
			int rid = Integer.parseInt(request.getParameter("rid"));
			//Retrieve parameters from previous page, here Restaurant ID and Menu Item ID
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				dishDao.deleteMenuItem(mid,rid);
				//Run SQL query through method which sets the active status of item to boolean false in database
				response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
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

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
import javax.servlet.http.HttpSession;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.*;
import com.capstoneproject.model.*;

//This Servlet is called when Restaurant Manager wants to edit menu item details
@WebServlet("/EditMenuItem")
public class EditMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			int mid = Integer.parseInt(request.getParameter("mid"));
			int rid = Integer.parseInt(request.getParameter("rid"));
			String item_name = request.getParameter("item_name");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			float price = Float.parseFloat(request.getParameter("price"));
			//Retrieve parameters from previous page, here Restaurant details and Menu item ID
			Dish dishinfo = new Dish();
			dishinfo.setItem_name(item_name);
			dishinfo.setCategory(Integer.parseInt(category));
			dishinfo.setDescription(description);
			dishinfo.setPrice(price);
			//Create Dish object to be passed through method as parameter
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				dishDao.updateMenuItem(mid,rid,dishinfo);
				//Call method to run CRUD operation on database which updates the menu item details
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

package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.DishDao;
import com.capstoneproject.model.Cart;
import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Rest;
//This Servlet is called when Restaurant Manager wants to add a menu item to his Menu
@WebServlet("/AddMenuItem")
public class AddMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			Rest restinfo = (Rest) request.getSession().getAttribute("restinfo");
			int rid = Integer.parseInt(request.getParameter("rid"));
			String item_name = request.getParameter("item_name");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			float price = Float.parseFloat(request.getParameter("price"));
			//Retrieve parameters from previous page, here Restaurant details
			Dish dishinfo = new Dish();
			dishinfo.setItem_name(item_name);
			dishinfo.setCategory(Integer.parseInt(category));
			dishinfo.setDescription(description);
			dishinfo.setPrice(price);
			//Create object to pass into method
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				List<Dish> dishexists = dishDao.checkItemExist(item_name, restinfo.getRestaurant_id());
				//Create list if the dish already exists in the menu and is inactive, if true, run below loop
				if(!dishexists.isEmpty()) {
					Dish dishexists2 = dishDao.checkItemExist2(item_name, restinfo.getRestaurant_id());
					//Create Dish object if loop is run
					request.getSession().setAttribute("dishexists2",dishexists2);
					//Set session attribute for the existing dish Dish object
					response.sendRedirect("./jsp/MenuItemExists.jsp");
					
				}else {
					//If item doesn't exist add the new Menu Item
				dishDao.addMenuItem(rid,dishinfo);
				response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
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

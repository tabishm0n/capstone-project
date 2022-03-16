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
			Dish dishinfo = new Dish();
			dishinfo.setItem_name(item_name);
			dishinfo.setCategory(Integer.parseInt(category));
			dishinfo.setDescription(description);
			dishinfo.setPrice(price);
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				dishDao.updateMenuItem(mid,rid,dishinfo);
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

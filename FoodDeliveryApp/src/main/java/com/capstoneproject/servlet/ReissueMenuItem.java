package com.capstoneproject.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.DishDao;
import com.capstoneproject.model.Dish;

//This Servlet is called when Restaurant Manager chooses to Re-Activate a Menu Item 
@WebServlet("/ReissueMenuItem")
public class ReissueMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ans = Integer.parseInt(request.getParameter("ans"));

		//Retrieve yes or no option from confirmation page
		if(ans==1) {	//If answer is "Yes"
			
			Dish dishexists2 = (Dish) request.getSession().getAttribute("dishexists2");
			//Retrieve session Dish object, created if Dish already exists in the menu
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				dishDao.updateItem(dishexists2);
				//Execute SQL query which sets active status of menu item to ACTIVE in database
				response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}else if(ans==2){	//Else if answer is "No"
			response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
			//If answer is NO, redirect to previous page
			
		}
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

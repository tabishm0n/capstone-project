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


@WebServlet("/ReissueMenuItem")
public class ReissueMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ans = Integer.parseInt(request.getParameter("ans"));
		if(ans==1) {
			
			Dish dishexists2 = (Dish) request.getSession().getAttribute("dishexists2");
			try {
				DishDao dishDao = new DishDao(DbCon.getConnection());
				dishDao.updateItem(dishexists2);
				response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}else if(ans==2){
			response.sendRedirect("./jsp/RestaurantMenuPage.jsp");
			
		}
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

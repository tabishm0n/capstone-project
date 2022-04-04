package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.RestDao;
import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.Rest;

//This Servlet is called when Customer wants to view a specific Restaurants Menu Page
@WebServlet("/RestaurantPage")
public class UserRestaurantPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			int rid = Integer.parseInt(request.getParameter("id"));
			//Retrieve parameter from previous page, in this Restaurant ID
			RestDao rsDao = null;
			try {
				rsDao = new RestDao(DbCon.getConnection());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Rest restinfo = rsDao.UserRestdetails(rid);
			//Retrieve Restaurant Details that the user wants to view
			if(restinfo!=null) {
				request.getSession().setAttribute("userrestinfo", restinfo);
				//Store Restaurant details in Session Attribute
				request.getRequestDispatcher("./jsp/UserRestaurantPage.jsp").forward(request, response);
				//Forward to respective Restaurant Menu Page
				 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	

}

package com.capstoneproject.servlet;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.User;
import com.capstoneproject.connection.DbCon;

@WebServlet("/Login")

public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserDao usDao;
	
	public void init() {
		try {
			usDao = new UserDao(DbCon.getConnection());
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		User us = new User();
		us.setLogin(login);
		us.setPassword(password);
		try {
			if (usDao.verifyUser(us)) {
				int type = usDao.verifyType(us);
				if(type==1) {
					request.getSession().setAttribute("login", login);
					request.getRequestDispatcher("./jsp/UserHomepage.jsp").forward(request, response);
			   
				}else if(type==2) {
					request.getSession().setAttribute("login", login);
					request.getRequestDispatcher("./jsp/RestaurantHomepage.jsp").forward(request, response);
			   
				}else if(type==3) {
					request.getSession().setAttribute("login", login);
					request.getRequestDispatcher("./jsp/DeliveryHomepage.jsp").forward(request, response);
			   
				}
				 } else {
				request.setAttribute("err", "Invalid Username or Password");
				request.getRequestDispatcher("./jsp/Login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
		
}

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String city = request.getParameter("city");
		String street_address = request.getParameter("street_address");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String user_type = request.getParameter("user_type"); 
		String payment = request.getParameter("payment");
		
		User us = new User();
		us.setLogin(login);
		us.setPassword(password);
		us.setCity(city);
		us.setStreet_address(street_address);
		us.setFirst_name(first_name);
		us.setLast_name(last_name);
		us.setEmail(email);
		us.setPhone(phone);
		us.setUser_type(user_type);
		us.setPayment(payment);
		
		try {
			usDao.registerUser(us);
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
		}
		
}

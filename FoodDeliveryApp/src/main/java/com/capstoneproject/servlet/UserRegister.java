package com.capstoneproject.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.Rest;
import com.capstoneproject.model.User;

@WebServlet("/Register")
public class UserRegister extends HttpServlet{
	private static final long serialVersionUID = 1L;
	

private UserDao usDao;

public void init() {
	try {
		usDao = new UserDao(DbCon.getConnection());
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}}
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
		String usertype = us.getUser_type();
		try {if(usertype.equals("Customer")) {
			usDao.registerUser(us);
		}
		else if(usertype.equals("Restaurant")) {
				usDao.registerUser(us);
				int uid = usDao.getUserID(login,password);
				String restaurant_name = request.getParameter("restaurant_name");
				String description = request.getParameter("description");
				String rest_city = request.getParameter("rest_city");
				String rest_address = request.getParameter("rest_address");
				Rest rs = new Rest();
				rs.setRestaurant_name(restaurant_name);
				rs.setDescription(description);
				rs.setCity(rest_city);
				rs.setStreet_address(rest_address);
				usDao.registerRestUser(rs,uid);
			}
		else if(usertype.equals("Delivery")) {
				usDao.registerUser(us);
				int uid = usDao.getUserID(login,password);
				usDao.registerDeliveryUser(uid);
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("./jsp/UserInfo.jsp");
		
}
}

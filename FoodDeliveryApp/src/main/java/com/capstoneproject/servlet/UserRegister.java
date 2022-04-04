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

//This Servlet is called when a new User wants to Register
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
		//Retrieve parameter from previous page, in this case User Details
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
		//Create object User and store all details in object
		try {User userexists = usDao.verifyType(us);
		//Check whether user already exists with the same username and password
			if(userexists!=null) {
				request.setAttribute("reg_err", "User Already Exists!");
				request.getRequestDispatcher("./jsp/Register.jsp").forward(request, response);
				//If user already exists, redirect to resgiter page with error message
				
		}else{
			if(usertype.equals("Customer")) {
			//Else if User type selected is Customer, Create a new user with type Customer
			usDao.registerUser(us);
		}
		else if(usertype.equals("Restaurant")) {
				//Else if User type selected is Restaurant Manager, Create a new user with type Restaurant Manager
				usDao.registerUser(us);
				int uid = usDao.getUserID(login,password);
				String restaurant_name = request.getParameter("restaurant_name");
				String description = request.getParameter("description");
				String rest_city = request.getParameter("rest_city");
				String rest_address = request.getParameter("rest_address");
				//Retrieve the Restaurant details that the new user has entered
				Rest rs = new Rest();
				rs.setRestaurant_name(restaurant_name);
				rs.setDescription(description);
				rs.setCity(rest_city);
				rs.setStreet_address(rest_address);
				usDao.registerRestUser(rs,uid);
				//Add restaurant details to the database
			}
		else if(usertype.equals("Delivery")) {
			//Else if User type selected is Deliverer, Create a new user with type Deliverer
				usDao.registerUser(us);
				int uid = usDao.getUserID(login,password);
				usDao.registerDeliveryUser(uid);
				//Add deliverer details to the database
			}
			response.sendRedirect("./jsp/UserInfo.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
}
}

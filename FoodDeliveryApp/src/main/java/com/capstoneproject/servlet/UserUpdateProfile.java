package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.connection.DbCon;
import com.capstoneproject.dao.*;
import com.capstoneproject.model.*;

//This Servlet is called when User wants to update their info
@WebServlet("/UpdateProfile")
public class UserUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RestDao rsDao;
	private UserDao usDao;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result=false;
		
		try {rsDao = new RestDao(DbCon.getConnection());
			usDao = new UserDao(DbCon.getConnection());
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		User auth = (User) request.getSession().getAttribute("auth");
		int userID = auth.getId();
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String city = request.getParameter("city");
		String street_address = request.getParameter("street_address");
		String email = request.getParameter("email");
		String payment = request.getParameter("payment");
		String restaurant_name = request.getParameter("restaurant_name");
		String description = request.getParameter("description");
		String rest_city = request.getParameter("rest_city");
		String rest_address = request.getParameter("rest_address");
		//Retrieve all the user details from the Profile Page
		Rest rest = new Rest();
		User user = new User();
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setCity(city);
		user.setStreet_address(street_address);
		user.setEmail(email);
		user.setPayment(payment);
		rest.setRestaurant_name(restaurant_name);
		rest.setDescription(description);
		rest.setCity(rest_city);
		rest.setStreet_address(rest_address);
		//Store in object for either user or restaurant details
		try {
			String login = auth.getLogin();
			String password = auth.getPassword();
			usDao = new UserDao(DbCon.getConnection());
			User verify = usDao.verifyUser(login, password);
			User user2 = usDao.verifyType(verify);
			User us = new User();
			us.setLogin(login);
			us.setPassword(password);
			usDao.updateProfile(user,userID);
			//Execute SQL query to carry out CRUD operation to update user info in database
			String usertype = user2.getUser_type();
			if(usertype.equals("Restaurant")) {
				usDao.updateRestProfile(rest,userID);
				//Execute SQL query to update restaurant details
			}
			result=true;
			if(result) {
				if (verify != null) {
					User user1 = usDao.verifyType(us);
					if(usertype.equals("Restaurant")) {
						Rest rs1 = rsDao.getRestdetails(auth);
						String restaurant_name1 = rs1.getRestaurant_name();
						String description1 = rs1.getDescription();
						String rest_city1 = rs1.getCity();
						String rest_address1 = rs1.getStreet_address();
						request.getSession().setAttribute("rest_city", rest_city1);
						request.getSession().setAttribute("rest_address", rest_address1 );
						request.getSession().setAttribute("description", description1 );
						request.getSession().setAttribute("restaurant_name", restaurant_name1);
						//Reset restaurant session attributes with new information which the user updated their info with
					}
					String user_type = user1.getUser_type();
					String first_name1 = user1.getFirst_name();
					String last_name1= user1.getLast_name();
					String phone1= user1.getPhone(); 
					String city1= user1.getCity();
					String street_address1= user1.getStreet_address();
					String email1= user1.getEmail();
					String payment1= user1.getPayment(); 
					request.getSession().setAttribute("first_name", first_name1);
					request.getSession().setAttribute("last_name", last_name1);
					request.getSession().setAttribute("phone", phone1);
					request.getSession().setAttribute("city", city1);
					request.getSession().setAttribute("street_address", street_address1);
					request.getSession().setAttribute("email", email1);
					request.getSession().setAttribute("payment", payment1);
					request.getSession().setAttribute("auth", verify);
					request.getSession().setAttribute("login", login);
					request.getSession().setAttribute("user_type", user_type);
					//Reset session attributes with new information which the user updated their info with
					response.sendRedirect("./jsp/UserProfilePage.jsp");
					//Refresh User Profile Page
					} 
			}  
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
			}
	}



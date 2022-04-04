package com.capstoneproject.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.dao.RestDao;
import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.Rest;
import com.capstoneproject.model.User;
import com.capstoneproject.connection.DbCon;

//This Servlet is called when User tries to Login 
@WebServlet("/Login")

public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		try(PrintWriter out = response.getWriter())  {
			String login = request.getParameter("login");
			String password = request.getParameter("password");
			//Retrieve parameter from previous page, in this case Username and Password 
			UserDao usDao = null;
			RestDao rsDao = null;
			try {
				usDao = new UserDao(DbCon.getConnection());
				rsDao = new RestDao(DbCon.getConnection());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			User verify = usDao.verifyUser(login, password);
			//If user exists it will populate in User object "verify"
			if (verify != null) {
				User user = usDao.verifyType(verify);
				//If user with username and password entered does exist in database 
				String usertype = user.getUser_type();
				String first_name = user.getFirst_name();
				String last_name= user.getLast_name();
				String phone= user.getPhone(); 
				String city= user.getCity();
				String street_address= user.getStreet_address();
				String email= user.getEmail();
				String payment= user.getPayment(); 
				request.getSession().setAttribute("first_name", first_name);
				request.getSession().setAttribute("last_name", last_name);
				request.getSession().setAttribute("phone", phone);
				request.getSession().setAttribute("city", city);
				request.getSession().setAttribute("street_address", street_address);
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("payment", payment);
				request.getSession().setAttribute("auth", verify);
				request.getSession().setAttribute("login", login);
				//Store details of the user using Session attributes
				if(usertype.equals("Customer")) {
					request.getSession().setAttribute("usertype", "Customer");
					//If the user type is Customer, set user type as Customer
				}else if(usertype.equals("Restaurant")) {
					//If the user type is Restaurant Manager
					Rest restinfo = rsDao.getRestdetails(verify);
					//Retrieve Restaurant details owned by the Restaurant Manager
					request.getSession().setAttribute("restinfo", restinfo);
					request.getSession().setAttribute("usertype", "Restaurant");
					//Set user type as Restaurant Manager and store Restaurant Details
					String restaurant_name1 = restinfo.getRestaurant_name();
					String description1 = restinfo.getDescription();
					String rest_city1 = restinfo.getCity();
					String rest_address1 = restinfo.getStreet_address();
					request.getSession().setAttribute("rest_city", rest_city1);
					request.getSession().setAttribute("rest_address", rest_address1 );
					request.getSession().setAttribute("description", description1 );
					request.getSession().setAttribute("restaurant_name", restaurant_name1);
					//Store details of the restaurant using Session attributes
					
				}else if(usertype.equals("Delivery")) {
					//If the user type is Deliverer
					User delivererinfo = usDao.getDelivererDetails(verify);
					//Retrieve Deliverer details 
					float currentwallet = delivererinfo.getWallet();
					request.getSession().setAttribute("currentwallet", currentwallet);
					request.getSession().setAttribute("delivererinfo", delivererinfo);
					//Store details of the deliverer using Session attributes
					request.getSession().setAttribute("usertype", "Delivery");
					//Set user type as Deliverer
				}else if(usertype.equals("Admin")) {
					//If the user type is Admin, set user type as Admin
					request.getSession().setAttribute("usertype", "Admin");
					
				}request.getRequestDispatcher("./jsp/UserHomepage.jsp").forward(request, response);
				   //Finally redirect user to Homepage upon successfull login attempt
				 } else {
					 //If user doesn't exist in database
				request.setAttribute("err", "Invalid Username or Password");
				request.getRequestDispatcher("./jsp/Login.jsp").forward(request, response);
				//Redirect to Login page with error message
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

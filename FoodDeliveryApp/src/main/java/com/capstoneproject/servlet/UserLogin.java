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

@WebServlet("/Login")

public class UserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	

	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		try(PrintWriter out = response.getWriter())  {
			String login = request.getParameter("login");
			String password = request.getParameter("password");
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
			if (verify != null) {
				User user = usDao.verifyType(verify);
				String usertype = user.getUser_type();
				String first_name = user.getFirst_name();
				String last_name= user.getLast_name();
				String phone= user.getPhone(); 
				String city= user.getCity();
				String street_address= user.getStreet_address();
				String email= user.getEmail();
				String payment= user.getPayment(); 
				request.getSession().setAttribute("usertype", usertype);
				request.getSession().setAttribute("first_name", first_name);
				request.getSession().setAttribute("last_name", last_name);
				request.getSession().setAttribute("phone", phone);
				request.getSession().setAttribute("city", city);
				request.getSession().setAttribute("street_address", street_address);
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("payment", payment);
				request.getSession().setAttribute("auth", verify);
				request.getSession().setAttribute("login", login);
				if(usertype.equals("Customer")) {
					request.getSession().setAttribute("usertype", "Customer");
					
				}else if(usertype.equals("Restaurant")) {
					Rest restinfo = rsDao.getRestdetails(verify);
					request.getSession().setAttribute("restinfo", restinfo);
					request.getSession().setAttribute("usertype", "Restaurant");
					String restaurant_name1 = restinfo.getRestaurant_name();
					String description1 = restinfo.getDescription();
					String rest_city1 = restinfo.getCity();
					String rest_address1 = restinfo.getStreet_address();
					request.getSession().setAttribute("rest_city", rest_city1);
					request.getSession().setAttribute("rest_address", rest_address1 );
					request.getSession().setAttribute("description", description1 );
					request.getSession().setAttribute("restaurant_name", restaurant_name1);
				
					
				}else if(usertype.equals("Delivery")) {
					User delivererinfo = usDao.getDelivererDetails(verify);
					float currentwallet = delivererinfo.getWallet();
					request.getSession().setAttribute("currentwallet", currentwallet);
					request.getSession().setAttribute("delivererinfo", delivererinfo);
					request.getSession().setAttribute("usertype", "Delivery");
					
				}else if(usertype.equals("Admin")) {
					request.getSession().setAttribute("usertype", "Admin");
					
				}request.getRequestDispatcher("./jsp/UserHomepage.jsp").forward(request, response);
				   
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

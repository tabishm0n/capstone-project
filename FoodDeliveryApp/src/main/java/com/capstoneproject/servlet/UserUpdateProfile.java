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
import com.capstoneproject.dao.OrderDao;
import com.capstoneproject.dao.UserDao;
import com.capstoneproject.model.Cart;
import com.capstoneproject.model.Orderitems;
import com.capstoneproject.model.Orders;
import com.capstoneproject.model.User;

/**
 * Servlet implementation class UserUpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UserUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UserDao usDao;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result=false;
		try {
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
		User user = new User();
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setCity(city);
		user.setStreet_address(street_address);
		user.setEmail(email);
		user.setPayment(payment);
		try {
			usDao.updateProfile(user,userID);
			result=true;
			}
		catch(Exception e) {
			e.printStackTrace();
		}if(result) {
			String login = auth.getLogin();
			String password = auth.getPassword();
			try {
				usDao = new UserDao(DbCon.getConnection());
				User verify = usDao.verifyUser(login, password);
				User us = new User();
				us.setLogin(login);
				us.setPassword(password);
				if (verify != null) {
					User user1 = usDao.verifyType(us);
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
					response.sendRedirect("./jsp/UserProfilePage.jsp");
					 } 
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			}
	}

}

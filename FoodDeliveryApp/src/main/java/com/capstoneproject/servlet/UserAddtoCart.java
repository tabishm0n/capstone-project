package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.capstoneproject.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//This Serlvet is called when user adds items to Cart
@WebServlet("/AddToCart")
public class UserAddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList= new ArrayList<>(); 
			//Create a new list called cartList, which will hold all menu items
			int mid = Integer.parseInt(request.getParameter("mid"));
			int rid = Integer.parseInt(request.getParameter("rid"));
			Cart ct = new Cart();
			ct.setMenuitem_id(mid);
			ct.setRestaurant_id(rid);
			ct.setQuantity(1);
			//Set menu item of item, restaurant id of item and quantity to 1 for Cart object, when Item is added to cart
			HttpSession session = request.getSession();
			session.removeAttribute("itemexist"); //Remove error message when and add button is pressed (for preserving UI functionality)
			ArrayList<Cart> cart_list= (ArrayList<Cart>) session.getAttribute("cart-list");
			//Retrieve cart list if already exists
			if(cart_list==null) {
				//If cart list is empty, create a new cart list 
				cartList.add(ct);
				//Add Cart object to cartList list
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("./jsp/UserRestaurantPage.jsp");
				
			}
			else {
				// if cartList already exists
				cartList = cart_list;
				boolean exists= false;
				
				  for(Cart c:cart_list) { 
					  //for each item existing in current Cart List
					  if(c.getRestaurant_id()!=rid) {
						  //If user adds an item from a different restaurant to cart 
						  exists=true;
						  request.getRequestDispatcher("./jsp/CartRemoveConfirmationPage.jsp").forward(request, response);
						  //forward user to confirmation page, where he will either create new cart list with items from new restaurant 
						  //or retain current cart with previous restaurant
						}
					  else if(c.getMenuitem_id()==mid) {
						  //If item already exists in cart
							  exists=true;
							  request.getSession().setAttribute("itemexist", "Item Already exist in Cart!");
							  //error message
							  Dish itemexists = new Dish();
							  itemexists.setMenuitem_id(mid);
							  request.getSession().setAttribute("itemexistsid",itemexists);
							  //create an object for condition to be used in an if loop, where menu item is compared in a for loop on jsp page displaying all menu items
							  //and error is shown only when menu item matches listing where user tried to add item to cart from, and is shown error on that listing only
							  response.sendRedirect("./jsp/UserRestaurantPage.jsp");
						  }
				 
				 }
				  if(!exists) {
					  //adding a new menu item if it doesnt already exist in cart
					  cartList.add(ct);
					  response.sendRedirect("./jsp/UserRestaurantPage.jsp");
				  }
				 
			}
		}
	}

}

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


@WebServlet("/AddToCart")
public class UserAddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList= new ArrayList<>(); 
			
			int mid = Integer.parseInt(request.getParameter("mid"));
			int rid = Integer.parseInt(request.getParameter("rid"));
			Cart ct = new Cart();
			ct.setMenuitem_id(mid);
			ct.setRestaurant_id(rid);
			ct.setQuantity(1);
			
			HttpSession session = request.getSession();
			session.removeAttribute("itemexist"); 
			ArrayList<Cart> cart_list= (ArrayList<Cart>) session.getAttribute("cart-list");
			if(cart_list==null) {
				cartList.add(ct);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("./jsp/UserRestaurantPage.jsp");
			}
			else {
				cartList = cart_list;
				boolean exists= false;
				
				  for(Cart c:cart_list) { 
					  if(c.getRestaurant_id()!=rid) {
						  exists=true;
						  request.getRequestDispatcher("./jsp/CartRemoveConfirmationPage.jsp").forward(request, response);
						}
					  else if(c.getMenuitem_id()==mid) {
							  exists=true;
							  
							  request.getSession().setAttribute("itemexist", "Item Already exist in Cart!");
							  Dish itemexists = new Dish();
							  itemexists.setMenuitem_id(mid);
							  request.getSession().setAttribute("itemexistsid",itemexists);
							  response.sendRedirect("./jsp/UserRestaurantPage.jsp");
						  }
				 
				 }
				  if(!exists) {
					  cartList.add(ct);
					  response.sendRedirect("./jsp/UserRestaurantPage.jsp");
				  }
				 
			}
		}
	}

}

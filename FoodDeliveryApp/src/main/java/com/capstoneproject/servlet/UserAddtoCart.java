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
			int id = Integer.parseInt(request.getParameter("id"));
			Cart ct = new Cart();
			ct.setMenuitem_id(id);
			ct.setQuantity(1);
			
			HttpSession session = request.getSession();
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
				  if(c.getMenuitem_id()==id) {
					  exists=true;
					  out.println("<h3 style='color: crimson; text-align: center'>Item Already exist in cart<a href='./jsp/Cart.jsp'>Go to Cart</a></h3>'");
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

package com.capstoneproject.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstoneproject.model.*;

@WebServlet("/Quantity")
public class UserQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter();){
			String action = request.getParameter("action");
			int id  = Integer.parseInt(request.getParameter("id"));
			ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
			if(action!=null&&id>=1) {
				if(action.equals("rem")) {
					if(cart_list!=null) {
						for(Cart c:cart_list) {
							if(c.getMenuitem_id()==id) {
								cart_list.remove(cart_list.indexOf(c));
								break;
						
						}
							
						}
						response.sendRedirect("./jsp/Cart.jsp");
					}	
				}else if(action.equals("chng1")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=1;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng2")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=2;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng3")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=3;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng4")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=4;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng5")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=5;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng6")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=6;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng7")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=7;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng8")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=8;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng9")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=9;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}else if(action.equals("chng10")) {
					for(Cart c:cart_list) {
						if(c.getMenuitem_id() == id) {
							int quantity = c.getQuantity();
							quantity=10;
							c.setQuantity(quantity);
							break;
						}
					}response.sendRedirect("./jsp/Cart.jsp");
				}
			}else {response.sendRedirect("./jsp/Cart.jsp");
				
			}
		}
	}
}

package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Orderitems;
import com.capstoneproject.model.Orders;

public class OrderDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public OrderDao(Connection con) {
		this.con = con;
	}
	public boolean insertOrders(int id) {
		boolean result = false;
		
		try {
			String ORDER_INSERT_SQL = "INSERT INTO orders (user_id) VALUES (?) ; ";
			ps = this.con.prepareStatement(ORDER_INSERT_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			result=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	  public List<Orders> userOrdersList(int id) { List<Orders> list = new
	  ArrayList<>(); String ORDER_ID_SQL =
	  "SELECT order_id FROM orders WHERE user_id=?"; try { ps =
	 this.con.prepareStatement(ORDER_ID_SQL); ps.setInt(1, id); rs =
	  ps.executeQuery(); while(rs.next()) { Orders order = new Orders();
	  order.setOrder_id(rs.getInt("order_id")); list.add(order); }
	  
	  } catch (SQLException e) { e.printStackTrace(); } return list; }
	 
	public int orderId(int id) {
		int res=0;
		String ORDER_ID_SQL = "SELECT order_id FROM orders WHERE user_id=? ORDER BY order_id DESC LIMIT 1;";
		try {
			ps = this.con.prepareStatement(ORDER_ID_SQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				res = rs.getInt("order_id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	public List<Orderitems> userOrderItems(int id){
		List<Orderitems> list = new ArrayList<>();
		
		try {
			String SELECT_ORDER_SQL = "SELECT oi.menuitem_id, mi.item_name, oi.quantity FROM orderitems oi INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id WHERE oi.order_id=? ORDER BY oi.order_id DESC;";
			ps = this.con.prepareStatement(SELECT_ORDER_SQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Orderitems order = new Orderitems();
				order.setMenuitem_id(rs.getInt("menuitem_id"));
				order.setItem_name(rs.getString("item_name"));
				order.setQuantity(rs.getInt("quantity"));
				list.add(order);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return list;
	}
	public boolean insertOrderitems(Orderitems model,int id) {
		boolean result = false;
		try {
			String ORDER_INSERT_SQL = " INSERT INTO orderitems (order_id,menuitem_id,quantity,order_date)"
					+ " (SELECT order_id,?,?,NOW() FROM orders WHERE order_id=?);";
			ps = this.con.prepareStatement(ORDER_INSERT_SQL);
			ps.setInt(1, model.getMenuitem_id());
			ps.setInt(2,model.getQuantity());
			ps.setInt(3, id);
			ps.executeUpdate();
			result=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Orderitems> userOrders(int uid,int oid){
		List<Orderitems> list = new ArrayList<>();
		
		try {
			String SELECT_ORDER_SQL = " SELECT SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,TO_CHAR (oi.order_date,'HH12:MI:SS')date,oi.order_id from orderitems oi INNER JOIN menu_item mi on mi.menuitem_id=oi.menuitem_id INNER JOIN orders od ON od.order_id=oi.order_id WHERE oi.order_id=? AND od.user_id=? GROUP BY oi.order_id,date ORDER BY oi.order_id DESC;";
			ps = this.con.prepareStatement(SELECT_ORDER_SQL);
			ps.setInt(1, oid);
			ps.setInt(2, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				Orderitems order = new Orderitems();
				order.setOrder_id(rs.getInt("order_id"));
				order.setPrice(rs.getFloat("total"));
				order.setQuantity(rs.getInt("items"));
				order.setOrder_date(rs.getTimestamp("date"));
				list.add(order);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return list;
	}
	


	public void cancelOrder(int id){
		try {
			String DELETE_ORDER_SQL = "DELETE FROM orderitems WHERE order_id=?;DELETE FROM orders WHERE order_id=?;";
			ps = this.con.prepareStatement(DELETE_ORDER_SQL);
			ps.setInt(1,id);
			ps.setInt(2,id);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}

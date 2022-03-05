package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Order;

public class OrderDao {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public OrderDao(Connection con) {
		this.con = con;
	}
	public boolean insertOrder(Order model) {
		
		boolean result = false;
		Date date = new Date();
		java.sql.Date sqldate = new java.sql.Date(date.getTime());
		
		try {
			String ORDER_INSERT_SQL = "INSERT INTO order_table(menuitem_id,user_id,quantity,order_date) values (?,?,?,?);";
			ps = this.con.prepareStatement(ORDER_INSERT_SQL);
			ps.setInt(1, model.getMenuitem_id());
			ps.setInt(2, model.getUser_id());
			ps.setInt(3,model.getQuantity());
			ps.setDate(4, sqldate);
			ps.executeUpdate();
			result=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Order> userOrders(int id){
		List<Order> list = new ArrayList<>();
		
		try {
			String SELECT_ORDER_SQL = "SELECT order_id,o.menuitem_id as menuitem_id,quantity,order_date,item_name,price FROM order_table o INNER JOIN menu_item m on m.menuitem_id = o.menuitem_id WHERE user_id=?;";
			ps = this.con.prepareStatement(SELECT_ORDER_SQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setMenuitem_id(rs.getInt("menuitem_id"));
				order.setItem_name(rs.getString("item_name"));
				order.setPrice(rs.getFloat("price"));
				order.setQuantity(rs.getInt("quantity"));
				order.setOrder_date(rs.getDate("order_date"));
				list.add(order);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

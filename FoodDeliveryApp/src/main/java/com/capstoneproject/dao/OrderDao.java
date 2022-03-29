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
import com.capstoneproject.model.User;
//SQL queries 
public class OrderDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public OrderDao(Connection con) {
		this.con = con;
	}
	public boolean insertOrders(int uid,int rid) {
		boolean result = false;
		
		try {
			String ORDER_INSERT_SQL = "INSERT INTO orders (user_id,order_status,restaurant_id,orders_order_date) VALUES (?,1,?,NOW()) ; ";
			ps = this.con.prepareStatement(ORDER_INSERT_SQL);
			ps.setInt(1, uid);
			ps.setInt(2, rid);
			ps.executeUpdate();
			result=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	public List<Orders> userOrdersList(int id) { 
		  List<Orders> list = new ArrayList<>(); 
		  String ORDER_LIST_SQL ="SELECT order_id FROM orders WHERE user_id=?"; 
		  try {
			  ps = this.con.prepareStatement(ORDER_LIST_SQL);
			  ps.setInt(1, id);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  	{ 
					Orders order = new Orders();
				  	order.setOrder_id(rs.getInt("order_id")); 
				  	list.add(order); 
			  	}
		  } catch (SQLException e) 
		  { 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	public int userOrderStatus(int oid,int uid) { 
		  int res =0; 
		  String ORDER_ID2_SQL ="SELECT order_status FROM orders where order_id =? AND user_id=?;"; 
		  try {
			  ps = this.con.prepareStatement(ORDER_ID2_SQL);
			  ps.setInt(1, oid);
			  ps.setInt(2, uid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  	{ 					
				  	res = rs.getInt("order_status");
			  	}
		  } catch (SQLException e) 
		  { 
			  e.printStackTrace(); 
			  } 
		  return res;
	   }
	 
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
	
	public List<Orderitems> newUserOrders(int id){
		List<Orderitems> list = new ArrayList<>();
		float res=0;
		try {
			String NEW_ORDER_SQL = " SELECT SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,oi.order_date as date,oi.order_id,od.user_id,od.order_status,od.restaurant_id,rs.restaurant_name from orderitems oi INNER JOIN menu_item mi on mi.menuitem_id=oi.menuitem_id INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN restaurant rs ON od.restaurant_id=rs.restaurant_id WHERE (od.user_id=? AND od.order_status=1) OR (od.user_id=? AND od.order_status=2) OR (od.user_id=? AND od.order_status=3) GROUP BY oi.order_id,date,od.restaurant_id,rs.restaurant_name,od.order_status,od.user_id ORDER BY oi.order_id DESC;";
			ps = this.con.prepareStatement(NEW_ORDER_SQL);
			ps.setInt(1, id);
			ps.setInt(2, id);
			ps.setInt(3, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Orderitems order = new Orderitems();
				order.setOrder_id(rs.getInt("order_id"));
				order.setOrder_status(rs.getInt("order_status"));
				float sum = rs.getFloat("total");
				res = (float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
				order.setPrice(res);
				order.setQuantity(rs.getInt("items"));
				order.setOrder_date(rs.getTimestamp("date"));
				order.setRestaurant_id(rs.getInt("restaurant_id"));
				order.setRestaurant_name(rs.getString("restaurant_name"));
				list.add(order);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Orderitems> completedUserOrders(int id){
		List<Orderitems> list = new ArrayList<>();
		float res=0;
		try {
			String COMPLETED_ORDER_SQL = "SELECT SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,oi.order_date as date,oi.order_id,od.order_status,od.restaurant_id,rs.restaurant_name from orderitems oi INNER JOIN menu_item mi on mi.menuitem_id=oi.menuitem_id INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN restaurant rs ON od.restaurant_id=rs.restaurant_id WHERE od.user_id=? AND od.order_status=4 GROUP BY oi.order_id,date,od.restaurant_id,rs.restaurant_name,od.order_status ORDER BY oi.order_id DESC;";
			ps = this.con.prepareStatement(COMPLETED_ORDER_SQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Orderitems order = new Orderitems();
				order.setOrder_id(rs.getInt("order_id"));
				order.setOrder_status(rs.getInt("order_status"));
				float sum = rs.getFloat("total");
				res = (float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
				order.setPrice(res);
				order.setQuantity(rs.getInt("items"));
				order.setOrder_date(rs.getTimestamp("date"));
				order.setRestaurant_id(rs.getInt("restaurant_id"));
				order.setRestaurant_name(rs.getString("restaurant_name"));
				list.add(order);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Orderitems> RestaurantOrdersListCreated(int rid) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  float res=0;
		  String REST_ORDER_SQL ="SELECT od.order_id,us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,oi.order_date as date FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id WHERE mi.restaurant_id=? AND od.order_status=1 GROUP BY od.order_id,date,us.first_name,us.last_name  ORDER BY order_id DESC; "; 
		
		  try {
			  ps = this.con.prepareStatement(REST_ORDER_SQL); 
			  ps.setInt(1, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
				  order.setPrice(res);
				  order.setQuantity(rs.getInt("items"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	public List<Orderitems> RestaurantOrdersListPrepared(int rid) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String REST_PREPARED_ORDER_SQL ="SELECT od.order_id,us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,oi.order_date as date FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id WHERE (mi.restaurant_id=? AND od.order_status=2) OR (mi.restaurant_id=? AND od.order_status=3) GROUP BY od.order_id,date,us.first_name,us.last_name  ORDER BY order_id DESC;"; 
		  float res=0;
		  try {
			  ps = this.con.prepareStatement(REST_PREPARED_ORDER_SQL); 
			  ps.setInt(1, rid);
			  ps.setInt(2, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
				  order.setPrice(res);
				  order.setQuantity(rs.getInt("items"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	
	public List<Orderitems> RestaurantOrdersListDelivered(int rid) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String REST_DELIVERED_ORDER_SQL ="SELECT od.order_id,us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total,COUNT(quantity)AS items,oi.order_date as date FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id WHERE mi.restaurant_id=? AND od.order_status=4 GROUP BY od.order_id,date,us.first_name,us.last_name  ORDER BY order_id DESC;  "; 
		  float res=0;
		  try {
			  ps = this.con.prepareStatement(REST_DELIVERED_ORDER_SQL); 
			  ps.setInt(1, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
				  order.setPrice(res);
				  order.setQuantity(rs.getInt("items"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	public List<Orderitems> RestaurantOrdersItems(int id) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String REST_ORDERITEMS_SQL ="SELECT DISTINCT od.order_id FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id WHERE mi.restaurant_id=?; "; 
		
		  try {
			  ps = this.con.prepareStatement(REST_ORDERITEMS_SQL); 
			  ps.setInt(1, id);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setMenuitem_id(rs.getInt("menuitem_id"));
				  order.setItem_name(rs.getString("item_name"));
				  order.setQuantity(rs.getInt("quantity"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  order.setOrder_date(rs.getTimestamp("order_date"));
				  order.setUser_id(rs.getInt("user_id"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	public List<Orderitems> DelivererOrdersListPrepared() { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String DELIVERER_ORDER_SQL ="SELECT od.order_id,us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total , COUNT(quantity)AS items, oi.order_date as date,rs.restaurant_name,us.city as user_city,us.street_address as user_address,rs.city as rest_city,rs.street_address as rest_address FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id INNER JOIN restaurant rs ON rs.restaurant_id = mi.restaurant_id WHERE od.order_status=2 GROUP BY od.order_id,date,us.first_name,us.last_name,rs.restaurant_name,us.city,us.street_address,rs.city,rs.street_address ORDER BY order_id DESC;"; 
		  float res=0;
		  try {
			  ps = this.con.prepareStatement(DELIVERER_ORDER_SQL); 
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)((sum*0.06)+5);
				  order.setPrice(res);
				  order.setRestaurant_name(rs.getString("restaurant_name"));
				  order.setQuantity(rs.getInt("items"));
				  order.setUser_city(rs.getString("user_city"));
				  order.setUser_address(rs.getString("user_address"));
				  order.setRest_city(rs.getString("rest_city"));
				  order.setRest_address(rs.getString("rest_address"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }

	public void cancelOrder(int id){
		try {
			String CANCEL_ORDER_SQL = "DELETE FROM deliverer_info WHERE order_id=?;DELETE FROM orderitems WHERE order_id=?;DELETE FROM orders WHERE order_id=?;";
			ps = this.con.prepareStatement(CANCEL_ORDER_SQL);
			ps.setInt(1,id);
			ps.setInt(2,id);
			ps.setInt(3,id);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void removeExistingOrder(int oid,int rid){
		try {
			String DELETE_PREV_ORDER_SQL = "DELETE FROM deliverer_info WHERE order_id=?;DELETE FROM orderitems WHERE order_id=?;DELETE FROM orders WHERE order_id=? AND restaurant_id=?;";
			ps = this.con.prepareStatement(DELETE_PREV_ORDER_SQL);
			ps.setInt(1,oid);
			ps.setInt(2,oid);
			ps.setInt(3,oid);
			ps.setInt(4,rid);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void acceptOrder(int id){
		try {
			String ACCEPT_ORDER_SQL = "UPDATE orders SET order_status=2 WHERE order_id=?;";
			ps = this.con.prepareStatement(ACCEPT_ORDER_SQL);
			ps.setInt(1,id);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public float getWallet(int did){
		float value = 0;
		try {
			String SELECT_WALLET_SQL = "SELECT wallet FROM deliverer WHERE deliverer_id=?";
			ps = this.con.prepareStatement(SELECT_WALLET_SQL);
			ps.setInt(1,did);
			ps.executeQuery();
			while(rs.next()) 
			  { 
				  value =rs.getFloat("wallet");
				  
			  }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	public float getWalletUID(int uid){
		float value = 0;
		try {
			String SELECT_WALLET_UID_SQL = "SELECT wallet FROM deliverer WHERE deliverer_id=?";
			ps = this.con.prepareStatement(SELECT_WALLET_UID_SQL);
			ps.setInt(1,uid);
			ps.executeQuery();
			while(rs.next()) 
			  { 
				  value =rs.getFloat("wallet");
				  
			  }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	public void pickupOrder(int oid,int did,float earning){
		try {
			String PICKUP_ORDER_SQL = "UPDATE orders SET order_status=3 WHERE order_id=?;INSERT INTO deliverer_info (deliverer_id,order_id,earnings) VALUES (?,?,?)";
			ps = this.con.prepareStatement(PICKUP_ORDER_SQL);
			ps.setInt(1,oid);
			ps.setInt(2,did);
			ps.setInt(3,oid);
			ps.setFloat(4, earning);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void orderDelivered(int oid,int did,float amount){
		try {
			String ORDER_DELIVERED_SQL = "UPDATE orders SET order_status=4 WHERE order_id=?;UPDATE deliverer SET wallet=? WHERE deliverer_id=?";
			ps = this.con.prepareStatement(ORDER_DELIVERED_SQL);
			ps.setInt(1,oid);
			ps.setFloat(2,amount);
			ps.setInt(3,did);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<Orderitems> Istripexists(int did){
		List<Orderitems> list = new ArrayList<>(); 
		float res=0;
		String SELECT_IF_EXISTS_SQL = "SELECT od.order_id,od.user_id as customer_id,od.order_status,rs.restaurant_id,d.deliverer_id,d.wallet, us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total , COUNT(quantity)AS items,oi.order_date as date,rs.restaurant_name,us.city as user_city,us.street_address as user_address,rs.city as rest_city,rs.street_address as rest_address FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id INNER JOIN restaurant rs ON rs.restaurant_id = mi.restaurant_id INNER JOIN deliverer_info di ON di.order_id = od.order_id INNER JOIN deliverer d ON d.deliverer_id = di.deliverer_id WHERE d.deliverer_id=?  AND od.order_status=3 GROUP BY od.order_id,date,us.first_name,us.last_name,rs.restaurant_name,us.city,us.street_address,rs.city,rs.street_address,rs.restaurant_id,d.deliverer_id,d.wallet ORDER BY order_id DESC;";
		try {
			  ps = this.con.prepareStatement(SELECT_IF_EXISTS_SQL); 
			  ps.setInt(1,did);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)((sum*0.06)+5);
				  order.setPrice(res);
				  order.setRestaurant_name(rs.getString("restaurant_name"));
				  order.setQuantity(rs.getInt("items"));
				  order.setUser_city(rs.getString("user_city"));
				  order.setUser_address(rs.getString("user_address"));
				  order.setRest_city(rs.getString("rest_city"));
				  order.setRest_address(rs.getString("rest_address"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  order.setUser_id(rs.getInt("customer_id"));
				  order.setOrder_status(rs.getInt("order_status"));
				  order.setRestaurant_id(rs.getInt("restaurant_id"));
				  order.setDeliverer_id(rs.getInt("deliverer_id"));
				  order.setWallet(rs.getFloat("wallet"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	
}
	public List<Orderitems> delivererCompletedOrders(int did){
		List<Orderitems> list = new ArrayList<>(); 
		float res=0;
		String PAST_ORDERS_SQL = "SELECT od.order_id,od.user_id as customer_id,od.order_status,rs.restaurant_id,d.deliverer_id,di.earnings, us.first_name,us.last_name,SUM(oi.quantity*mi.price) AS total , COUNT(quantity)AS items,oi.order_date as date,rs.restaurant_name,us.city as user_city,us.street_address as user_address,rs.city as rest_city,rs.street_address as rest_address FROM orderitems oi INNER JOIN orders od ON od.order_id=oi.order_id INNER JOIN user_table us ON us.id=od.user_id INNER JOIN menu_item mi ON mi.menuitem_id=oi.menuitem_id INNER JOIN restaurant rs ON rs.restaurant_id = mi.restaurant_id INNER JOIN deliverer_info di ON di.order_id = od.order_id INNER JOIN deliverer d ON d.deliverer_id = di.deliverer_id WHERE d.deliverer_id=?  AND od.order_status=4 GROUP BY od.order_id,date,us.first_name,us.last_name,rs.restaurant_name,us.city,us.street_address,rs.city,rs.street_address,rs.restaurant_id,d.deliverer_id,di.earnings ORDER BY order_id DESC;";
		try {
			  ps = this.con.prepareStatement(PAST_ORDERS_SQL); 
			  ps.setInt(1,did);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setFirst_name(rs.getString("first_name"));
				  order.setLast_name(rs.getString("last_name"));
				  float sum = rs.getFloat("total");
				  res = (float)((sum*0.06)+5);
				  order.setPrice(res);
				  order.setRestaurant_name(rs.getString("restaurant_name"));
				  order.setQuantity(rs.getInt("items"));
				  order.setUser_city(rs.getString("user_city"));
				  order.setUser_address(rs.getString("user_address"));
				  order.setRest_city(rs.getString("rest_city"));
				  order.setRest_address(rs.getString("rest_address"));
				  order.setOrder_date(rs.getTimestamp("date"));
				  order.setUser_id(rs.getInt("customer_id"));
				  order.setOrder_status(rs.getInt("order_status"));
				  order.setRestaurant_id(rs.getInt("restaurant_id"));
				  order.setDeliverer_id(rs.getInt("deliverer_id"));
				  order.setEarnings(rs.getFloat("earnings"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	
}
	
	public List<Orderitems> checkOrdersExist(int uid,int rid) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String CHECK_ORDER_SQL ="SELECT * FROM orders WHERE user_id=? AND order_status!=4 AND restaurant_id=?;"; 
		
		  try {
			  ps = this.con.prepareStatement(CHECK_ORDER_SQL); 
			  ps.setInt(1, uid);
			  ps.setInt(2, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setUser_id(rs.getInt("user_id"));
				  order.setOrder_status(rs.getInt("order_status"));
				  order.setRestaurant_id(rs.getInt("restaurant_id"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	public List<Orderitems> checkOrderDelivery(int rid,int oid) { 
		  List<Orderitems> list = new ArrayList<>(); 
		  String CHECK_ORDER_DEL_SQL ="SELECT * FROM orders where restaurant_id=? AND order_id = ?  AND order_status=3;"; 
		
		  try {
			  ps = this.con.prepareStatement(CHECK_ORDER_DEL_SQL); 
			  ps.setInt(1, rid);
			  ps.setInt(2, oid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Orderitems order = new Orderitems();
				  order.setOrder_id(rs.getInt("order_id"));
				  order.setUser_id(rs.getInt("user_id"));
				  order.setOrder_status(rs.getInt("order_status"));
				  order.setRestaurant_id(rs.getInt("restaurant_id"));
				  list.add(order); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return list;
	   }
	
}

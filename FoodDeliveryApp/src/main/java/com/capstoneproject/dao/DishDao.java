package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.capstoneproject.model.*;
//SQL queries for performing CRUD operation with database
public class DishDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public DishDao(Connection con) {
		super();
		this.con = con;
	}
	public List<Dish> getAllDishes(int cid,int rid){
		List<Dish> dishes =  new ArrayList<Dish>();
		try {
			String SELECT_DISH_SQL = " SELECT * FROM menu_item WHERE category=? AND restaurant_id=? AND active=1 ORDER BY item_name ; ";
			ps = this.con.prepareStatement( SELECT_DISH_SQL);
			ps.setInt(1,cid);
			ps.setInt(2,rid);
			rs = ps.executeQuery();
			while(rs.next()) {
				Dish row = new Dish();
				row.setMenuitem_id(rs.getInt("menuitem_id"));
				row.setItem_name(rs.getString("item_name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getFloat("price"));
				row.setActive(rs.getBoolean("active"));
				row.setCategory(rs.getInt("category"));
				dishes.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return dishes;
	}public Dish getAllDishes2(int mid,int rid){
		Dish dishes =  new Dish();
		try {
			String SELECT_DISH2_SQL = " SELECT * FROM menu_item WHERE menuitem_id=? AND restaurant_id=? AND active=1 ORDER BY item_name ; ";
			ps = this.con.prepareStatement( SELECT_DISH2_SQL);
			ps.setInt(1,mid);
			ps.setInt(2,rid);
			rs = ps.executeQuery();
			while(rs.next()) {
				dishes = new Dish();
				dishes.setMenuitem_id(rs.getInt("menuitem_id"));
				dishes.setItem_name(rs.getString("item_name"));
				dishes.setDescription(rs.getString("description"));
				dishes.setPrice(rs.getFloat("price"));
				dishes.setActive(rs.getBoolean("active"));
				dishes.setCategory(rs.getInt("category"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return dishes;
	}
	public List<Dish> getCategories(int rid){
		List<Dish> dishes =  new ArrayList<Dish>();
		try {
			String SELECT_CATEGORY_SQL = "SELECT DISTINCT ct.category_name,ct.category_id FROM menu_item mi INNER JOIN category ct ON ct.category_id=mi.category WHERE mi.restaurant_id=? AND active=1  ORDER BY ct.category_id;";
			ps = this.con.prepareStatement( SELECT_CATEGORY_SQL);
			ps.setInt(1,rid);
			rs = ps.executeQuery();
			while(rs.next()) {
				Dish row = new Dish();
				row.setCategory_name(rs.getString("category_name"));
				row.setCategory(rs.getInt("category_id"));
				dishes.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return dishes;
	}
	public List<Cart> getCartItems(ArrayList<Cart> cartList){
		List<Cart> items = new ArrayList<Cart>();
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					String MENU_CART_SQL="SELECT * FROM menu_item WHERE menuitem_id=?;";
					ps = this.con.prepareStatement(MENU_CART_SQL);
					ps.setInt(1,item.getMenuitem_id());
					rs = ps.executeQuery();
					while(rs.next()){
						Cart row= new Cart();
						row.setMenuitem_id(rs.getInt("menuitem_id"));
						row.setItem_name(rs.getString("item_name"));
						row.setDescription(rs.getString("description"));
						row.setPrice(rs.getFloat("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						items.add(row);
					}
				}
			
		}} 
			catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return items;
		
	
} 
	public float getSubtotalCartPrice(ArrayList<Cart> cartList){
		float sum =0 ;
		try {
			if(cartList.size()>0) {
			for(Cart item:cartList) {
				String READ_PRICE_SQL = "SELECT price FROM menu_item WHERE menuitem_id=?;";
				ps = this.con.prepareStatement(READ_PRICE_SQL);
				ps.setInt(1,item.getMenuitem_id());
				rs = ps.executeQuery();
				while(rs.next()) {
					sum+=rs.getFloat("price")*item.getQuantity();
					
				}
			}
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return sum;
		
	}
	public float getDeliveryFeeCartPrice(ArrayList<Cart> cartList){
		float sum =0 ;
		float res=0;
		try {
			if(cartList.size()>0) {
			for(Cart item:cartList) {
				String READ_PRICE_SQL = "SELECT price FROM menu_item WHERE menuitem_id=?;";
				ps = this.con.prepareStatement(READ_PRICE_SQL);
				ps.setInt(1,item.getMenuitem_id());
				rs = ps.executeQuery();
				while(rs.next()) {
					sum+=rs.getFloat("price")*item.getQuantity();
				}
				
			}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		res =(float)((sum*0.06)+5);
		return res;
		
	}
	public float getServiceFeeCartPrice(ArrayList<Cart> cartList){
		float sum =0 ;
		float res=0;
		try {
			if(cartList.size()>0) {
			for(Cart item:cartList) {
				String READ_PRICE_SQL = "SELECT price FROM menu_item WHERE menuitem_id=?;";
				ps = this.con.prepareStatement(READ_PRICE_SQL);
				ps.setInt(1,item.getMenuitem_id());
				rs = ps.executeQuery();
				while(rs.next()) {
					sum+=rs.getFloat("price")*item.getQuantity();
					
				}
			}
			
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		res =(float)((sum*0.1)+2);
		return res;
		
	}
	public float getTaxesCartPrice(ArrayList<Cart> cartList){
		float sum =0 ;
		float res=0;
		try {
			if(cartList.size()>0) {
			for(Cart item:cartList) {
				String READ_PRICE_SQL = "SELECT price FROM menu_item WHERE menuitem_id=?;";
				ps = this.con.prepareStatement(READ_PRICE_SQL);
				ps.setInt(1,item.getMenuitem_id());
				rs = ps.executeQuery();
				while(rs.next()) {
					sum+=rs.getFloat("price")*item.getQuantity();
					
				}
			}
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		res =(float)(sum*0.13);
		return res;
		
	}

	public float getTotalCartPrice(ArrayList<Cart> cartList){
		float sum =0 ;
		float res=0;
		try {
			if(cartList.size()>0) {
			for(Cart item:cartList) {
				String READ_PRICE_SQL = "SELECT price FROM menu_item WHERE menuitem_id=?;";
				ps = this.con.prepareStatement(READ_PRICE_SQL);
				ps.setInt(1,item.getMenuitem_id());
				rs = ps.executeQuery();
				while(rs.next()) {
					sum+=rs.getFloat("price")*item.getQuantity();
					
				}
			}
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		res =(float)(sum+(sum*0.13)+((sum*0.06)+5)+((sum*0.1)+2));
		return res;
		
	}
	public int updateMenuItem(int mid,int rid,Dish dishinfo){
		int result = 0;
		try {
			String UPDATE_DISH_SQL = " UPDATE menu_item SET item_name=? ,description=? ,price=? ,category=? WHERE restaurant_id=? AND menuitem_id=?;";
			ps = this.con.prepareStatement( UPDATE_DISH_SQL);
			ps.setString(1,dishinfo.getItem_name());
			ps.setString(2,dishinfo.getDescription());
			ps.setFloat(3,dishinfo.getPrice());
			ps.setInt(4,dishinfo.getCategory());
			ps.setInt(5,rid);
			ps.setInt(6,mid);
			result = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public int deleteMenuItem(int mid,int rid){
		int result = 0;
		try {
			String DELETE_DISH_SQL = " UPDATE menu_item SET active=0 WHERE menuitem_id = ? AND restaurant_id = ?;";
			ps = this.con.prepareStatement(DELETE_DISH_SQL);
			ps.setInt(1,mid);
			ps.setInt(2,rid);
			result = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public int addMenuItem(int rid,Dish dishinfo){
		int result = 0;
		try {
			String ADD_DISH_SQL = "INSERT INTO menu_item (item_name,description,price,active,restaurant_id,category) VALUES (?,?,?,?,?,?);";
			ps = this.con.prepareStatement(ADD_DISH_SQL);
			ps.setString(1,dishinfo.getItem_name());
			ps.setString(2,dishinfo.getDescription());
			ps.setFloat(3,dishinfo.getPrice());
			ps.setBoolean(4,true);
			ps.setInt(5,rid);
			ps.setInt(6,dishinfo.getCategory());
			result = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Dish> checkItemExist(String item_name,int rid) { 
		  List<Dish> dish_name = new ArrayList<>(); 
		  String CHECK_ORDER_SQL ="SELECT * FROM menu_item WHERE item_name=? AND restaurant_id=?;"; 
		
		  try {
			  ps = this.con.prepareStatement(CHECK_ORDER_SQL); 
			  ps.setString(1, item_name);
			  ps.setInt(2, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  Dish dish = new Dish();
				  dish.setMenuitem_id(rs.getInt("menuitem_id"));
				  dish.setItem_name(rs.getString("item_name"));
				  dish.setDescription(rs.getString("description"));
				  dish.setPrice(rs.getFloat("price"));
				  dish.setActive(rs.getBoolean("active"));
				  dish.setCategory(rs.getInt("category"));
				  dish.setRestaurant_id(rs.getInt("restaurant_id"));
				  dish_name.add(dish); 
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return dish_name;
	   }
	public Dish checkItemExist2(String item_name,int rid) { 
		  Dish dish = new Dish(); 
		  String CHECK_ORDER2_SQL ="SELECT * FROM menu_item WHERE item_name=? AND restaurant_id=?;"; 
		
		  try {
			  ps = this.con.prepareStatement(CHECK_ORDER2_SQL); 
			  ps.setString(1, item_name);
			  ps.setInt(2, rid);
			  rs = ps.executeQuery(); 
			  while(rs.next()) 
			  { 
				  dish = new Dish();
				  dish.setMenuitem_id(rs.getInt("menuitem_id"));
				  dish.setItem_name(rs.getString("item_name"));
				  dish.setDescription(rs.getString("description"));
				  dish.setPrice(rs.getFloat("price"));
				  dish.setActive(rs.getBoolean("active"));
				  dish.setCategory(rs.getInt("category"));
				  dish.setRestaurant_id(rs.getInt("restaurant_id"));
				  
			  }
		  } 
		  catch (SQLException e) 
		  	{ 
			  e.printStackTrace(); 
			  } 
		  return dish;
	   }
	public void updateItem(Dish dishinfo){
		try {
			String REACTIVATE_ORDER_SQL = "UPDATE menu_item SET active=1 WHERE menuitem_id=? AND restaurant_id=?;";
			ps = this.con.prepareStatement(REACTIVATE_ORDER_SQL);
			ps.setInt(1,dishinfo.getMenuitem_id());
			ps.setInt(2,dishinfo.getRestaurant_id());
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}

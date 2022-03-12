package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import com.capstoneproject.model.*;

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
			String SELECT_DISH_SQL = " SELECT * FROM menu_item WHERE category=? AND restaurant_id=?; ";
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
	}
	public List<Dish> getCategories(int rid){
		List<Dish> dishes =  new ArrayList<Dish>();
		try {
			String SELECT_DISH_SQL = "SELECT DISTINCT ct.category_name,ct.category_id FROM menu_item mi INNER JOIN category ct ON ct.category_id=mi.category WHERE mi.restaurant_id=?;";
			ps = this.con.prepareStatement( SELECT_DISH_SQL);
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
	public float getTotalCartPrice(ArrayList<Cart> cartList){
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
}

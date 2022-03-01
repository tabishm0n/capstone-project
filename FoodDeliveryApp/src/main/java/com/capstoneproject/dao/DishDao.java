package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import com.capstoneproject.model.*;

public class DishDao {
	private Connection con;

	public DishDao(Connection con) {
		super();
		this.con = con;
	}
	public List<Dish> getAllDishes(){
		List<Dish> dishes =  new ArrayList<Dish>();
		try {
			String SELECT_DISH_SQL = " SELECT * FROM menu_item; ";
			PreparedStatement ps = this.con.prepareStatement( SELECT_DISH_SQL);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Dish row = new Dish();
				row.setMenuitem_id(rs.getInt("menuitem_id"));
				row.setItem_name(rs.getString("item_name"));
				row.setDescription(rs.getString("description"));
				row.setPrice(rs.getFloat("price"));
				row.setActive(rs.getBoolean("active"));
				dishes.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return dishes;
	}
} 

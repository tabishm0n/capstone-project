package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Rest;

public class RestDao {
	private Connection con;
	
	public RestDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<Rest> getAllRests(){
		List<Rest> rests =  new ArrayList<Rest>();
		try {
			String SELECT_REST_SQL = " SELECT * FROM restaurant; ";
			PreparedStatement ps = this.con.prepareStatement( SELECT_REST_SQL);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Rest row = new Rest();
				row.setRestaurant_id(rs.getInt("restaurant_id"));
				row.setCity(rs.getString("city"));
				row.setStreet_address(rs.getString("street_address"));
				row.setOperational(rs.getBoolean("operational"));
				row.setDescription(rs.getString("description"));
				row.setRestaurant_name(rs.getString("restaurant_name"));
				row.setId(rs.getInt("id"));
				rests.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return rests;
	}
}

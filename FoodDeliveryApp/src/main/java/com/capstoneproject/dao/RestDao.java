package com.capstoneproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Rest;
import com.capstoneproject.model.User;
//SQL queries for performing CRUD operation with database
public class RestDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public RestDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<Rest> getAllRests(){
		List<Rest> rests =  new ArrayList<Rest>();
		try {
			String SELECT_REST_SQL = " SELECT * from restaurant where exists (SELECT * FROM menu_item WHERE menu_item.restaurant_id = restaurant.restaurant_id) ORDER BY restaurant.restaurant_id ASC; ";
			ps = this.con.prepareStatement( SELECT_REST_SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				Rest row = new Rest();
				row.setRestaurant_id(rs.getInt("restaurant_id"));
				row.setCity(rs.getString("city"));
				row.setStreet_address(rs.getString("street_address"));
				row.setOperational(rs.getBoolean("operational"));
				row.setDescription(rs.getString("description"));
				row.setRestaurant_name(rs.getString("restaurant_name"));
				row.setId(rs.getInt("user_id"));
				rests.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return rests;
	}
	
	public Rest getRestdetails(User user){
		Rest restinfo =  null;
		try {
			String GET_REST_SQL = " SELECT * FROM restaurant WHERE user_id=?; ";
			ps = this.con.prepareStatement( GET_REST_SQL);
			ps.setInt(1, user.getId());
			rs = ps.executeQuery();
			while(rs.next()) {
				restinfo = new Rest();
				restinfo.setRestaurant_id(rs.getInt("restaurant_id"));
				restinfo.setCity(rs.getString("city"));
				restinfo.setStreet_address(rs.getString("street_address"));
				restinfo.setOperational(rs.getBoolean("operational"));
				restinfo.setDescription(rs.getString("description"));
				restinfo.setRestaurant_name(rs.getString("restaurant_name"));
				restinfo.setId(rs.getInt("user_id"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return restinfo;
	}
	public Rest UserRestdetails(int id){
		Rest restinfo =  null;
		try {
			String FETCH_REST_SQL = " SELECT * FROM restaurant WHERE restaurant_id=?; ";
			ps = this.con.prepareStatement( FETCH_REST_SQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				restinfo = new Rest();
				restinfo.setRestaurant_id(rs.getInt("restaurant_id"));
				restinfo.setCity(rs.getString("city"));
				restinfo.setStreet_address(rs.getString("street_address"));
				restinfo.setOperational(rs.getBoolean("operational"));
				restinfo.setDescription(rs.getString("description"));
				restinfo.setRestaurant_name(rs.getString("restaurant_name"));
				restinfo.setId(rs.getInt("user_id"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return restinfo;
	}
	public List<Rest> adminRestInfo(int uid){
		List<Rest> admin = new ArrayList<>();
		
		try {
			String ADMIN_REST_INFO = "SELECT * from restaurant where user_id=?;";
			ps = this.con.prepareStatement(ADMIN_REST_INFO);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				Rest adminrest = new Rest();
				adminrest.setRestaurant_name(rs.getString("restaurant_name"));
				admin.add(adminrest);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return admin;
	}
}

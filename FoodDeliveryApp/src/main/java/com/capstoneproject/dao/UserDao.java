package com.capstoneproject.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.capstoneproject.model.Dish;
import com.capstoneproject.model.Orderitems;
import com.capstoneproject.model.Rest;
import com.capstoneproject.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//SQL queries for performing CRUD operation with database
public class UserDao {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public UserDao(Connection con) {
		this.con = con;
	}
	public int registerUser(User user) throws ClassNotFoundException{
		String INSERT_USERS_SQL = "INSERT INTO user_table " + "(login,password,city,"
				+ "street_address,first_name,last_name,email,phone,user_type,payment,"
				+"registeration_date) VALUES (?,?,?,?,?,?,?,?,?,?,NOW());";
		int result = 0 ;
		try  {
			ps = this.con.prepareStatement(INSERT_USERS_SQL);
			ps.setString(1, user.getLogin());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getCity());
			ps.setString(4, user.getStreet_address());
			ps.setString(5, user.getFirst_name());
			ps.setString(6, user.getLast_name());
			ps.setString(7, user.getEmail());
			ps.setString(8, user.getPhone());
			ps.setString(9, user.getUser_type());
			ps.setString(10, user.getPayment());
			result = ps.executeUpdate();
		}catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
	public int getUserID(String username, String password) throws ClassNotFoundException{
		int id =0;
		String GET_ID_SQL ="Select id FROM user_table WHERE login=? AND password=?;";
		try  {
			ps = this.con.prepareStatement(GET_ID_SQL);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()){
            	id = (rs.getInt("id"));
            }
		}catch (SQLException e) {
			printSQLException(e);
		}
		return id;
	}
	public int registerRestUser(Rest user,int uid) throws ClassNotFoundException{
		String INSERT_REST_SQL = "INSERT INTO restaurant (city,street_address,operational,description,restaurant_name,user_id) VALUES (?,?,?,?,?,?);";
		int result = 0 ;
		try  {
			ps = this.con.prepareStatement(INSERT_REST_SQL);

			ps.setString(1, user.getCity());
			ps.setString(2, user.getStreet_address());
			ps.setBoolean(3,true);
			ps.setString(4,user.getDescription());
			ps.setString(5, user.getRestaurant_name());
			ps.setInt(6, uid);
			result = ps.executeUpdate();
		}catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
	public int registerDeliveryUser(int uid) throws ClassNotFoundException{
		String INSERT_DEL_SQL = "INSERT INTO deliverer (wallet,user_id) VALUES (0,?);";
		int result = 0 ;
		try  {
			ps = this.con.prepareStatement(INSERT_DEL_SQL);
			ps.setInt(1, uid);
			result = ps.executeUpdate();
		}catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e: ex) {
			if(e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: "+ ((SQLException) e).getSQLState());
				System.err.println("Error Code: "+ ((SQLException) e).getErrorCode());
				System.err.println("Message: "+ e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: "+ t);
					t = t.getCause();
				}
			}
		}
	}
	public User verifyUser(String username, String password) throws ClassNotFoundException{
		User user = null;
		String READ_USERS_SQL ="Select * FROM user_table WHERE login=? AND password=?;";
		try  {
			ps = this.con.prepareStatement(READ_USERS_SQL);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setPassword(rs.getString("password"));
            	user.setLogin(rs.getString("login"));
            	user.setEmail(rs.getString("email"));
            }
		}catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
public User verifyType(User user) throws ClassNotFoundException{
		
		User userinfo = null;
		String READ_TYPE_SQL ="Select * FROM user_table WHERE login=? AND password=?";
		
		try {
			ps = this.con.prepareStatement(READ_TYPE_SQL);
			ps.setString(1, user.getLogin());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			while(rs.next()) {
					userinfo = new User();
					userinfo.setFirst_name(rs.getString("first_name"));
					userinfo.setLast_name(rs.getString("last_name"));
					userinfo.setPhone(rs.getString("phone"));
					userinfo.setCity(rs.getString("city"));
					userinfo.setStreet_address(rs.getString("street_address"));
					userinfo.setEmail(rs.getString("email"));
					userinfo.setPayment(rs.getString("payment"));
					userinfo.setUser_type(rs.getString("user_type"));
			}
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		return userinfo;
	}

	public int updateProfile( User user,int uid) throws ClassNotFoundException{
		int result = 0;
		try {
			String UPDATE_USER_SQL = " UPDATE user_table SET first_name=? ,last_name=? ,city=? ,street_address=? ,email=? ,payment=?  WHERE id=?;";
											 
			ps = this.con.prepareStatement(UPDATE_USER_SQL);
			ps.setString(1, user.getFirst_name());
			ps.setString(2, user.getLast_name());
			ps.setString(3, user.getCity());
			ps.setString(4, user.getStreet_address());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPayment());
			ps.setInt(7, uid);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int updateRestProfile( Rest rest,int uid) throws ClassNotFoundException{
		int result = 0;
		try {
			String UPDATE_REST_SQL = " UPDATE restaurant SET city=?,street_address=?,description=?,restaurant_name=? WHERE user_id=?;";
											 
			ps = this.con.prepareStatement(UPDATE_REST_SQL);
			ps.setString(1, rest.getCity());
			ps.setString(2, rest.getStreet_address());
			ps.setString(3, rest.getDescription());
			ps.setString(4, rest.getRestaurant_name());
			ps.setInt(5, uid);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public User getDelivererDetails(User user) {
		User delivererinfo = null;
		String GET_DELIVERER_ID_SQL = "SELECT * FROM deliverer WHERE user_id=?;";
		try {
			ps = this.con.prepareStatement(GET_DELIVERER_ID_SQL);
			ps.setInt(1, user.getId());
			rs = ps.executeQuery();
			while(rs.next()) {
				delivererinfo = new User();
				delivererinfo.setWallet(rs.getFloat("wallet"));
				delivererinfo.setDeliverer_id(rs.getInt("deliverer_id"));
			}
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		return delivererinfo;
	}
	public User getUserInfo(int uid) {
		User user_info = null;
		String READ_USER_SQL = "Select * FROM user_table WHERE id=?;";
		try {
			ps = this.con.prepareStatement(READ_USER_SQL);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				user_info = new User();
				user_info.setId(rs.getInt("id"));
				user_info.setLogin(rs.getString("login"));
				user_info.setPassword(rs.getString("password"));
				user_info.setCity(rs.getString("city"));
				user_info.setStreet_address(rs.getString("street_address"));
				user_info.setFirst_name(rs.getString("first_name"));
				user_info.setLast_name(rs.getString("last_name"));
				user_info.setEmail(rs.getString("email"));
				user_info.setPhone(rs.getString("phone"));
				user_info.setUser_type(rs.getString("user_type"));
				user_info.setPayment(rs.getString("payment"));
				user_info.setRegisteration_date(rs.getTimestamp("registeration_date"));
			}
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		return user_info;
	}
	
	public List<User> getUsertypes(){
		List<User> users =  new ArrayList<User>();
		try {
			String SELECT_TYPES_SQL = "SELECT DISTINCT user_type from user_table WHERE user_type!='Admin' ORDER BY user_type;";
			ps = this.con.prepareStatement( SELECT_TYPES_SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				User row = new User();
				row.setUser_type(rs.getString("user_type"));
				users.add(row);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return users;
	}
	public List<User> adminList(String user_type){
		List<User> list = new ArrayList<>();
		
		try {
			String ADMIN_USER_LIST = "SELECT * from user_table WHERE user_type=? ORDER BY id ASC;";
			ps = this.con.prepareStatement(ADMIN_USER_LIST);
			ps.setString(1, user_type);
			rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setLogin(rs.getString("login"));
				user.setPassword(rs.getString("password"));
				user.setCity(rs.getString("city"));
				user.setStreet_address(rs.getString("street_address"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setUser_type(user_type);
				user.setPayment(rs.getString("payment"));
				user.setRegisteration_date(rs.getTimestamp("registeration_date"));
				list.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return list;
	}


public int deleteCustomer(int uid){
	int result = 0;
	try {
		String DELETE_CUSTOMER_SQL = "DELETE FROM orders where user_id=?; DELETE FROM user_table WHERE id=?;";
		ps = this.con.prepareStatement(DELETE_CUSTOMER_SQL);
		ps.setInt(1,uid);
		ps.setInt(2,uid);
		result = ps.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return result;
}
public int deleteCustomerOrder(int oid){
	int result = 0;
	try {
		String DELETE_CUSTOMER_SQL = " DELETE FROM orderitems where order_id=?;DELETE FROM deliverer_info WHERE order_id=?;";
		ps = this.con.prepareStatement(DELETE_CUSTOMER_SQL);
		ps.setInt(1,oid);
		ps.setInt(2,oid);
		result = ps.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return result;
}
public int deleteRestaurantOwner(int uid,int rid){
	int result = 0;
	try {
		String DELETE_RESTAURANT_SQL = " DELETE FROM restaurant where user_id=?;DELETE FROM menu_item WHERE restaurant_id=?;DELETE FROM user_table WHERE id=?;";
		ps = this.con.prepareStatement(DELETE_RESTAURANT_SQL);
		ps.setInt(1,uid);
		ps.setInt(2,rid);
		ps.setInt(3,uid);
		result = ps.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return result;
}
public int deleteDeliverer(int uid,int did){
	int result = 0;
	try {
		String DELETE_DELIVERER_SQL = "DELETE FROM deliverer_info WHERE deliverer_id=?;DELETE FROM deliverer WHERE user_id=?;DELETE FROM user_table WHERE id=?; ";
		ps = this.con.prepareStatement(DELETE_DELIVERER_SQL);
		ps.setInt(1,did);
		ps.setInt(2,uid);
		ps.setInt(3,uid);
		result = ps.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	return result;
}
	
}

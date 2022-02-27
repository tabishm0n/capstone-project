package com.capstoneproject.dao;


import java.sql.Connection;
import java.util.Date;

import com.capstoneproject.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	private Connection con;
	public UserDao(Connection con) {
		this.con = con;
	}
	public int registerUser(User user) {
		String INSERT_USERS_SQL = "INSERT INTO user_table " + "(login,password,city,"
				+ "street_address,first_name,last_name,email,phone,user_type,payment,"
				+"registeration_date) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
		int result = 0 ;
		try  {
			Date date = new Date();
			java.sql.Date sqldate = new java.sql.Date(date.getTime());
			PreparedStatement ps = con.prepareStatement(INSERT_USERS_SQL);
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
			ps.setDate(11, sqldate);
			System.out.println(ps);
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
	public boolean verifyUser(User user) {
		boolean result = false;
		String READ_USERS_SQL ="Select * FROM user_table WHERE login=? AND password=?";
		try  {
			PreparedStatement ps = con.prepareStatement(READ_USERS_SQL);
			ps.setString(1, user.getLogin());
			ps.setString(2, user.getPassword());
			System.out.println(ps);
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
	public int verifyType(User user) {
		
		int result = 0;
		String READ_TYPE_SQL ="Select user_type FROM user_table WHERE login=? AND password=?";
		
		try {
			PreparedStatement ps1 = con.prepareStatement(READ_TYPE_SQL);
			ps1.setString(1, user.getLogin());
			ps1.setString(2, user.getPassword());
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
					String type = rs1.getString("user_type");
				if(type.equals("Customer")) {
					result = 1;
				}else if (type.equals("Restaurant")) {
					result = 2;
				}else if (type.equals("Delivery")) {
					result = 3;
				}
			}
			
		}catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}
}

package com.capstoneproject.model;

import java.sql.Date;

public class Order extends Dish{
	private int order_id;
	private int user_id;
	private int quantity;
	private Date order_date;
	public Order() {
		
	}
	public Order(int order_id, int user_id, int quantity, Date order_date) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.quantity = quantity;
		this.order_date = order_date;
	}
	
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", quantity=" + quantity + ", order_date="
				+ order_date + "]";
	}
	public Order(int user_id, int quantity, Date order_date) {
		super();
		this.user_id = user_id;
		this.quantity = quantity;
		this.order_date = order_date;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
}

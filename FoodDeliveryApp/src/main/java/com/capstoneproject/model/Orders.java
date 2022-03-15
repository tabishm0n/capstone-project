package com.capstoneproject.model;

import java.sql.Timestamp;

public class Orders extends Dish{
	private int quantity;
	private Timestamp order_date;
	private int order_id;
	private int user_id;
	private int restaurant_id;
	private int order_status;
public Orders() {
		
	}



public Orders(int quantity, Timestamp order_date, int order_id, int user_id, int restaurant_id, int order_status) {
	super();
	this.quantity = quantity;
	this.order_date = order_date;
	this.order_id = order_id;
	this.user_id = user_id;
	this.restaurant_id = restaurant_id;
	this.order_status = order_status;
}



@Override
public String toString() {
	return "Orders [quantity=" + quantity + ", order_date=" + order_date + ", order_id=" + order_id + ", user_id="
			+ user_id + ", restaurant_id=" + restaurant_id + ", order_status=" + order_status + "]";
}



public int getRestaurant_id() {
	return restaurant_id;
}



public void setRestaurant_id(int restaurant_id) {
	this.restaurant_id = restaurant_id;
}



public int getOrder_status() {
	return order_status;
}



public void setOrder_status(int order_status) {
	this.order_status = order_status;
}



public int getQuantity() {
	return quantity;
}



public void setQuantity(int quantity) {
	this.quantity = quantity;
}



public Timestamp getOrder_date() {
	return order_date;
}



public void setOrder_date(Timestamp order_date) {
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

}

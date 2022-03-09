package com.capstoneproject.model;

import java.sql.Timestamp;

public class Orders extends Dish{
	private int quantity;
	private Timestamp order_date;
	private int order_id;
	private int user_id;
	
public Orders() {
		
	}


public Orders(int quantity, Timestamp order_date, int order_id, int user_id) {
	super();
	this.quantity = quantity;
	this.order_date = order_date;
	this.order_id = order_id;
	this.user_id = user_id;
}



@Override
public String toString() {
	return "Orders [quantity=" + quantity + ", order_date=" + order_date + ", order_id=" + order_id + ", user_id="
			+ user_id + "]";
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

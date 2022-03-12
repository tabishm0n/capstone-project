package com.capstoneproject.model;

import java.sql.Timestamp;

public class Orderitems {
	private String first_name;
	private String last_name;
	private int user_id;
	private int order_id;
	private float price;
	private int menuitem_id;
	private String item_name;
	private int orderitem_id;
	private int quantity;
	private Timestamp order_date;
public Orderitems() {
		
	}



@Override
public String toString() {
	return "Orderitems [first_name=" + first_name + ", last_name=" + last_name + ", user_id=" + user_id + ", order_id="
			+ order_id + ", price=" + price + ", menuitem_id=" + menuitem_id + ", item_name=" + item_name
			+ ", orderitem_id=" + orderitem_id + ", quantity=" + quantity + ", order_date=" + order_date + "]";
}



public Orderitems(String first_name, String last_name, int user_id, int order_id, float price, int menuitem_id,
		String item_name, int orderitem_id, int quantity, Timestamp order_date) {
	super();
	this.first_name = first_name;
	this.last_name = last_name;
	this.user_id = user_id;
	this.order_id = order_id;
	this.price = price;
	this.menuitem_id = menuitem_id;
	this.item_name = item_name;
	this.orderitem_id = orderitem_id;
	this.quantity = quantity;
	this.order_date = order_date;
}



public String getFirst_name() {
	return first_name;
}



public void setFirst_name(String first_name) {
	this.first_name = first_name;
}



public String getLast_name() {
	return last_name;
}



public void setLast_name(String last_name) {
	this.last_name = last_name;
}



public int getUser_id() {
	return user_id;
}



public void setUser_id(int user_id) {
	this.user_id = user_id;
}



public int getOrder_id() {
	return order_id;
}


public void setOrder_id(int order_id) {
	this.order_id = order_id;
}


public float getPrice() {
	return price;
}


public void setPrice(float price) {
	this.price = price;
}


public int getMenuitem_id() {
	return menuitem_id;
}


public void setMenuitem_id(int menuitem_id) {
	this.menuitem_id = menuitem_id;
}


public String getItem_name() {
	return item_name;
}


public void setItem_name(String item_name) {
	this.item_name = item_name;
}


public int getOrderitem_id() {
	return orderitem_id;
}
public void setOrderitem_id(int orderitem_id) {
	this.orderitem_id = orderitem_id;
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



}

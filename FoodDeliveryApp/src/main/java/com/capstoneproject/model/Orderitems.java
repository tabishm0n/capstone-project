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
	private String restaurant_name;
	private int restaurant_id;
	private String user_city;
	private String user_address;
	private String rest_city;
	private String rest_address;
	private int order_status;
	private int deliverer_id;
	private float wallet;
	private float earnings;
public Orderitems() {
		
	}


public Orderitems(String first_name, String last_name, int user_id, int order_id, float price, int menuitem_id,
		String item_name, int orderitem_id, int quantity, Timestamp order_date, String restaurant_name,
		int restaurant_id, String user_city, String user_address, String rest_city, String rest_address,
		int order_status, int deliverer_id, float wallet, float earnings) {
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
	this.restaurant_name = restaurant_name;
	this.restaurant_id = restaurant_id;
	this.user_city = user_city;
	this.user_address = user_address;
	this.rest_city = rest_city;
	this.rest_address = rest_address;
	this.order_status = order_status;
	this.deliverer_id = deliverer_id;
	this.wallet = wallet;
	this.earnings = earnings;
}


@Override
public String toString() {
	return "Orderitems [first_name=" + first_name + ", last_name=" + last_name + ", user_id=" + user_id + ", order_id="
			+ order_id + ", price=" + price + ", menuitem_id=" + menuitem_id + ", item_name=" + item_name
			+ ", orderitem_id=" + orderitem_id + ", quantity=" + quantity + ", order_date=" + order_date
			+ ", restaurant_name=" + restaurant_name + ", restaurant_id=" + restaurant_id + ", user_city=" + user_city
			+ ", user_address=" + user_address + ", rest_city=" + rest_city + ", rest_address=" + rest_address
			+ ", order_status=" + order_status + ", deliverer_id=" + deliverer_id + ", wallet=" + wallet + ", earnings="
			+ earnings + "]";
}


public float getEarnings() {
	return earnings;
}


public void setEarnings(float earnings) {
	this.earnings = earnings;
}


public int getOrder_status() {
	return order_status;
}



public void setOrder_status(int order_status) {
	this.order_status = order_status;
}



public int getDeliverer_id() {
	return deliverer_id;
}



public void setDeliverer_id(int deliverer_id) {
	this.deliverer_id = deliverer_id;
}



public float getWallet() {
	return wallet;
}



public void setWallet(float wallet) {
	this.wallet = wallet;
}



public String getUser_city() {
	return user_city;
}



public void setUser_city(String user_city) {
	this.user_city = user_city;
}



public String getUser_address() {
	return user_address;
}





public void setUser_address(String user_address) {
	this.user_address = user_address;
}





public String getRest_city() {
	return rest_city;
}





public void setRest_city(String rest_city) {
	this.rest_city = rest_city;
}





public String getRest_address() {
	return rest_address;
}





public void setRest_address(String rest_address) {
	this.rest_address = rest_address;
}





public String getRestaurant_name() {
	return restaurant_name;
}


public void setRestaurant_name(String restaurant_name) {
	this.restaurant_name = restaurant_name;
}


public int getRestaurant_id() {
	return restaurant_id;
}


public void setRestaurant_id(int restaurant_id) {
	this.restaurant_id = restaurant_id;
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

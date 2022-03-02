package com.capstoneproject.model;

public class Rest {
	private int restaurant_id;
	private String city;
	private String street_address;
	private boolean operational;
	private String description;
	private String restaurant_name;
	private int id;
	public Rest() {
		super();
	}
	public Rest(int restaurant_id, String city, String street_address, boolean operational, String description,
			String restaurant_name, int id) {
		super();
		this.restaurant_id = restaurant_id;
		this.city = city;
		this.street_address = street_address;
		this.operational = operational;
		this.description = description;
		this.restaurant_name = restaurant_name;
		this.id = id;
	}
	@Override
	public String toString() {
		return "RestDao [restaurant_id=" + restaurant_id + ", city=" + city + ", street_address=" + street_address
				+ ", operational=" + operational + ", description=" + description + ", restaurant_name="
				+ restaurant_name + ", id=" + id + "]";
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStreet_address() {
		return street_address;
	}
	public void setStreet_address(String street_address) {
		this.street_address = street_address;
	}
	public boolean isOperational() {
		return operational;
	}
	public void setOperational(boolean operational) {
		this.operational = operational;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	 
	
}

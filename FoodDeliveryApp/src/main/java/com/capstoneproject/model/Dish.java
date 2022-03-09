package com.capstoneproject.model;

public class Dish {
	private int menuitem_id;
	private String item_name;
	private String description;
	private float price;
	private boolean active;
	private int quantity;
	public Dish() {
		super();
	}


	
	public Dish(int menuitem_id, String item_name, String description, float price, boolean active, int quantity) {
		super();
		this.menuitem_id = menuitem_id;
		this.item_name = item_name;
		this.description = description;
		this.price = price;
		this.active = active;
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "Dish [menuitem_id=" + menuitem_id + ", item_name=" + item_name + ", description=" + description
				+ ", price=" + price + ", active=" + active + ", quantity=" + quantity + "]";
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	
}

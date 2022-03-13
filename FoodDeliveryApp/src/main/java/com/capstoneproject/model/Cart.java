package com.capstoneproject.model;

public class Cart extends Dish{
		private int quantity;
		private int restaurant_id;
		public Cart() {}
		
		public int getRestaurant_id() {
			return restaurant_id;
		}

		public void setRestaurant_id(int restaurant_id) {
			this.restaurant_id = restaurant_id;
		}

		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
}

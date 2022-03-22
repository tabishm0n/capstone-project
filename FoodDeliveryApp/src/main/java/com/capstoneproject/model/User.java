package com.capstoneproject.model;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
	private int id;
	private String login;
	private String password;
	private String city;
	private String street_address;
	private String first_name;
	private String last_name;
	private String email;
	private String phone;
	private String user_type;
	private String payment;
	private Timestamp registeration_date;
	private int deliverer_id;
	private float wallet;
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", login=" + login + ", password=" + password + ", city=" + city + ", street_address="
				+ street_address + ", first_name=" + first_name + ", last_name=" + last_name + ", email=" + email
				+ ", phone=" + phone + ", user_type=" + user_type + ", payment=" + payment + ", registeration_date="
				+ registeration_date + ", deliverer_id=" + deliverer_id + ", wallet=" + wallet + "]";
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Timestamp getRegisteration_date() {
		return registeration_date;
	}
	public void setRegisteration_date(Timestamp timestamp) {
		this.registeration_date = timestamp;
	}
}

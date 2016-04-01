package com.online_banking.example;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UserInfo {
	private String nat_id="";
	private String card_number="" ;
	private String f_name="";
	private String l_name="";
	private String zip_code ="";
	private String address ="";
	private ArrayList<String> addr;
	private String username ="";
	private String telephone="";
	private Double balance=0.0;
	private String email ="";
	private String password="";
	private Connection conn;
	private ResultSet result;
	private String fax="";
	private String country="";
	private String state="";
	private String city="";
	private String street="";
	
	public UserInfo(String nat_id){
		 try {
			 	Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bnk","root","");
	            String sql = "Select * from users Where national_id = ?";
	            PreparedStatement st = this.conn.prepareStatement(sql);
	            st.setString(1, nat_id);
	            this.result = st.executeQuery();
	            if(this.result.next()){
	            	this.nat_id = this.result.getString("national_id");
	            	this.f_name = this.result.getString("f_name");
	            	this.l_name = this.result.getString("l_name");
	            	this.username = this.result.getString("username");
	            	this.email = this.result.getString("email");
	            	this.password = this.result.getString("password");
	            	this.card_number = this.result.getString("card_number");
	            	this.zip_code = this.result.getString("zip_code");
	            	this.address = this.result.getString("address");
	            	this.fax = this.result.getString("fax");
	            	this.addr = new ArrayList<String>(Arrays.asList(this.address.split(",")));
	            	this.country = this.addr.get(0);
	            	this.city = this.addr.get(1);
	            	this.state = this.addr.get(2);
	            	this.street = this.addr.get(3);
	            	this.balance = this.result.getDouble("balance");
	            	this.telephone = this.result.getString("telephone");
	            	
	            }
	        }catch(SQLException | ClassNotFoundException  e){
	            System.out.println(e);
	        }
		
	}
	public String getNat_id() {
		return nat_id;
	}

	public String getCard_number() {
		return card_number;
	}

	public String getF_name() {
		return f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public String getZip_code() {
		return zip_code;
	}

	public String getAddress() {
		return address;
	}

	public String getCountry() {
		return country;
	}
	
	public String getState() {
		return state;
	}
	
	public String getCity() {
		return  city;
	}
	
	public String getStreet() {
		return street;
	}

	public String getUsername() {
		return username;
	}

	public String getTelephone() {
		return telephone;
	}


	public Double getBalance() {
		return balance;
	}

	public Double getBalanceEUR() {
		return balance * 12;
	}
	
	public Double getBalanceUSD() {
		return balance * 8;
	}


	public String formatNum(double number){
		String numformat = NumberFormat.getCurrencyInstance().format(number);
		return numformat;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return this.fax;
	}
	
	public String getPassword() {
		return password;
	}
	
	public static String getUserNationalId(HttpServletRequest request) {
		Cookie cook[] = request.getCookies();
		for(Cookie i : cook){
			if(i.getName().equalsIgnoreCase("nat_id")){
				return (i.getValue().length() > 0)? i.getValue() : "bad";
			}
		}
		return "bad";
	}
	
	public static Double getLatestBalance(Double amount, Double oldBalance) {
		if(oldBalance >= amount){
			return oldBalance - amount;
		}else{
			return (double) -1 ;
		}
	}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.online_banking.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB_Transfer {

    //confirm password method
    private Connection  conn = null;
	private String nat_id; 
    public DB_Transfer(String nat_id){
       
        try {
        	Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bnk","root","");
            this.nat_id = nat_id;
        }catch(SQLException | ClassNotFoundException e){
            System.out.println(e);
        }
    }
        
    public  boolean confirmpassword(String pass1, String pass2) {

        if (pass1.equals(pass2)) {
            return true;
        } else {
            return false;
        }

    }

    //validate username method 
    public  boolean validateusername(String username) {
        if (username.matches("[A-Za-z_\\-0-9]")) {
            return true;
        }
        return false;

    }

    //validate balance method
    public  boolean balance(String balance) {
        if ((balance.matches("[\\d]*"))) {

            return true;
        } else {
            return false;
        }

    }

    public  int deposit(int balance, int amount) {

        int deposit = balance;
        deposit = balance + amount;

        return deposit;

    }
    
    public  int getLastId() {
         try{
            String sql = "select MAX(id) as id from transfer";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet result =  st.executeQuery();
            if(result.next()){
                return result.getInt("id");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
         return -1;
    }

    public void updateDatabase(  String dest_card_number, String dest_person_name, String dest_bank_name,double amount, double oldBalance, double latestBalance, String dest_country) throws ClassNotFoundException {
        
        try{
            String sql = "insert into transfer (dest_bank_name , dest_person_name  , dest_card_number  ,amount,old_balance,latest_balance,dest_country,transfer_date) values(?,?,?,?,?,?,?,Now())";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setString(1, dest_bank_name);
            st.setString(2, dest_person_name);
            st.setString(3, dest_card_number);
            st.setDouble(4, amount);
            st.setDouble(5, oldBalance);
            st.setDouble(6, latestBalance);
            st.setString(7, dest_country);
            st.executeUpdate();
            
            sql = "insert into process (national_id,process_type,process_id,notes) values(?,?,?,?)";
            st = this.conn.prepareStatement(sql);
            st.setString(1, this.nat_id);
            st.setString(2,"transfer");
            st.setInt(3, getLastId());
            st.setString(4,"");
            st.executeUpdate();
            
            sql = "update users set balance = ? where national_id= ?";
            st = this.conn.prepareStatement(sql);
            st.setDouble(1, latestBalance);
            st.setString(2,this.nat_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}

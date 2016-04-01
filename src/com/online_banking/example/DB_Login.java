package com.online_banking.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB_Login {
	//confirm password method
    private Connection  conn = null;
	private String nat_id; 
    public DB_Login(){
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bnk", "root", "");
        }catch(SQLException | ClassNotFoundException e){
            System.out.println(e);
        }
    }
   
    public  boolean checkValidUser( String email , String password) throws ClassNotFoundException {
        
        try{
            String sql = "Select national_id from users where email = ? and password = ? ";
            PreparedStatement st = this.conn.prepareStatement(sql);
            
            st = this.conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2,password);
            
            ResultSet result = st.executeQuery();
            while(result.next()){
            	this.nat_id = result.getString("national_id");
            	return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

	public String getNat_id() {
		return nat_id;
	}
    
    
}

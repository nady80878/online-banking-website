package com.online_banking.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB_Deposit {

    //confirm password method
    private Connection  conn = null; 
    private String nat_id;
    public DB_Deposit(String nat_id){
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bnk", "root", "");
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

    public  double deposit(double balance, double amount) {
        return balance + amount;
    }

    public  int getLastId() {
         try{
            String sql = "select MAX(id) as id from deposit";
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
    
    public  void updateDatabase( double amount, double oldBalance, double latestBalance) throws ClassNotFoundException {
        
        try{
            String sql = "insert into deposit (amount,old_balance,latest_balance,deposit_date) values(?,?,?,Now())";
            PreparedStatement st = this.conn.prepareStatement(sql);
            st.setDouble(1, amount);
            st.setDouble(2, oldBalance);
            st.setDouble(3, latestBalance);
            st.executeUpdate();
            
            sql = "insert into process (national_id,process_type,process_id,notes) values(?,?,?,?)";
            st = this.conn.prepareStatement(sql);
            st.setString(1,this.nat_id);
            st.setString(2,"deposit");
            st.setInt(3, getLastId());
            st.setString(4,"");
            st.executeUpdate();
            
            sql = "update users set balance = ? where national_id  = ?";
            st = this.conn.prepareStatement(sql);
            st.setDouble(1, latestBalance);
            st.setString(2,this.nat_id);
            st.executeUpdate();
            

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}

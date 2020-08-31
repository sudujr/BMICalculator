//Data access object class for login based opeations
package com.bmi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	
	
	@Autowired
	DataSource dataSource;
	
	Connection connection;
	PreparedStatement preparedStatement;
    ResultSet resultset;
    
    // Function to count thetable with login details
    public long countLogin(String uid, String pd) {
		 String sql="select COUNT(*) as totalcount from userlogin where user_name = ? and pass_word = ?";
		 long count = 0;
		   try {
			connection=dataSource.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1,uid);
			preparedStatement.setString(2, pd);
			resultset=preparedStatement.executeQuery();
			resultset.next();
			count = resultset.getLong("totalcount");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

    }
    
    // Function to count the table with signup details
    public long countSignUp(String uid) {
		 String sql="select COUNT(*) as totalcount from userlogin where user_name = ?";
		 long count = 0;
		   try {
			connection=dataSource.getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1,uid);
			resultset=preparedStatement.executeQuery();
			resultset.next();
			count = resultset.getLong("totalcount");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
    	
    }
    
    // Function to insert the signupdetails into the database as eneted by the user
	public boolean signUpInsert(String name, String uid, String pd) {

		try {
			
			String sql = "insert into userlogin(name,user_name,pass_word) values(?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, uid);
			preparedStatement.setString(3, pd);


			int flag = preparedStatement.executeUpdate();

			if (flag > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
    
}

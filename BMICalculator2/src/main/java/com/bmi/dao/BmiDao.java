// Data Access object Class for bmi based operation
package com.bmi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BmiDao {

	@Autowired
	DataSource dataSource;

	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultset;

	// Function yo find the category based on bmi
	public String findCategory(float bmi) {
		String sql = "select Category as c from bmiinfo where bmib <= ? and bmie >= ?";
		String Category = null;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setFloat(1, bmi);
			preparedStatement.setFloat(2, bmi);
			resultset = preparedStatement.executeQuery();
			resultset.next();
			Category = resultset.getString("c");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Category;

	}

	// Function to extract Diet and exercise suggestion based on catgory
	public List<String> extractSuggestion(String category) {

		List<String> s = new ArrayList<>();

		try {
			connection = dataSource.getConnection();
			String sql = "select * from dietinfo where Category='" + category + "'";
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {

				String d = resultset.getString("dsuggestion");
				s.add(d);
				String e = resultset.getString("excerise");
				s.add(e);
			}
		} catch (SQLException e) {
		}

		return s;

	}

}

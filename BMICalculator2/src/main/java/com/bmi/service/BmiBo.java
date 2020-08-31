//Service class for bmi based business operations
package com.bmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bmi.dao.BmiDao;
import com.bmi.model.UserInfo;

@Service
public class BmiBo {
	
	@Autowired
	BmiDao bmidao;

	//Fucntion to compute bmi based on height and weight
	public UserInfo computeBMI(UserInfo ui) {
		float weight = ui.getWeight();

		float height = ui.getHeight() / (float) 100.0;

		float BMI = weight / (height * height);
		double bmi = (Math.round(BMI*100.0)/100.0);

		ui.setBmi(bmi);

		return ui;
	}
	
	// Function to get category based on bmi
	public String getCategory(UserInfo ui) {
		
		return bmidao.findCategory((float)ui.getBmi());
	}
	
	// Function to get Diet and exercise suggestion based on category
	public List<String> getSuggestion(UserInfo ui){
		
		return bmidao.extractSuggestion(ui.getType());
		
	}

}

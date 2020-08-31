//Controller class for bmi related operation
package com.bmi.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bmi.model.UserInfo;
import com.bmi.service.BmiBo;
import com.bmi.service.LoginBo;

@Controller
public class BmiController {

	@Autowired
	BmiBo bmibo;

	// Function for computing bmi and Category
	@RequestMapping(value = "/inForm", method = RequestMethod.POST)
	public String showBmi(UserInfo ui, Model model) {

		UserInfo _ui = bmibo.computeBMI(ui);

		String category = bmibo.getCategory(ui);

		_ui.setType(category);

		model.addAttribute("obj", _ui);

		return "bmicalc";

	}

	// Function to extract suggestion based on category
	@RequestMapping(value = "/dietForm", method = RequestMethod.POST)
	public String showDiet(UserInfo ui, Model model) {
		// UserInfo _ui = loginbao.computeBMI(ui);
		UserInfo _ui = bmibo.computeBMI(ui);

		String category = bmibo.getCategory(ui);

		_ui.setType(category);

		model.addAttribute("obj", _ui);

		List<String> s = bmibo.getSuggestion(_ui);

		model.addAttribute("s1", s.get(0));

		model.addAttribute("s2", s.get(1));

		return "bmicalc";
	}

}

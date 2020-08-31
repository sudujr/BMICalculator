// Controller class for login related operations
package com.bmi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bmi.model.UserInfo;
import com.bmi.service.LoginBo;

@Controller
public class LoginController {

	@Autowired
	LoginBo loginbao;
	// Function to go to homepage
	@RequestMapping("/")
	public String Welocome() {
		return "index";
	}

	// Function to activate the SignIn portion of Homepage
	@RequestMapping(value = "/logForm", params = "0", method = RequestMethod.POST)
	public String signInPage(Model model) {
		model.addAttribute("sign", "in");
		return "index";
	}

		// Function to acticate signup portion of home page
	@RequestMapping(value = "/logForm", params = "1", method = RequestMethod.POST)
	public String signUpPage(Model model) {
		model.addAttribute("sign", "up");
		return "index";
	}

	// Function to check signIn Details
	// Moves to bmicalc page if signin is successful
	// remains in the same page with error message if invalid data is enetred
	@RequestMapping(value = "/signInForm", method = RequestMethod.POST)
	public String SignIn(String userid, String password, Model model) {
		if (loginbao.validateLogin(userid, password)) {
			return "bmicalc";
		} else {
			model.addAttribute("sign", "in");
			model.addAttribute("error", "Invalid Username/Password");
			return "index";
		}
	}
	// Function to validate signUp details
	// moves to signin page of homepage if signup os successfull
	// else remains in signup part with error message
	@RequestMapping(value = "/signUpForm", method = RequestMethod.POST)
	public String SignUp(String name, String userid, String password, Model model) {
		if (loginbao.validateSignUp(name, userid, password)) {
			model.addAttribute("suc", "Success");
			model.addAttribute("sign", "in");
			return "index";
		} else {
			model.addAttribute("err", "Invalid Username");
			model.addAttribute("sign", "up");
			return "index";
		}

	}
	// Function to redirect to homepage on logout
	@RequestMapping(value = "/logoutForm", params = "0", method = RequestMethod.POST)
	public String HomePage(RedirectAttributes ra) {
		return "redirect:/";
	}

}

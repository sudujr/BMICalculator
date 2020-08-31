
//Service class for login based business operations
package com.bmi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bmi.dao.LoginDao;
import com.bmi.model.UserInfo;

@Service
public class LoginBo {

	@Autowired
	LoginDao loginDao;

		// Function to validte LoginDetails
	public boolean validateLogin(String uid, String pd) {

		if (loginDao.countLogin(uid, pd) == 0) {

			return false;

		} else {

			return true;

		}
	}

	// Function to validate signup details
	public boolean validateSignUp(String name, String uid, String pd) {

		if (loginDao.countSignUp(uid) == 0) {

			return loginDao.signUpInsert(name, uid, pd);

		} else {

			return false;
		}

	}




}


//BmiCalculatorApplication class is used to bootstrap and launch a Spring application
package com.bmi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BmiCalculatorApplication {

	public static void main(String[] args) {
		SpringApplication.run(BmiCalculatorApplication.class, args);
	}

}

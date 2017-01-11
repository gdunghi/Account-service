package com.account.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ComponentScan("com.account.*")
@SpringBootApplication
@EnableTransactionManagement
public class Application extends SpringBootServletInitializer {

	public static void main(String[] args) throws Throwable {
		SpringApplication.run(Application.class, args);
	}
}
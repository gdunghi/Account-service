package com.account.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // get logged in username
		model.addAttribute("name", name);
		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping("/403")
	public String error403() {
		return "403";
	}

}

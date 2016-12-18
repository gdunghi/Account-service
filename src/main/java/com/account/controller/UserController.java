package com.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.account.dto.UserDto;
import com.account.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserRepository repo ;
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "user/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("user") UserDto user) { 
		repo.save(user);
		return "redirect:/user/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model) {	
		model.addAttribute("userList", repo.findByAll());
		return "user/user_list";
	}

}

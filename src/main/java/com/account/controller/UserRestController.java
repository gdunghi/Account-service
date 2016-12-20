package com.account.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.account.dto.UserDto;
import com.account.repository.UserRepository;
import com.account.utils.AjaxResponseBody;
import com.account.utils.PersonJsonObject;
import com.account.utils.Views;
import com.fasterxml.jackson.annotation.JsonView;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RestController
@RequestMapping("/user-rest")
public class UserRestController {
	@Autowired
	private UserRepository repo ;
	
	@JsonView(Views.Public.class) 
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	public AjaxResponseBody save(@RequestBody UserDto user) { 
		AjaxResponseBody result = new AjaxResponseBody(); 
		if (repo.save(user) > 0) {
			result.setCode("200");
			result.setMsg(""); 
		} else {
			result.setCode("204");
			result.setMsg("Save fail!");
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String list(ModelMap model) {
		List<UserDto> users = repo.findByAll();
		 
		
		PersonJsonObject personJsonObject = new PersonJsonObject();
		//Set Total display record
		personJsonObject.setiTotalDisplayRecords(users.size());
		//Set Total record
		personJsonObject.setiTotalRecords(users.size());
		personJsonObject.setAaData(users);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(personJsonObject);
	
//		return json2;
		return json2;
	}
}

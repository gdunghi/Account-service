package com.account.repository;

import java.util.List;

import com.account.dto.UserDto;



public interface UserRepository {
	long save(UserDto user);
	List<UserDto> findByAll();
}

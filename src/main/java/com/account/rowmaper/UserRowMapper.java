package com.account.rowmaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.account.dto.UserDto;

 

class UserRowMapper implements RowMapper<UserDto>
{
    @Override
    public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException 
    {
    	UserDto user = new UserDto();         
        user.setUserName(rs.getString("username"));
        user.setEnabled(rs.getBoolean("enabled")); 
        return user;
    }
}
package com.account.repositoryImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.account.dto.UserDto;
import com.account.repository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public long save(UserDto user) { 
		return 0;
	}

	@Override
	@Transactional(readOnly=true)
	public List<UserDto> findByAll() { 
		return jdbcTemplate.query("SELECT * FROM users ", new UserRowMapper());
     
	}
	
	
	
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

}

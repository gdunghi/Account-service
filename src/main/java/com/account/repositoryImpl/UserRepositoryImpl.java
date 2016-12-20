package com.account.repositoryImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.account.dto.UserDto;
import com.account.repository.UserRepository;
import com.account.utils.StringBuilderUtil;

@Repository
public class UserRepositoryImpl implements UserRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	@Transactional
	public long save(UserDto user) {
		StringBuilderUtil sb = new StringBuilderUtil();
		sb.appendNl(" INSERT INTO USERS (username,password,enabled,fname,lname,email) VALUES (?,?,?,?,?,?) "); 
		return   jdbcTemplate.update(sb.toString(),
				new Object[] { user.getUserName(),user.getPassword(), user.isEnabled(),user.getFname(),user.getLname(),user.getEmail()});
	}

	@Override
	@Transactional(readOnly = true)
	public List<UserDto> findByAll() {
		return jdbcTemplate.query("SELECT * FROM users ", new UserRowMapper());

	}

	class UserRowMapper implements RowMapper<UserDto> {
		@Override
		public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserDto user = new UserDto();
			user.setUserName(rs.getString("username"));
			user.setEnabled(rs.getBoolean("enabled"));
			user.setFname(rs.getString("fname"));
			user.setLname(rs.getString("lname"));
			user.setEmail(rs.getString("email"));
			user.setLastActiveDate(new Date());
			user.setFullName(user.getFname()+"  " + user.getLname());
			return user;
		}
	}

}

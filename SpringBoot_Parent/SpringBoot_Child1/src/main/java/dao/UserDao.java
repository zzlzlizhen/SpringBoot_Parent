package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	public void saveUser(User user) {
		jdbcTemplate.update("insert into t_user(id,name,phone,pwd,status,create_time,update_time,email) values(?,?,?,?,?,?,?,?)", new Object[]{user.getId(),user.getName(),user.getPhone(),user.getPwd(),user.getStatus(),user.getCreateTime(),user.getUpdateTime(),user.getEmail()});
	}
}

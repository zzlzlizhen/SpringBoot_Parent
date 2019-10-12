package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.User;
import mapper.UserMapper;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	@Autowired
	UserMapper userMapper;
	@Override
	public void save(User user) {
		userMapper.save(user);
	}
}

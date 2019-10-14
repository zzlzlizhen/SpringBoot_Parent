package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import dao.UserDao;
import entity.User;
import entity.UserExample;
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
	@Override
	public PageInfo<User> selectList(UserExample ue) {
		PageHelper.startPage(ue.getPageNum(), ue.getPageSize());
		UserExample userExaple = new UserExample();
		List<User> list = userMapper.selectList(ue);
		PageInfo<User> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
}

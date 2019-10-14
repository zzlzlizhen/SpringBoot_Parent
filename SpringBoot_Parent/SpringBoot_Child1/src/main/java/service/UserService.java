package service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import entity.User;
import entity.UserExample;

public interface UserService {
	public void save(User user);
	public PageInfo<User> selectList(UserExample ue);
}

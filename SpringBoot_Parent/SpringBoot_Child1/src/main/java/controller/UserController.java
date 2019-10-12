package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.User;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping(value ="/save")
	@ResponseBody
	public String save(User user) {
		user.setId("0980933");
		user.setName("赵三梅2");
		user.setPwd("123234");
		user.setCreateTime("1121");
		user.setUpdateTime("232231");
		user.setPhone("138347451");
		user.setEmail("32341@qq.com");
		user.setStatus("1");
		userService.save(user);
		return "保存成功";
	}
}

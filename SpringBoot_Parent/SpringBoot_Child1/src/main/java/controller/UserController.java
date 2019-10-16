package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageInfo;

import entity.User;
import entity.UserExample;
import service.UserService;

/*@Controller*/
public class UserController {
/*	@Autowired
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
	@RequestMapping(value="/list",method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<User> getList(Integer pageNum, Integer pageSize) {
		System.out.println("-------------进入");
		System.out.println(pageNum + pageSize);
		UserExample ue = new UserExample();
		if(pageNum == null || pageNum == 0) {
			pageNum = 1;
		}
		if(pageSize == null || pageSize == 0) {
			pageSize = 5;
		}
		ue.setPageNum(pageNum);
		ue.setPageSize(pageSize);
		PageInfo<User> list = userService.selectList(ue);
		return list;
	}
	@RequestMapping(value="/list2",method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<User> getList2(@RequestParam(value = "pageNum",required = false) Integer pageNum, @RequestParam(value = "pageSize",required = false)Integer pageSize) {
		System.out.println("-------------进入");
		UserExample ue = new UserExample();
		if(pageNum == null || pageNum == 0) {
			pageNum = 1;
		}
		if(pageSize == null || pageSize == 0) {
			pageSize = 5;
		}
		ue.setPageNum(pageNum);
		ue.setPageSize(pageSize);
		PageInfo<User> list = userService.selectList(ue);
		return list;
	}*/
}

package controller.lz;

import entity.lz.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.lz.TUserService;

import java.util.Date;


@Controller
public class TUserController {
    @Autowired
    TUserService TUserService;
    @RequestMapping("/user")
    @ResponseBody
    public String saveUser(){
        TUser tUser = new TUser();
        tUser.setId("00878733");
        tUser.setName("赵三梅23345");
        tUser.setPwd("1245678902");
        tUser.setCreateTime("2019-10-15");
        tUser.setUpdateTime("2019-10-15");
        tUser.setPhone("13834745111");
        tUser.setEmail("32312341@qq.com");
        tUser.setStatus("1");
        TUserService.savaUser(tUser);
        return "ok";
    }
    @RequestMapping("/getUser")
    @ResponseBody
    public String getUser(String id){
        TUser TUser = TUserService.getUser(id);
        return TUser.toString();
    }
}

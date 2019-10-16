package controller;

import email.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
    @Autowired
    EmailService emailService;
    @RequestMapping(value = "/sendEmail")
    @ResponseBody
    public String sendEmail(){
        emailService.sendEmail("275290501@qq.com","老李头","猜猜我是谁，哈哈");
        return "ok";
    }
}

package com.user.controller;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@ResponseBody
@RequestMapping("/user")
public class UserController {
    @Autowired
    private EurekaClient eurekaClient;
    @RequestMapping(value = "/index.do",method = RequestMethod.GET)
    public Object index(){
        InstanceInfo nextServerFromEureka = eurekaClient.getNextServerFromEureka("eureka-client",false);
        System.out.println("name:"+nextServerFromEureka.getAppName()+ " port:" + nextServerFromEureka.getPort());
        return nextServerFromEureka;
    }
}

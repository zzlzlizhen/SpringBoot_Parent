package controller;

import com.zsm.config.WebSocketServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class CheckCenterController {

    //页面请求
    @GetMapping("/websocket/{cid}")
    public ModelAndView socket(String cid) {
        ModelAndView mav=new ModelAndView("/thy");
        mav.addObject("cid", cid);
        return mav;
    }
    //推送数据接口
    @ResponseBody
    @RequestMapping("/websocket/push")
    public String pushToWeb( String cid,String message) {
        try {
            WebSocketServer.sendInfo(message,cid);
        } catch (IOException e) {
            e.printStackTrace();
            return (cid+"#"+e.getMessage());
        }
        return cid;
    }
    @RequestMapping(value = "/socket")
    public String showSocket(){
        return "/websoct";
    }
}
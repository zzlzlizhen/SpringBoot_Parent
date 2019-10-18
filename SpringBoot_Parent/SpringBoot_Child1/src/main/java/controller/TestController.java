package controller;
import java.io.File;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.Future;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Person;
import org.springframework.web.multipart.MultipartFile;
import service.AsyncService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TestController {
	@Autowired
	AsyncService asyncService;
	/**
	 * 定义消息转换器
	 */
	@Bean
	public StringHttpMessageConverter stringHttpMessageConverter() {
		StringHttpMessageConverter conver = new StringHttpMessageConverter(Charset.forName("utf-8"));
		return conver;
	}
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value="/show")
	@ResponseBody
	public String show() {
		logger.debug("debug日志");
		logger.info("info日志");
		logger.warn("warn日志");
		logger.error("error日志");
		/* int a = 5/0; */
		return "show 你好";
	}
	
	@RequestMapping(value="/person")
	@ResponseBody
	public Object person() {
		Person ps = new Person();
		ps.setDate(new Date());
		ps.setId(1);
		ps.setName("赵三梅");
		return ps;
	}
	@RequestMapping(value="/async")
	@ResponseBody
	public String async() throws Exception {
		long start = System.currentTimeMillis();
		Future<String> task1 = asyncService.doTask1();
		Future<String> task2 = asyncService.doTask2();
		Future<String> task3 = asyncService.doTask3();
		
		while(true) {
			if(task1.isDone() && task2.isDone() && task3.isDone()) {
				break;
			}
			Thread.sleep(1000);
		}
		long end = System.currentTimeMillis();
		System.out.println("任务结束总时间 :" + (end - start) + "毫秒");
		return "总任务结束时间为:" + (end -start) ;
	}
	
	@RequestMapping("/frer")
	public String frer(Model model) {
		/*model.addAttribute("name","赵三梅");*/
		return "show";
	}
	@RequestMapping("/thym")
	public String thy(Model model) {
		model.addAttribute("word","单词");
		return "thy";
	}

	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartFile file, HttpServletRequest httpServletRequest){
		try {
			//创建文件在服务器端的存放路径
		/*	String dir = httpServletRequest.getServletContext().getRealPath("/upload");*/
			String dir = "D:\\upload";
			//把路径生成一个文件，看看此文件是否存在
			File fileDir = new File(dir);
			if(!fileDir.exists()){
				fileDir.mkdir();
			}
			//截取文件上传扩展名
			String filesuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			//获取服务器文件名
			String fileName = UUID.randomUUID().toString() + filesuffix;
			File files = new File(fileDir + "/"+fileName);
			//上传
			file.transferTo(files);
		}catch (Exception e){
			e.printStackTrace();
			return "文件上传失败";
		}

		return "ok";
	}

}

package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * 如果每个功能返回的是restful结果，可以直接使用@RestController，可以省略@ResponseBody注解
 * @author zsm
 *
 */
@RestController
public class SpringBootController {
	private static Logger logger = LoggerFactory.getLogger(SpringBootController.class);
	@RequestMapping(value="/yes")
	/**
	 * 说明返回的是restful内容，不使用该注解会进行跳转
	 * @return
	 */
	//@ResponseBody
	public String yes() {
		logger.debug("debug日志");
		logger.info("info日志");
		logger.warn("warn日志");
		logger.error("error日志");
		return "yes";
	}
	/**
	 * 支持rest分格
	 */
	@RequestMapping(value="/info/{msg}")
	public String info(@PathVariable("msg") String msg) {
		return "show"+msg;
	}
}

 
package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常处理
 * @author zsm
 *
 */
//advice通知
@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Map<String,Object> handlerException(Exception exception){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("errorCode", 500);
		map.put("errorMessage",exception.toString());
		return map;
	}
}

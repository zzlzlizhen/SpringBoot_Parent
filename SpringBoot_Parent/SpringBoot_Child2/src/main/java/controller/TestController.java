package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class TestController {
	/*
	 * @RequestMapping("/index") public String show(Model model) {
	 * model.addAttribute("name","����"); return "index"; }
	 */
	@RequestMapping("/frer")
	public String frer(Model model) {
		model.addAttribute("name","����÷");
		return "/show";
	}
	@RequestMapping("/thym")
	public String thy(Model model) {
		model.addAttribute("word","����");
		return "/thy";
	}
}

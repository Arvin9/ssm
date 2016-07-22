package site.nebulas.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.User;
import site.nebulas.realm.UserRealm;


@Controller
public class ShiroController {
	Logger log=LoggerFactory.getLogger(getClass());
	
	

	@RequestMapping("index")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	@RequestMapping("login")
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	@RequestMapping("loginIn")
	@ResponseBody
	public Object loginIn(User user){
		UserRealm userRealm = new UserRealm();
		//userRealm.doGetAuthenticationInfo(user);
		return "";
	}
}





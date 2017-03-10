package site.nebulas.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Book;
import site.nebulas.beans.Manager;
import site.nebulas.service.BookService;
import site.nebulas.service.ManagerService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;
import java.util.Date;


@Controller
public class ManagerController {
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Resource
	private ManagerService managerService;
	
	
	@RequestMapping("manager")
	public ModelAndView manager(){
		ModelAndView modelAndView = new ModelAndView("manager");
		return modelAndView;
	}
	
	@RequestMapping("managerQueryByParam")
	@ResponseBody
	public Object managerQueryByParam(Manager manager) {
		return managerService.queryByParam(manager);
	}

	@RequestMapping("managerInsert")
	@ResponseBody
	public Object managerInsert(Manager manager) {
		manager.setAccount("nebula");
		manager.setAddTime(DateUtil.getTime());
		return managerService.insert(manager);
	}
}





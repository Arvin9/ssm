package site.nebulas.controller;




import javax.annotation.Resource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.Book;
import site.nebulas.service.BookService;



@Controller
public class BookController {
	Logger log=LoggerFactory.getLogger(getClass());
	
	@Resource
	private BookService bookService;
	
	
	@RequestMapping("book")
	public ModelAndView operationLog(){
		ModelAndView modelAndView = new ModelAndView("book");
		return modelAndView;
	}
	
	@RequestMapping("bookQueryByParam")
	@ResponseBody
	public Object bookQueryByParam(Book book) {
		return bookService.bookQueryByParam(book);
	}
}





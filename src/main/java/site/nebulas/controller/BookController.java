package site.nebulas.controller;


import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	

	

	
	/*
	
	@RequestMapping("addBook")
	@ResponseBody
	public Object addBook(Book book, @RequestParam("bookPicFile")MultipartFile bookPicFile, 
			@RequestParam("uploadBookFile")MultipartFile uploadBookFile){
		Response response = new Response();
		try {
			if (bookPicFile!=null&&!bookPicFile.isEmpty()) {
				String fileName = bookPicFile.getOriginalFilename();
				System.out.println("fileName:"+fileName);
				String src = s3Service.upload(bookPicFile.getInputStream(),fileName);
				System.out.println("src:"+src);
				book.setBookPic(src);
			}
			if (uploadBookFile!=null&&!uploadBookFile.isEmpty()) {
				String fileName = uploadBookFile.getOriginalFilename();
				System.out.println("fileName:"+uploadBookFile);
				String src = s3Service.upload(uploadBookFile.getInputStream(),fileName);
				System.out.println("src:"+src);
				book.setBookURL(src);
			}
			book.setUpdateTime(DateUtil.getDateTimeString(new Date()));
			
			bookService.insert(book);
			OperationLog operationLog = new OperationLog();

			operationLog.setAction("新增图书URL");
			operationLog.setBody(new Gson().toJson(book));
			OperLogUtil.writeLog(operationLog);
		} catch (Exception e) {
			logger.error("add book", e);
			response.setRet(10000);
		}		
		return response;
	}
	
	@RequestMapping("updateBook")
	@ResponseBody
	public Object updateBook(Book book){
		Response response = new Response();
		book.setUpdateTime(DateUtil.getDateTimeString(new Date()));
		bookService.update(book);
		return response;
	}
	
	@RequestMapping("deleteBook")
	@ResponseBody
	public Object deleteBook(Book book){
		Response response = new Response();
		bookService.delete(book);
		return response;
	}
	*/
}





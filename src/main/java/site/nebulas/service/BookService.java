package site.nebulas.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import site.nebulas.beans.Book;
import site.nebulas.dao.BookDao;


@Service
public class BookService {
	@Resource
	private BookDao bookDao;
	
	public List<Book> bookQueryByParam(Book book) {
		return bookDao.bookQueryByParam(book);
	}
	public void insert(Book book){
		bookDao.insert(book);
	}
	
	public void update(Book book){
		bookDao.update(book);
	}
	
	public void delete(Book book){
		bookDao.delete(book);
	}
}

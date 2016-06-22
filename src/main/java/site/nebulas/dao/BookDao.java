package site.nebulas.dao;

import java.util.List;

import site.nebulas.beans.Book;



public interface BookDao {
	public List<Book> bookQueryByParam(Book book);
	public void insert(Book book);	
	public void update(Book book);
	public void delete(Book book);
}

package site.nebulas.dao;

import site.nebulas.beans.Manager;
import java.util.List;


public interface ManagerDao {
	public List<Manager> queryByParam(Manager manager);
	public int insert(Manager manager);
	public int update(Manager manager);
	public int delete(Manager manager);
}

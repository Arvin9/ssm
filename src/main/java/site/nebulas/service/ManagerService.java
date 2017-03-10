package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Manager;
import site.nebulas.beans.RetMsg;
import site.nebulas.dao.ManagerDao;
import javax.annotation.Resource;
import java.util.List;

@Service
public class ManagerService {
	@Resource
	private ManagerDao managerDao;
	
	public List<Manager> queryByParam(Manager manager) {
		return managerDao.queryByParam(manager);
	}
	public RetMsg insert(Manager manager){
		RetMsg retMsg = new RetMsg();
		if (managerDao.insert(manager) >= 1) {
			retMsg.setState(RetMsg.SUCCESS);
		} else {
			retMsg.setState(RetMsg.FAILURE);
		}
		return retMsg;
	}
	public RetMsg update(Manager manager){
		RetMsg retMsg = new RetMsg();
		if (managerDao.update(manager) >= 1) {
			retMsg.setState(RetMsg.SUCCESS);
		} else {
			retMsg.setState(RetMsg.FAILURE);
		}
		return retMsg;
	}
	
	public RetMsg delete(Manager manager){
		RetMsg retMsg = new RetMsg();
		if (managerDao.delete(manager) >= 1) {
			retMsg.setState(RetMsg.SUCCESS);
		} else {
			retMsg.setState(RetMsg.FAILURE);
		}
		return retMsg;
	}
}

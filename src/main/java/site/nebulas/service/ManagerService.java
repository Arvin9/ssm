package site.nebulas.service;



import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import site.nebulas.beans.Manager;
import site.nebulas.beans.User;
import site.nebulas.dao.ManagerDao;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
@Service
public class ManagerService {
	@Resource
	private ManagerDao managerDao;

    public void setUserDao(ManagerDao managerDao) {
        this.managerDao = managerDao;
    }
    @Resource
    private PasswordHelper passwordHelper;

    public void setPasswordHelper(PasswordHelper passwordHelper) {
        this.passwordHelper = passwordHelper;
    }

    /**
     * 创建用户
     * @param user
     */
    public void createManager(Manager manager) {
        //加密密码
        passwordHelper.encryptPassword(manager);
        managerDao.createManager(manager);
    }

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long mId, String newPassword) {
    	Manager manager =managerDao.findOne(mId);
    	manager.setPassword(newPassword);
        passwordHelper.encryptPassword(manager);
        managerDao.updateManager(manager);
    }

    /**
     * 添加用户-角色关系
     * @param userId
     * @param roleIds
     */
    public void correlationRoles(Long userId, Long... roleIds) {
    	managerDao.correlationRoles(userId, roleIds);
    }


    /**
     * 移除用户-角色关系
     * @param userId
     * @param roleIds
     */
    public void uncorrelationRoles(Long userId, Long... roleIds) {
    	managerDao.uncorrelationRoles(userId, roleIds);
    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public Manager findByManagerAccount(String managerAccount) {
        return managerDao.findByManagerAccount(managerAccount);
    }

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String managerAccount) {
        return managerDao.findRoles(managerAccount);
    }

    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    public Set<String> findPermissions(String username) {
        return managerDao.findPermissions(username);
    }


}



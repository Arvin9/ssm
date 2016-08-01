package site.nebulas.dao;

import java.util.Set;

import site.nebulas.beans.Manager;
import site.nebulas.beans.User;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface ManagerDao {

    public void createManager(Manager manager);
    public void updateManager(Manager manager);
    public void deleteManager(Integer mId);

    public void correlationRoles(Long userId, Long... roleIds);
    public void uncorrelationRoles(Long userId, Long... roleIds);

    Manager findOne(Long userId);

    Manager findByManagerAccount(String managerAccount);

    Set<String> findRoles(String managerAccount);

    Set<String> findPermissions(String username);
}


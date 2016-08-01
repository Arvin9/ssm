package site.nebulas.realm;

import site.nebulas.beans.Manager;
import site.nebulas.beans.User;
import site.nebulas.service.ManagerService;

import javax.annotation.Resource;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

/**
 * 
 */
public class ManagerRealm extends AuthorizingRealm {

	@Resource
    private ManagerService managerService;

    public void setUserService(ManagerService managerService) {
        this.managerService = managerService;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String managerAccount = (String)principals.getPrimaryPrincipal();
        //通过用户名寻找相应的角色和权限
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //authorizationInfo.setRoles(managerService.findRoles(managerAccount));
        //authorizationInfo.setStringPermissions(managerService.findPermissions(managerAccount));

        return authorizationInfo;
    }

    
    /*登陆realm*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String managerAccount = (String)token.getPrincipal();
        
        Manager manager = managerService.findByManagerAccount(managerAccount);
        
        
        if(null == manager) {
            throw new UnknownAccountException();//没找到帐号
        }

        if(Boolean.TRUE.equals(manager.getIsLock())) {
            throw new LockedAccountException(); //帐号锁定
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
        		manager.getManagerAccount(), //用户名
        		manager.getPassword(), //密码
                ByteSource.Util.bytes(manager.getCredentialsSalt()),//salt=username+salt
                getName()  //realm name
        );
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}

package site.nebulas.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import site.nebulas.beans.Manager;
import site.nebulas.beans.Menu;
import site.nebulas.beans.Role;
import site.nebulas.dao.MenuDao;

@Service
public class MenuService {
	@Resource
	private MenuDao menuDao;
	
	private Logger logger = LoggerFactory.getLogger(MenuService.class);
	
	
	/*
	 * @author CaiHonghui
	 * @version 
	 * @see
	 * @param 
	 * @return menu树json
	 * @exception 
	 * @override 
	 * 
	 * */
	
	public List<Map<String,Object>> getMenuByParm(Integer roleId){
		Role rl = new Role();
		Set<String> menuSet = new HashSet<String>();
		
		List<Map<String,Object>> oldMenuList = menuDao.getMenuByParm(roleId);
		List<Map<String,Object>> newMenuList = new ArrayList<Map<String,Object>>();
		
		if(null != roleId){
			rl.setRoleId(roleId);
			List<Map<String,Object>> listRole= this.getRoleByParm(rl);
			Map<String,Object> mapRole = listRole.get(0);
			String ownMenus = (String)mapRole.get("ownMenus");
			String[] menu = ownMenus.split(",");
			menuSet.addAll(Arrays.asList(menu));
			for(Map<String,Object> map : oldMenuList){
				if(menuSet.contains(map.get("menuId"))){
					map.put("target", "mainFrame");
					map.put("open", "true");
					newMenuList.add(map);
				}
			}
		}else{
			for(Map<String,Object> map : oldMenuList){
				map.put("target", "mainFrame");
				map.put("open", "true");
				newMenuList.add(map);
			}
		}
		return newMenuList;	
	}
	
	public List<Map<String,Object>> getMenuEditByParm(Integer roleId){
		Role rl = new Role();
		Set<String> menuSet = new HashSet<String>();
		
		List<Map<String,Object>> oldMenuList = menuDao.getMenuByParm(roleId);
		List<Map<String,Object>> newMenuList = new ArrayList<Map<String,Object>>();
		
		if(null != roleId){
			rl.setRoleId(roleId);
			List<Map<String,Object>> listRole= this.getRoleByParm(rl);
			Map<String,Object> mapRole = listRole.get(0);
			String ownMenus = (String)mapRole.get("ownMenus");
			String[] menu = ownMenus.split(",");
			menuSet.addAll(Arrays.asList(menu));
			for(Map<String,Object> map : oldMenuList){
				if(menuSet.contains(map.get("menuId"))){
					map.put("open", "true");
					map.put("checked", "true");
				}
				map.put("menuUrl", "");
				newMenuList.add(map);
			}
		}else{
			newMenuList = oldMenuList;
		}
		return newMenuList;	
	}
	
	
	public List<Map<String,Object>> getManageByParm(Manager manager){
		return menuDao.getManageByParm(manager);
	}
	
	public List<Map<String,Object>> getRoleByParm(Role role){
		return menuDao.getRoleByParm(role);
	}
	
	public void updateRole(Role role){
		menuDao.updateRole(role);
	}
	public void insertRole(Role role){
		menuDao.insertRole(role);
	}
	
	
	
	public void updateManage(Manager manager){
		menuDao.updateManage(manager);
	}
	public void insertManage(Manager manager){
		menuDao.insertManage(manager);
	}
	
	
	public void insertMenu(Menu menu){
		menuDao.insertMenu(menu);
	}
	
	public void updateMenu(Menu menu){
		menuDao.updateMenu(menu);
	}
	
}

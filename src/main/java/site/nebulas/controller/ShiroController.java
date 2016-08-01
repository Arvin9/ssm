package site.nebulas.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.Manager;
import site.nebulas.beans.User;
import site.nebulas.service.ManagerService;


@Controller
public class ShiroController {
	Logger log=LoggerFactory.getLogger(getClass());
	@Resource
	ManagerService managerService;

	@RequestMapping("index")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	@RequestMapping("lo")
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	@RequestMapping("login")
	public String loginIn(Model model,Manager manager){
		String managerAccount = manager.getManagerAccount();
		String password = manager.getPassword();
		
		System.out.println(managerAccount + " " + password);
		
		if(managerAccount != null && password != null){
			UsernamePasswordToken token = new UsernamePasswordToken(managerAccount,password);
//			HttpSession session=request.getSession();
			//session.setAttribute("current",username);
			Subject subject = SecurityUtils.getSubject();
			try {
				 subject.login(token);
				 Integer roleId = managerService.findByManagerAccount(managerAccount).getRoleId();
				 System.out.println(roleId);
				 model.addAttribute("roleId", roleId);
//				 System.out.println("用户是否是通过验证登陆："+subject.isAuthenticated());
//				 System.out.println("用户是否是通过记住我登陆："+subject.isRemembered());
			}catch(UnknownAccountException uae){
	            System.out.println("对用户[" + managerAccount + "]进行登录验证..验证未通过,未知账户");  
	            model.addAttribute("message", "no");
	            return "login";
	        }catch(IncorrectCredentialsException ice){  
	            System.out.println("对用户[" + managerAccount + "]进行登录验证..验证未通过,错误的凭证");  
	            model.addAttribute("message", "error");
	            return "login";
	        }catch(LockedAccountException lae){  
	            System.out.println("对用户[" + managerAccount + "]进行登录验证..验证未通过,账户已锁定");  
//	            request.setAttribute("message_login", "账户已锁定");  
	            return "login";
	        }catch(ExcessiveAttemptsException eae){  
	            System.out.println("对用户[" + managerAccount + "]进行登录验证..验证未通过,错误次数过多");
	            model.addAttribute("message", "error");
	            return "login";
	        }catch(AuthenticationException ae){  
	            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景  
	            System.out.println("对用户[" + managerAccount + "]进行登录验证..验证未通过,堆栈轨迹如下");  
	            ae.printStackTrace(); 
	            model.addAttribute("message", "error");
	            return "login";
	        }  
			return "menu";
		}
		
		return "login";
	}
}





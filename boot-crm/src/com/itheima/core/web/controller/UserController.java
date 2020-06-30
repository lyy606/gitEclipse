package com.itheima.core.web.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;
/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/register.action", method = RequestMethod.GET)
	public String register() {
		
		return "register";
	}
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/addUser.action", method = RequestMethod.POST)
	public String addUser(String username, String usercode, String password, Model model, 
                                                          HttpSession session) {
		User user = new User();
		user.setUser_name(username);
		user.setUser_code(usercode);
		user.setUser_password(password);
		user.setUser_state(1);
		// 检查添加是否成功
		int rows = userService.addUser(user);
		if(rows > 0){
	    	model.addAttribute("msg", "注册成功！");
	        return "login";
	    }else{
	    	model.addAttribute("msg", "注册失败！，请重试！");
	        return "register";
	    }
	}
	
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, 
                                                          HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(usercode, password);
		if(user != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
//			return "customer";
			return "redirect:customer/list.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
	    return "customer";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}


}

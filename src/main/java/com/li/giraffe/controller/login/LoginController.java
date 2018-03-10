package com.li.giraffe.controller.login;


import com.li.giraffe.controller.BaseController;
import com.li.giraffe.model.user.User;
import com.li.giraffe.service.user.IUsersService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li.he 2017年7月26日下午7:19:03
 */
@Controller
public class LoginController {
  
  private Logger logger = Logger.getLogger(LoginController.class);

  @Autowired
  private IUsersService usersService;

  /*
   * 首页
   */
  @RequestMapping("/index")
  public void index(HttpServletRequest request, ModelMap model) {
    List<User> list=usersService.queryList();
    model.put("list",list);
  }
    /*
   * 登陆页面
   */
  @RequestMapping("/login")
  public void login(HttpServletRequest request, ModelMap model) {

  }

}
  



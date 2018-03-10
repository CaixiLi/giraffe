package com.li.giraffe.controller.login;


import com.li.giraffe.controller.BaseController;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li.he 2017年7月26日下午7:19:03
 */
@Controller
public class LoginController extends BaseController {
  
  private Logger logger = Logger.getLogger(LoginController.class);
  
  @RequestMapping("/logining")
  public String ldapLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model,
      String userName, String passWord) throws IOException {
    logger.info("跳转 ldap认证  ");
    return "/login";
  }
  
  /*
   * 首页
   */
  @RequestMapping("/index")
  public void index(HttpServletRequest request, ModelMap model) {
  
  }
  
  
  
}
  



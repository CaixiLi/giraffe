package com.immomo.live.phoenix.controller.login;


import com.google.common.base.Optional;
import com.immomo.live.phoenix.controller.BaseController;
import com.immomo.live.phoenix.filter.AuthenticationFilter;
import com.immomo.live.phoenix.model.system.Login;
import com.immomo.live.phoenix.model.system.PhoenixUser;
import com.immomo.live.phoenix.model.system.ShieldUser;
import com.immomo.live.phoenix.service.system.ILoginService;
import com.immomo.live.phoenix.service.system.IPhoenixUserService;
import com.immomo.mcf.util.JsonUtils;
import com.immomo.mcf.util.StringUtils;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li.he 2017年7月26日下午7:19:03
 */
@Controller
public class LoginController extends BaseController {
  
  private Logger logger = Logger.getLogger(LoginController.class);
  @Autowired
  private IPhoenixUserService phoenixUserService;
  @Autowired
  private ILoginService loginService;
  
  /**
   * 登陆成功的回调
   */
  @RequestMapping("/auth")
  public void token(HttpServletRequest request, HttpServletResponse response, String token,
      String momoid, String username, String name, ModelMap model) throws IOException {
    try {
      HttpSession session = request.getSession();
      session.setAttribute("token", token);
      session.setAttribute("momoid", momoid);
      session.setAttribute("username", username);
      session.setAttribute("name", name);
      logger
          .info("token " + token + " momoid " + momoid + " username " + username + " name " + name);
      response.sendRedirect("/logining");
    } catch (Exception e) {
      logger.error("token error " + e.getMessage(), e);
    }
  }
  
  @RequestMapping("/logining")
  public String ldapLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model,
      String userName, String passWord) throws IOException {
    logger.info("跳转 ldap认证  ");
    return "/login";
  }
  
  /*
  * ldap认证
  */
  @RequestMapping("/ldapLogining")
  public void ldapLoginFrom(HttpServletRequest request, HttpServletResponse response,
      ModelMap model, String userName, String passWord) throws IOException {
    logger.info("ldapLogining 进入");
    ShieldUser ldapUser = new ShieldUser(userName, passWord);
    boolean isLdap = ldapUser.authenticate();
    if (StringUtils.isNotEmpty(userName) && StringUtils.isNotEmpty(passWord)) {
      if (isLdap) {
        logger.info("ldap验证通过 " + userName + " |password : " + passWord);
        response.sendRedirect("/index");
      } else {
        logger.info("ldap验证不通过 " + userName + " |password : " + passWord);
        response.sendRedirect("/logining");
      }
    } else {
      logger.info("ldap验证不通过 用户密码为空 " + userName + " |password : " + passWord);
      response.sendRedirect("/logining");
    }
  }
  
  
  /*
   * 首页
   */
  @RequestMapping("/index")
  public void index(HttpServletRequest request, ModelMap model) {
    HttpSession session = request.getSession();
    String momoid = (String) request.getSession().getAttribute("momoid");
    String enName = (String) request.getSession().getAttribute("username");
    String cnName = (String) request.getSession().getAttribute("name");
    Optional<PhoenixUser> optional = loginService.exists(momoid);
    //不存在需要新增加
    if (!optional.isPresent()) {
      phoenixUserService.save(momoid, cnName, enName);
    }else {
      phoenixUserService.updateLastTime(momoid);
    }
    Optional<Login> optionalLogin = loginService.getLogin(momoid);
    if (optionalLogin.isPresent()) {
      session.setAttribute("login", optionalLogin.get());
    }
    logger.info("login -- " + JsonUtils.toJSON(optionalLogin.get()));
    
    
  }
  
  /*
  * 退出
  */
  @RequestMapping("/logout")
  public String out(HttpServletRequest request, ModelMap model) {
    HttpSession session = request.getSession();
    String token = (String) session.getAttribute("token");
    session.removeAttribute("token");
    session.removeAttribute("functionMap");
    return "redirect:https://aegis.immomo.com/sso/logout/" + AuthenticationFilter.getAppKey()
        + "?token=" + token;
  }
  
  
}
  



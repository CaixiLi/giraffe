package com.li.giraffe.controller.system;

import com.li.giraffe.model.user.User;
import com.li.giraffe.service.user.IUsersService;
import com.li.giraffe.util.ResponseEntity;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
  private Logger logger = Logger.getLogger(UserController.class);
 @Autowired
 private IUsersService usersService;

  @RequestMapping("/system/user")
  public void user(HttpServletRequest request,ModelMap model){

    List<User> list=usersService.queryList();
    model.put("list",list);
  }
  @RequestMapping("/system/role")
  public void role(HttpServletRequest request,ModelMap model){
    logger.info("进入用户列表");
    System.out.println("测试");
    List<User> list=usersService.queryList();
    model.put("list",list);
  }

  @RequestMapping("/system/saveUser")
  @ResponseBody
  public ResponseEntity saveUser(HttpServletRequest request,ModelMap model,String name,String sex,String age){
    System.out.println("name:"+name);
    System.out.println("sex:"+sex);
    System.out.println("age:"+age);
    usersService.insert(name,sex,age);
    return ResponseEntity.OK;
  }

  @RequestMapping("/system/updateUser")
  @ResponseBody
  public ResponseEntity updateUser(HttpServletRequest request,ModelMap model,String name,String sex,String age,String id){
    System.out.println("name:"+name);
    System.out.println("sex:"+sex);
    System.out.println("age:"+age);
    usersService.update(name,sex,age,id);
    return ResponseEntity.OK;
  }



}

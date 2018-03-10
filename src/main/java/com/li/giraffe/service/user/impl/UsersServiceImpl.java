package com.li.giraffe.service.user.impl;

import com.alibaba.fastjson.JSON;
import com.li.giraffe.controller.login.LoginController;
import com.li.giraffe.dao.IUserDao;
import com.li.giraffe.model.user.User;
import com.li.giraffe.service.user.IUsersService;
import java.util.List;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements IUsersService {
  private Logger logger = Logger.getLogger(UsersServiceImpl.class);
  @Resource
  private IUserDao userDao;
  public List<User> queryList() {
    return userDao.queryList();
  }

  public boolean insert(String name, String sex, String age) {
    User user=buildUser(name,sex,age);
    userDao.insert(user);
    return true;
  }

  public boolean update(String name, String sex, String age, String id) {
    User user=buildUpdateUser(name,sex,age,id);
    userDao.update(user);
    return true;
  }

  private User buildUser(String name, String sex, String age){
    User user =new User();
    user.setName(name);
    int ageInt=Integer.parseInt(age);
    user.setAge(ageInt);
    user.setSex(sex);
    return user;
  }
  private User buildUpdateUser(String name, String sex, String age,String id){
    User user =new User();
    user.setName(name);
    int ageInt=Integer.parseInt(age);
    user.setAge(ageInt);
    user.setSex(sex);
    int idInt=Integer.parseInt(id);
    user.setId(idInt);
    return user;
  }
}

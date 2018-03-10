package com.li.giraffe.dao;

import com.li.giraffe.model.user.User;
import java.util.List;

public interface IUserDao {

  boolean insert(User user);
  boolean update(User user);

  /**
   * 查询所有用户信息
   * @return
   */
  List<User> queryList();


}

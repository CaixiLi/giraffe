package com.li.giraffe.service.user;

import com.li.giraffe.model.user.User;
import java.util.List;

public interface IUsersService {

  List<User> queryList();

  boolean insert(String name,String sex,String age);

  boolean update(String name,String sex,String age,String id);


}

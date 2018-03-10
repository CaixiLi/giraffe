package com.li.giraffe.dao.impl;


import com.li.giraffe.dao.IUserDao;
import com.li.giraffe.model.user.User;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements IUserDao{


  @Resource
  private JdbcTemplate jdbcTemplate;

  private static final String COLUMNS="name,sex,age";
  private static final String ALL_COLUMNS="id,"+COLUMNS+",create_time,update_time";


  public boolean insert(User user) {
    final String sql = "insert into users(" + COLUMNS + ") values (?, ?, ?) ";
    int update = jdbcTemplate.update(sql, user.getName(),user.getSex(),user.getAge());
    return update == 1;

  }
  public boolean update(User user) {
    final String sql = "update users set name = ?,sex=?,age=?  where id =?";
    int update = jdbcTemplate.update(sql, user.getName(),user.getSex(),user.getAge(),user.getId());
    return update == 1;

  }

  public List<User> queryList() {
    final String sql = "select " + ALL_COLUMNS + " from users";
    return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class));
  }
}

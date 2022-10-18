package com.leotita.server.service.impl;

import com.leotita.server.dao.dataobject.UserDO;
import com.leotita.server.dao.mapper.UserMapper;
import com.leotita.server.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author jftang
 * @date 2022/10/18 13:40
 **/
@Slf4j
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    @Override
    public List<UserDO> selectUser() {
      List<UserDO> userList = userMapper.selectUser();
      log.info("userList : {}", userList);
      return userList;
    }
}

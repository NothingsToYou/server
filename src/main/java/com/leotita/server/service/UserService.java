package com.leotita.server.service;

import com.leotita.server.dao.dataobject.UserDO;

import java.util.List;

/**
 * @author jftang
 * @date 2022/10/18 13:39
 **/
public interface UserService {

    List<UserDO> selectUser();
}

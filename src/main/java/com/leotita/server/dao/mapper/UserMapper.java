package com.leotita.server.dao.mapper;

import com.leotita.server.dao.dataobject.UserDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author jftang
 * @date 2022/10/18 13:32
 **/
@Mapper
public interface UserMapper {

    @Select("select id,account from t_user")
    List<UserDO> selectUser();
}

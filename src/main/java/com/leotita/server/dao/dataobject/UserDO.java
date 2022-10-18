package com.leotita.server.dao.dataobject;

import lombok.Data;

/**
 * @author jftang
 * @date 2022/10/18 16:39
 **/
@Data
public class UserDO {
    /**
     * 用户Id
     */
    private Long id;
    /**
     * 用户名
     */
    private String account;
}

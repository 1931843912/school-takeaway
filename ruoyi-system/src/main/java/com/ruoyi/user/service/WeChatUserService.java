package com.ruoyi.user.service;


import com.ruoyi.user.entity.dto.UserLoginDTO;
import com.ruoyi.user.entity.po.User;

public interface WeChatUserService {

    /**
     * 微信登录
     * @param userLoginDTO
     * @return
     */
    User wxLogin(UserLoginDTO userLoginDTO);
}

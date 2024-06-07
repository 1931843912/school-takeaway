package com.ruoyi.web.controller.user;


import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.service_user.UserService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 用户信息表
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 11:04:10
 */
@RestController
@RequestMapping("commodity/sysuser")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    public R info(@PathVariable("userId") Long userId){
		SysUserEntity sysUser = userService.getById(userId);

        return R.ok().put("sysUser", sysUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysUserEntity sysUser){
		userService.save(sysUser);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysUserEntity sysUser){
		userService.updateById(sysUser);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] userIds){
		userService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}

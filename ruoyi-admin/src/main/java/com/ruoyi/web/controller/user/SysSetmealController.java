package com.ruoyi.web.controller.user;


import com.ruoyi.web.entity_user.SysSetmealEntity;
import com.ruoyi.web.service_user.SysSetmealService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 套餐
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@RestController
@RequestMapping("user/setmeal")
public class SysSetmealController {
    @Autowired
    private SysSetmealService sysSetmealService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysSetmealService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysSetmealEntity sysSetmeal = sysSetmealService.getById(id);

        return R.ok().put("sysSetmeal", sysSetmeal);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysSetmealEntity sysSetmeal){
		sysSetmealService.save(sysSetmeal);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysSetmealEntity sysSetmeal){
		sysSetmealService.updateById(sysSetmeal);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysSetmealService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

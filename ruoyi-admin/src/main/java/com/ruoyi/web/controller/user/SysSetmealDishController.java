package com.ruoyi.web.controller.user;


import com.ruoyi.web.entity_user.SysSetmealDishEntity;
import com.ruoyi.web.service_user.SysSetmealDishService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 套餐菜品关系
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@RestController
@RequestMapping("commodity/syssetmealdish")
public class SysSetmealDishController {
    @Autowired
    private SysSetmealDishService sysSetmealDishService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysSetmealDishService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysSetmealDishEntity sysSetmealDish = sysSetmealDishService.getById(id);

        return R.ok().put("sysSetmealDish", sysSetmealDish);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysSetmealDishEntity sysSetmealDish){
		sysSetmealDishService.save(sysSetmealDish);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysSetmealDishEntity sysSetmealDish){
		sysSetmealDishService.updateById(sysSetmealDish);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysSetmealDishService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

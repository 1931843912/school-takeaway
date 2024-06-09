package com.ruoyi.web.controller.user;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.web.entity_user.SysDishEntity;
import com.ruoyi.web.entity_user.vo.DishVO;
import com.ruoyi.web.service_user.SysDishService;
import com.ruoyi.web.service_user.SysSetmealDishService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 菜品
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@RestController
@RequestMapping("user/setmeal/dish")
public class SysDishController {
    @Autowired
    private SysDishService sysDishService;
    @Autowired
    private SysSetmealDishService sysSetmealDishService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysDishService.queryPage(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @GetMapping("/{id}")
    public R info(@PathVariable("id") Long id){
        List<DishVO> dishByIdList = sysDishService.getDishByIdList(id);
        return R.ok().put("data", dishByIdList);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysDishEntity sysDish){
		sysDishService.save(sysDish);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysDishEntity sysDish){
		sysDishService.updateById(sysDish);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysDishService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

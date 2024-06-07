package com.ruoyi.web.controller.user;


import com.ruoyi.web.entity_user.SysCategoryEntity;
import com.ruoyi.web.service_user.SysCategoryService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 菜品及套餐分类
 *
 * @author Franklin
 * @email 2657970023@qq.com
 * @date 2024-06-07 10:57:43
 */
@RestController
@RequestMapping("/user/category")
public class SysCategoryController {
    @Autowired
    private SysCategoryService sysCategoryService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysCategoryService.queryPage(params);
        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		SysCategoryEntity sysCategory = sysCategoryService.getById(id);
        return R.ok().put("sysCategory", sysCategory);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysCategoryEntity sysCategory){
		sysCategoryService.save(sysCategory);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysCategoryEntity sysCategory){
		sysCategoryService.updateById(sysCategory);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		sysCategoryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}

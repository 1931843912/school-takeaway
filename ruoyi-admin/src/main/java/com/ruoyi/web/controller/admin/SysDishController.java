package com.ruoyi.web.controller.admin;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.common.core.result.Result;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.web.entity_admin.dto.DishDTO;

import com.ruoyi.web.entity_admin.dto.DishPageQueryDTO;
import com.ruoyi.web.service_admin.SysDishService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 菜品管理
 */
@RestController
@RequestMapping("/admin/dish")
public class SysDishController extends BaseController {

    @Autowired
    private SysDishService sysDishService;

    @PostMapping
    @Log(title = "菜品及口味", businessType = BusinessType.INSERT)
    @ApiOperation("新增菜品")
    public Result save(@RequestBody DishDTO dishDTO){
        logger.info("新增菜品",dishDTO);
        sysDishService.insertSysDishWithFlavor(dishDTO);
        return  Result.success();
    }

    @GetMapping("/page")
    @ApiOperation("菜品分页查询")
    public Result<PageResult> page(DishPageQueryDTO dishPageQueryDTO){
        logger.info("菜品分页查询",dishPageQueryDTO);
        PageResult result  = sysDishService.pageQuery(dishPageQueryDTO);
        return Result.success(result);
    }
}

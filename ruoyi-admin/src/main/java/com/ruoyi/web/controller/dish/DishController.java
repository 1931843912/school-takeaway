package com.ruoyi.web.controller.dish;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.common.core.result.Result;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.dish.domin.DishEntity;
import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.dto.DishPageQueryDTO;
import com.ruoyi.dish.domin.entity.Dish;
import com.ruoyi.dish.domin.vo.DishVo;
import com.ruoyi.dish.service.DishService;

import io.swagger.annotations.ApiOperation;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜品管理
 */


@RestController
@RequestMapping("/admin/dish")
public class DishController extends BaseController {
    @Autowired
    private DishService dishService;

    @PostMapping
    @Log(title = "菜品及口味", businessType = BusinessType.INSERT)
    @ApiOperation("新增菜品")
    public AjaxResult save(@RequestBody DishDTO dishDTO) {
        logger.info("新增菜品", dishDTO);
        try {
            dishService.insertSysDishWithFlavor(dishDTO);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return AjaxResult.success();
    }


    // @PostMapping("/status/{status}")// 使用POST方法，并接收路径参数status
    // @Log(title = "更新菜品出售状态", businessType = BusinessType.UPDATE)
    // @ApiOperation("更新菜品出售状态")
    // public Result changeStatusById(@PathVariable("status") Integer status,//使用@PathVariable获取路径参数
    //                                @RequestParam("id") Long id) {
    //     //使用@RequestParam获取查询参数
    //     logger.info("更新菜品出售状态，ID:},状态：{}", id, status);
    //     dishService.changeStatusById(id, status);//假设服务层方法接受id和status作为参数
    //     return Result.success();
    // }

    // @GetMapping("/page")
    // @ApiOperation("菜品分页查询")
    // public Result<PageResult> page(DishPageQueryDTO dishPageQueryDTO) {
    //     logger.info("菜品分页查询", dishPageQueryDTO);
    //     PageResult result = dishService.pageQuery(dishPageQueryDTO);
    //     return Result.success(result);
    // }

    /**
     * 查询菜品列表
     */
    @GetMapping("/list")
    public TableDataInfo list(DishVo dish)
    {
        startPage();
        List<DishVo> list = dishService.selectDishList(dish);
        return getDataTable(list);
    }


    @GetMapping("/dishFlavors/{id}")
    @ApiOperation("根据菜品id获得菜品口味")
    public AjaxResult getDishWithFlavorById(@PathVariable Long id) {
        logger.info("根据菜品id获得菜品口味:", id);
        return success(dishService.getDishWithFlavorById(id));
    }

    /**
     * 获取菜品详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(dishService.selectDishById(id));
    }

    // @GetMapping("/list/{id}")   //假设id是URL路径的分
    // @ApiOperation("根据分类ID获取菜品列表")
    // public Result getDishByCategoryId(@PathVariable Long id) {
    //     logger.info("根据分类ID[}]获取菜品列表", id);
    //     List<DishEntity> dishes = dishService.getDishByCategoryId(id);
    //     //假设Result是一个工具类，用于构建响应结果
    //     //这里使用Result.success()方法将菜品列表封装为Result对象并返▣
    //     return Result.success(dishes);
    // }

    @PutMapping
    @Log(title = "修改菜品及口味")
    @ApiOperation("修改菜品")
    public AjaxResult updateDishWithFlavor(@RequestBody DishDTO dishDTO) {
        logger.info("修改菜品", dishDTO);
        dishService.updateDishWithFlavor(dishDTO);
        return AjaxResult.success();
    }

    /**
     * 删除菜品
     */
    @PreAuthorize("@ss.hasPermi('system:dish:remove')")
    @Log(title = "菜品", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dishService.deleteDishByIds(ids));
    }
}
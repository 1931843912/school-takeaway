package com.ruoyi.web.controller.category;

import java.util.List;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.Category;
import com.ruoyi.category.service.CategoryService;
import com.ruoyi.common.enums.BusinessType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜品及套餐分类Controller
 */
@RestController
@RequestMapping("/merchant/category")
public class CategoryController extends BaseController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询菜品及套餐分类列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:category:list')")
    @GetMapping("/list")
    public TableDataInfo list() {
        startPage();
        List<Category> list = categoryService.selectSysCategoryList();
        return getDataTable(list);
    }
    /**
     * 根据id获取菜品及套餐分类信息
     */
    @PreAuthorize("@ss.hasPermi('system:category:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(categoryService.selectSysCategoryByUserId(userId));
    }
    /**
     * 新增菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:add')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Category category)
    {
        return toAjax(categoryService.insertSysCategory(category));
    }

    /**
     * 修改菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:edit')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Category category)
    {
        return toAjax(categoryService.updateSysCategory(category));
    }

    /**
     * 删除菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:remove')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(categoryService.deleteSysCategoryByIds(ids));
    }
}
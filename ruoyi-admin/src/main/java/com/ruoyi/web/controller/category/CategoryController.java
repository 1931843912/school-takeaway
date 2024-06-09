package com.ruoyi.web.controller.category;

import java.util.List;

import com.ruoyi.common.core.domain.entity.Category;
import com.ruoyi.category.service.CategoryService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜品及套餐分类Controller
 */
@RestController
@RequestMapping("/merchant/category")
public class CategoryController extends BaseController {
    @Autowired
    private CategoryService CategoryService;

    /**
     * 查询菜品及套餐分类列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:category:list')")
    @GetMapping("/list")
    public TableDataInfo list() {
        startPage();
        List<Category> list = CategoryService.selectSysCategoryList();
        return getDataTable(list);
    }
}
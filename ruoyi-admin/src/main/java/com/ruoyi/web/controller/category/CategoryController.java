package com.ruoyi.web.controller.category;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.category.domain.entity.Category;
import com.ruoyi.category.service.CategoryService;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜品及套餐分类Controller
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@RestController
@RequestMapping("/admin/category")
public class CategoryController extends BaseController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询菜品及套餐分类列表
     */
    @PreAuthorize("@ss.hasPermi('admin:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(Category category) {
        startPage();
        System.out.println(category);
        //创建人
        category.setCreateUser(SecurityUtils.getUserId());
        List<Category> list = categoryService.selectCategoryList(category);
        return getDataTable(list);
    }
    /**
     * 查询菜品分类列表
     */
    @PreAuthorize("@ss.hasPermi('admin:category:list')")
    @GetMapping("/list1")
    public TableDataInfo listTypeOne() {
        startPage();
        Category category = new Category();
        category.setType((long) 1);
        List<Category> list = categoryService.selectCategoryList(category);
        return getDataTable(list);
    }

    /**
     * 导出菜品及套餐分类列表
     */
    @PreAuthorize("@ss.hasPermi('admin:category:export')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Category category) {
        List<Category> list = categoryService.selectCategoryList(category);
        ExcelUtil<Category> util = new ExcelUtil<Category>(Category.class);
        util.exportExcel(response, list, "菜品及套餐分类数据");
    }

    /**
     * 获取菜品及套餐分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('admin:category:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(categoryService.selectCategoryById(id));
    }

    /**
     * 新增菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('admin:category:add')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Category category) {
        return toAjax(categoryService.insertCategory(category));
    }

    /**
     * 修改菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('admin:category:edit')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Category category) {
        if(categoryService.categoryUsed(category)){
            return warn("当前分类正在使用中,无法停用");
        }
        return toAjax(categoryService.updateCategory(category));
    }

    /**
     * 删除菜品及套餐分类
     */
    @PreAuthorize("@ss.hasPermi('admin:category:remove')")
    @Log(title = "菜品及套餐分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        if(categoryService.categorysUsed(ids)){
            return warn("当前分类中存在正在使用的分类,请先更换后再删除");
        }
        return toAjax(categoryService.deleteCategoryByIds(ids));
    }
}
package com.ruoyi.web.controller.setmeal;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.category.domain.entity.Category;
import com.ruoyi.setmeal.domain.dto.SetmealDTO;
import com.ruoyi.setmeal.domain.entity.Setmeal;
import com.ruoyi.setmeal.service.ISetmealService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 套餐Controller
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@RestController
@RequestMapping("/admin/setmeal")
public class SetmealController extends BaseController {
    @Autowired
    private ISetmealService setmealService;

    /**
     * 查询套餐列表
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:list')")
    @GetMapping("/list")
    public TableDataInfo list(Setmeal setmeal) {
        startPage();
        List<Setmeal> list = setmealService.selectSetmealList(setmeal);
        return getDataTable(list);
    }

    /**
     * 查询套餐分类列表
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:categorylist')")
    @GetMapping("/categorylist")
    public TableDataInfo categoryList() {
        startPage();
        List<Category> list = setmealService.categoryList();
        return getDataTable(list);
    }


    /**
     * 查询套餐列表
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:dishlist')")
    @GetMapping("/dishlist")
    public TableDataInfo dishList() {
        startPage();
        List<Setmeal> list = setmealService.selectDishList();
        return getDataTable(list);
    }


    /**
     * 导出套餐列表
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:export')")
    @Log(title = "套餐", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Setmeal setmeal) {
        List<Setmeal> list = setmealService.selectSetmealList(setmeal);
        ExcelUtil<Setmeal> util = new ExcelUtil<Setmeal>(Setmeal.class);
        util.exportExcel(response, list, "套餐数据");
    }

    /**
     * 获取套餐详细信息
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(setmealService.selectSetmealById(id));
    }

    /**
     * 新增套餐
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:add')")
    @Log(title = "套餐", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SetmealDTO setmeal) {
        return toAjax(setmealService.insertSetmeal(setmeal));
    }

    /**
     * 修改套餐
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:edit')")
    @Log(title = "套餐", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SetmealDTO setmeal) {
        return toAjax(setmealService.updateSetmeal(setmeal));
    }

    /**
     * 套餐状态修改
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:changeSetmealStatus')")
    @PutMapping("/changeSetmealStatus")
    public AjaxResult changeSetmealStatus(@RequestBody Setmeal setmeal) {
        return toAjax(setmealService.changeSetmealStatus(setmeal));
    }


    /**
     * 删除套餐
     */
    @PreAuthorize("@ss.hasPermi('admin:setmeal:remove')")
    @Log(title = "套餐", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        if(setmealService.checkSetmealStatus(ids)){
            return warn("当时需要删除的套餐中存在未停用的套餐,请先停用套餐后再删除");
        }
        return toAjax(setmealService.deleteSetmealByIds(ids));
    }
}
package com.ruoyi.web.controller.setmeal;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.setmeal.domain.entity.Setmeal;
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
import com.ruoyi.system.service.ISetmealService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 套餐Controller
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@RestController
@RequestMapping("/merchant/setmeal")
public class SetmealController extends BaseController {
    @Autowired
    private ISetmealService setmealService;

    /**
     * 查询套餐列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:list')")
    @GetMapping("/list")
    public TableDataInfo list(Setmeal setmeal) {
        startPage();
        List<Setmeal> list = setmealService.selectSetmealList(setmeal);
        return getDataTable(list);
    }

    /**
     * 查询套餐列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:dishlist')")
    @GetMapping("/dishlist")
    public TableDataInfo dishList() {
        startPage();
        List<Setmeal> list = setmealService.selectDishList();
        return getDataTable(list);
    }

    /**
     * 导出套餐列表
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:export')")
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
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(setmealService.selectSetmealById(id));
    }

    /**
     * 新增套餐
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:add')")
    @Log(title = "套餐", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Setmeal setmeal) {
        return toAjax(setmealService.insertSetmeal(setmeal));
    }

    /**
     * 修改套餐
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:edit')")
    @Log(title = "套餐", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Setmeal setmeal) {
        return toAjax(setmealService.updateSetmeal(setmeal));
    }

    /**
     * 套餐状态修改
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:changeSetmealStatus')")
    @PutMapping("/changeSetmealStatus")
    public AjaxResult changeSetmealStatus(@RequestBody Setmeal setmeal) {
        return toAjax(setmealService.changeSetmealStatus(setmeal));
    }


    /**
     * 删除套餐
     */
    @PreAuthorize("@ss.hasPermi('merchant:setmeal:remove')")
    @Log(title = "套餐", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(setmealService.deleteSetmealByIds(ids));
    }
}
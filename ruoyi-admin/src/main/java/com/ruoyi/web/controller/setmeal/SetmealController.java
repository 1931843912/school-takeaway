package com.ruoyi.web.controller.setmeal;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.poi.ExcelUtil;
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
}

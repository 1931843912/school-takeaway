package com.ruoyi.web.controller.user;


import com.ruoyi.user.entity.constant.StatusConstant;
import com.ruoyi.user.entity.po.Setmeal;
import com.ruoyi.user.entity.vo.DishItemVO;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.UserSetmealService;
import com.ruoyi.web.service_user.SysSetmealService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController("userSetmealController")
@RequestMapping("/user/setmeal")
@Api(tags = "C端-套餐浏览接口")
public class UserSetmealController {
    @Autowired
    private UserSetmealService userSetmealService;

//    /**
//     * 条件查询
//     *
//     * @param categoryId
//     * @return
//     */
//    @GetMapping("/list")
//    @ApiOperation("根据分类id查询套餐")
//    @Cacheable(cacheNames = "setmealCache",key = "#categoryId") //key: setmealCache::100
//    public Result<List<Setmeal>> list(Long categoryId) {
//        Setmeal setmeal = new Setmeal();
//        setmeal.setCategoryId(categoryId);
//        setmeal.setStatus(StatusConstant.ENABLE);
//
//        List<Setmeal> list = userSetmealService.list(setmeal);
//        return Result.success(list);
//    }

    @Autowired
    private SysSetmealService sysSetmealService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysSetmealService.queryPage(params);

        return R.ok().put("data", page);
    }
    /**
     * 根据套餐id查询包含的菜品列表
     *
     * @param id
     * @return
     */
    @GetMapping("/dish/{id}")
    @ApiOperation("根据套餐id查询包含的菜品列表")
    public Result<List<DishItemVO>> dishList(@PathVariable("id") Long id) {
        List<DishItemVO> list = userSetmealService.getDishItemById(id);
        return Result.success(list);
    }
}

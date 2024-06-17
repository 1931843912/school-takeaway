package com.ruoyi.web.controller.user;


import com.ruoyi.user.entity.constant.StatusConstant;
import com.ruoyi.user.entity.po.Dish;
import com.ruoyi.user.entity.po.Setmeal;
import com.ruoyi.user.entity.vo.DishItemVO;
import com.ruoyi.user.entity.vo.SetmealVO;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.UserSetmealService;
import com.ruoyi.web.entity_user.SysSetmealEntity;
import com.ruoyi.web.service_user.SysSetmealService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController("userSetmealController")
@RequestMapping("/user/setmeal")
@Api(tags = "C端-套餐浏览接口")
public class UserSetmealController {
    @Autowired
    private UserSetmealService userSetmealService;
    @Resource
    private RedisTemplate redisTemplate;
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

    // public R list(@RequestParam Map<String, Object> params){
    //     PageUtils page = sysSetmealService.queryPage(params);
    //     return R.ok().put("data", page);
    // }

    /**
     * 列表
     */
    @GetMapping("/list")
    public Result<List<SetmealVO>> list(Long categoryId){
        //构造redis中的key，规则：setmeal_分类id
        String key = "setmeal_" + categoryId;
        //查询redis中是否存在菜品数据
        List<SetmealVO> list = (List<SetmealVO>) redisTemplate.opsForValue().get(key);
        if(list != null && list.size() > 0){
            //如果存在，直接返回，无须查询数据库
            return Result.success(list);
        }
        Setmeal setmeal = new Setmeal();
        setmeal.setCategoryId(categoryId);
        setmeal.setStatus(StatusConstant.ENABLE);//查询起售中的菜品
        //如果不存在，查询数据库，将查询到的数据放入redis中
        list = userSetmealService.listSetmeals(setmeal);
        redisTemplate.opsForValue().set(key, list);

        return  Result.success(list);
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

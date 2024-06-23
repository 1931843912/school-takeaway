package com.ruoyi.web.controller.user;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.user.entity.dto.ShoppingCartDTO;
import com.ruoyi.user.entity.po.ShoppingCart;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.UserShoppingCartService;
import com.ruoyi.web.entity_user.SysUserEntity;
import com.ruoyi.web.service_user.UserService;
import com.ruoyi.web.utils_user.CopyTools;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购物车Controller
 *
 * @author xiaozhu
 * @date 2024-06-21
 */
@RestController
@RequestMapping("/user/shoppingCart")
public class ShoppingCartController extends BaseController {
    @Autowired
    private UserShoppingCartService shoppingCartService;
    @Autowired
    private UserService userService;
    /**
     * 查询购物车列表
     */
//    @GetMapping("/list")
//    public TableDataInfo list() {
//        startPage();
//        List<ShoppingCart> list = shoppingCartService.showShoppingCart();
//        return getDataTable(list);
//    }
    @GetMapping("/list")
    public Result list() {
        startPage();
        List<ShoppingCart> list = shoppingCartService.showShoppingCart();
        return Result.success(list);
    }

    // /**
    //  * 获取购物车详细信息
    //  */
    // @GetMapping(value = "/{id}")
    // public AjaxResult getInfo(@PathVariable("id") int id) {
    //     return success(shoppingCartService.(id));
    // }

    /**
     * 新增购物车
     */
//    @PostMapping("/add")
//    public AjaxResult add(@RequestBody ShoppingCartDTO shoppingCartDTO) {
//        // System.out.println(shoppingCart)
//        return toAjax(shoppingCartService.addShoppingCart(shoppingCartDTO));
//    }

    @PostMapping("/add")
    public AjaxResult addShoppingCar(String openid , @RequestBody ShoppingCartDTO shoppingCartDTO) {
        ShoppingCart cart = CopyTools.copy(shoppingCartDTO, ShoppingCart.class);
        cart.setUserId(Long.getLong(openid));
        Long userId = userService.getUserId(openid);
        cart.setUserId(userId);
        System.out.println(cart.getUserId());
        return toAjax(shoppingCartService.addShoppingCart(cart));
    }


    // /**
    //  * 修改购物车
    //  */
    // @Log(title = "购物车", businessType = BusinessType.UPDATE)
    // @PutMapping
    // public AjaxResult edit(@RequestBody ShoppingCart shoppingCart) {
    //     return toAjax(shoppingCartService.updateShoppingCart(shoppingCart));
    // }

    /**
     * 删除购物车
     */
    @PostMapping("/sub")
    public AjaxResult remove(@RequestBody ShoppingCartDTO shoppingCartDTO) {
        return toAjax(shoppingCartService.subShoppingCart(shoppingCartDTO));
    }

}

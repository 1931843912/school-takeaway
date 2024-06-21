package com.ruoyi.web.controller.user;

import java.util.List;

import com.ruoyi.user.entity.dto.ShoppingCartDTO;
import com.ruoyi.user.entity.po.ShoppingCart;
import com.ruoyi.user.service.UserShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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

    /**
     * 查询购物车列表
     */
    @GetMapping("/list")
    public TableDataInfo list() {
        startPage();
        List<ShoppingCart> list = shoppingCartService.showShoppingCart();
        return getDataTable(list);
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
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ShoppingCartDTO shoppingCartDTO) {
        // System.out.println(shoppingCart)
        return toAjax(shoppingCartService.addShoppingCart(shoppingCartDTO));
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

package com.ruoyi.user.service;


import com.ruoyi.user.entity.dto.ShoppingCartDTO;
import com.ruoyi.user.entity.po.ShoppingCart;

import java.util.List;

public interface UserShoppingCartService {

    /**
     * 添加购物车
     * @param shoppingCartDTO
     */
    int addShoppingCart(ShoppingCartDTO shoppingCartDTO);

    /**
     * 查看购物车
     * @return
     */
    List<ShoppingCart> showShoppingCart();

    /**
     * 清空购物车
     */
    void cleanShoppingCart();

    /**
     * 删除购物车中一个商品
     * @param shoppingCartDTO
     */
    int subShoppingCart(ShoppingCartDTO shoppingCartDTO);
}

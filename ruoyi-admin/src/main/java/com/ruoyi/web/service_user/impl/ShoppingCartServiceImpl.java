package com.ruoyi.web.service_user.impl;

import java.util.List;

import com.ruoyi.user.entity.po.ShoppingCart;
import com.ruoyi.user.mapper.ShoppingCartMapper;
import com.ruoyi.web.service_user.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 购物车Service业务层处理
 *
 * @author xiaozhu
 * @date 2024-06-21
 */
@Service
public class ShoppingCartServiceImpl implements IShoppingCartService {
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    /**
     * 查询购物车
     *
     * @param id 购物车主键
     * @return 购物车
     */
    @Override
    public ShoppingCart selectShoppingCartById(int id) {
        return shoppingCartMapper.selectShoppingCartById(id);
    }

    /**
     * 查询购物车列表
     *
     * @param shoppingCart 购物车
     * @return 购物车
     */
    @Override
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart) {
        return shoppingCartMapper.selectShoppingCartList(shoppingCart);
    }

    /**
     * 新增购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    public int insertShoppingCart(ShoppingCart shoppingCart) {
        // shoppingCart.setCreateTime(DateUtils.getNowDate());
        return shoppingCartMapper.insertShoppingCart(shoppingCart);
    }

    /**
     * 修改购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    public int updateShoppingCart(ShoppingCart shoppingCart) {
        return shoppingCartMapper.updateShoppingCart(shoppingCart);
    }

    /**
     * 批量删除购物车
     *
     * @param ids 需要删除的购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartByIds(int[] ids) {
        return shoppingCartMapper.deleteShoppingCartByIds(ids);
    }

    /**
     * 删除购物车信息
     *
     * @param id 购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartById(int id) {
        return shoppingCartMapper.deleteShoppingCartById(id);
    }
}

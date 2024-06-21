package com.ruoyi.user.mapper;

import com.ruoyi.user.entity.po.ShoppingCart;

import java.util.List;

/**
 * 购物车Mapper接口
 *
 * @author xiaozhu
 * @date 2024-06-21
 */
public interface ShoppingCartMapper {
    /**
     * 查询购物车
     *
     * @param id 购物车主键
     * @return 购物车
     */
    public ShoppingCart selectShoppingCartById(int id);

    /**
     * 查询购物车列表
     *
     * @param shoppingCart 购物车
     * @return 购物车集合
     */
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart);

    /**
     * 新增购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int insertShoppingCart(ShoppingCart shoppingCart);

    /**
     * 修改购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int updateShoppingCart(ShoppingCart shoppingCart);

    /**
     * 删除购物车
     *
     * @param id 购物车主键
     * @return 结果
     */
    public int deleteShoppingCartById(int id);

    /**
     * 批量删除购物车
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteShoppingCartByIds(int[] ids);
}

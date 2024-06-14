package com.ruoyi.system.service;

import com.ruoyi.setmeal.domain.entity.Setmeal;
import java.util.List;

/**
 * 套餐Service接口
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
public interface ISetmealService {
    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    public Setmeal selectSetmealById(Long id);

    /**
     * 查询套餐列表
     *
     * @param setmeal 套餐
     * @return 套餐集合
     */
    public List<Setmeal> selectSetmealList(Setmeal setmeal);

    /**
     * 新增套餐
     *
     * @param setmeal 套餐
     * @return 结果
     */
    public int insertSetmeal(Setmeal setmeal);

    /**
     * 修改套餐
     *
     * @param setmeal 套餐
     * @return 结果
     */
    public int updateSetmeal(Setmeal setmeal);

    /**
     * 批量删除套餐
     *
     * @param ids 需要删除的套餐主键集合
     * @return 结果
     */
    public int deleteSetmealByIds(Long[] ids);

    /**
     * 删除套餐信息
     *
     * @param id 套餐主键
     * @return 结果
     */
    public int deleteSetmealById(Long id);

    int changeSetmealStatus(Setmeal setmeal);
}
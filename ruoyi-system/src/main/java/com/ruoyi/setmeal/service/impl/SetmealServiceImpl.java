package com.ruoyi.setmeal.service.impl;

import java.util.Arrays;
import java.util.List;

import com.ruoyi.category.domain.entity.Category;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.dish.domin.dto.DishEditDTO;
import com.ruoyi.dish.mapper.DishTMapper;
import com.ruoyi.setmeal.domain.dto.SetmealDTO;
import com.ruoyi.setmeal.domain.entity.Setmeal;
import com.ruoyi.setmeal.domain.entity.SetmealDish;
import com.ruoyi.setmeal.mapper.SetmealMapper;
import com.ruoyi.setmeal.service.ISetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 套餐Service业务层处理
 *
 * @author xiaozhu
 * @date 2024-06-14
 */
@Service
public class SetmealServiceImpl implements ISetmealService {
    @Autowired
    private SetmealMapper setmealMapper;
    @Autowired
    private DishTMapper dishTMapper;

    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    @Override
    public SetmealDTO selectSetmealById(Long id) {
        //查询套餐基本属性
        SetmealDTO setmealDTO = setmealMapper.selectSetmealById(id);
        //查询套餐关联的菜品
        List<Long> dishIds = setmealMapper.selectSetmealDishById(id);
        setmealDTO.setDishItems(dishIds.toArray(new Long[0]));
        return setmealDTO;
    }

    /**
     * 查询套餐列表
     *
     * @param setmeal 套餐
     * @return 套餐
     */
    @Override
    public List<Setmeal> selectSetmealList(Setmeal setmeal) {
        return setmealMapper.selectSetmealList(setmeal);
    }

    /**
     * 新增套餐
     */
    @Override
    public int insertSetmeal(SetmealDTO setmeal) {
        //创建人
        Long userId = SecurityUtils.getUserId();
        setmeal.setCreateUser(userId);
        setmeal.setUserId(userId);
        //菜品id
        Long[] dishItems = setmeal.getDishItems();
        int i1 = setmealMapper.insertSetmeal(setmeal);
        //添加菜品关联
        for (long i : dishItems) {
            //查询菜品
            DishEditDTO dishEditDTO = dishTMapper.selectDishById(i);
            //用于插入数据表的结构
            SetmealDish setmealDish = new SetmealDish();
            setmealDish.setSetmealId(setmeal.getId());//套餐主键
            setmealDish.setDishId((long) i);//菜品主键
            setmealDish.setPrice(dishEditDTO.getPrice());//价格
            setmealDish.setCopies(1L);//份数
            setmealMapper.insertSetmealDish(setmealDish);
        }
        return i1;
    }

    /**
     * 修改套餐
     *
     * @param setmeal 套餐
     * @return 结果
     */
    @Override
    public int updateSetmeal(SetmealDTO setmeal) {
        //菜品id
        Long[] dishItems = setmeal.getDishItems();
        int i1 = setmealMapper.updateSetmeal(setmeal);
        //先删后加
        setmealMapper.deleteSetmealDishs(setmeal.getId());
        //添加菜品关联
        for (long i : dishItems) {
            //用于插入数据表的结构
            SetmealDish setmealDish = new SetmealDish();
            setmealDish.setSetmealId(setmeal.getId());//套餐主键
            setmealDish.setDishId(i);//菜品主键
            setmealDish.setPrice(setmeal.getPrice());//价格
            setmealDish.setCopies(1L);//份数
            setmealMapper.insertSetmealDish(setmealDish);
        }
        return i1;
    }

    /**
     * 批量删除套餐
     *
     * @param ids 需要删除的套餐主键
     * @return 结果
     */
    @Override
    public int deleteSetmealByIds(Long[] ids) {
        return setmealMapper.deleteSetmealByIds(ids);
    }

    /**
     * 删除套餐信息
     *
     * @param id 套餐主键
     * @return 结果
     */
    @Override
    public int deleteSetmealById(Long id) {
        return setmealMapper.deleteSetmealById(id);
    }

    @Override
    public int changeSetmealStatus(Setmeal setmeal) {
        //修改者
        setmeal.setUpdateUser(SecurityUtils.getUserId());
        //修改时间
        setmeal.setUpdateTime(DateUtils.getNowDate());
        //状态反转
        Long status = setmeal.getStatus();
        if (status == 0) {
            status = 1L;
        } else {
            status = 0L;
        }
        setmeal.setStatus(status);
        // return setmealMapper.updateSetmeal(setmeal);
        return 1;
    }

    @Override
    public List<Setmeal> selectDishList() {
        return setmealMapper.selectDishList(SecurityUtils.getUserId());
    }

    @Override
    public List<Category> categoryList() {
        return setmealMapper.categoryList(SecurityUtils.getUserId());
    }
}
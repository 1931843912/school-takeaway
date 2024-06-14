package com.ruoyi.setmeal.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.setmeal.domain.entity.Setmeal;
import com.ruoyi.setmeal.mapper.SetmealMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.service.ISetmealService;

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

    /**
     * 查询套餐
     *
     * @param id 套餐主键
     * @return 套餐
     */
    @Override
    public Setmeal selectSetmealById(Long id) {
        return setmealMapper.selectSetmealById(id);
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
     *
     * @param setmeal 套餐
     * @return 结果
     */
    @Override
    public int insertSetmeal(Setmeal setmeal) {
        setmeal.setCreateTime(DateUtils.getNowDate());
        //创建人
        setmeal.setCreateUser(SecurityUtils.getUserId());
        return setmealMapper.insertSetmeal(setmeal);
    }

    /**
     * 修改套餐
     *
     * @param setmeal 套餐
     * @return 结果
     */
    @Override
    public int updateSetmeal(Setmeal setmeal) {
        setmeal.setUpdateTime(DateUtils.getNowDate());
        return setmealMapper.updateSetmeal(setmeal);
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
        return setmealMapper.updateSetmeal(setmeal);
    }

    @Override
    public List<Setmeal> selectDishList() {
        return setmealMapper.selectDishList(SecurityUtils.getUserId());
    }
}
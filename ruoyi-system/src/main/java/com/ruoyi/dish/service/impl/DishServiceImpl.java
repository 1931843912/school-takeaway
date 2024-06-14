package com.ruoyi.dish.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.constant.MessageConstant;
import com.ruoyi.common.constant.StatusConstant;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.common.exception.DeletionNotAllowedException;
import com.ruoyi.dish.domin.DishEntity;
import com.ruoyi.dish.domin.DishFlavorEntity;
import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.dto.DishPageQueryDTO;
import com.ruoyi.dish.domin.vo.DishVo;
import com.ruoyi.dish.mapper.DishDao;
import com.ruoyi.dish.mapper.DishFlavorDao;
import com.ruoyi.dish.mapper.SetMealDishDao;
import com.ruoyi.dish.service.DishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service("DishService")
@Slf4j
public class DishServiceImpl implements DishService {

    @Autowired
    DishDao dishDao;
    @Autowired
    DishFlavorDao dishFlavorDao;
    @Autowired
    SetMealDishDao setMealDishDao;

    @Override
    public void insertSysDishWithFlavor(DishDTO dishDTO) {

        DishEntity dish = new DishEntity();

        BeanUtils.copyProperties(dishDTO, dish);

        dishDao.insert(dish);

        Long dishId = dish.getId();

        List<DishFlavorEntity> flavors = dishDTO.getFlavors();
        if (flavors != null && flavors.size() > 0){
            flavors.forEach(dishFlavorEntity -> {
                dishFlavorEntity.setDishId(dishId);
            });
            dishFlavorDao.insertBatch(flavors);
        }
    }

    @Override
    public int updateSysDish(DishEntity Dish) {
        return 0;
    }

    @Override
    public int deleteSysDishById(Long id) {
        return 0;
    }

    @Override
    public int deleteSysDishByIds(Long[] ids) {
        return 0;
    }

    @Override
    public PageResult pageQuery(DishPageQueryDTO dishPageQueryDTO) {
        return null;
    }

    @Override
    public DishVo getDishWithFlavorById(Long id) {
        return dishDao.getDishWithFlavorById(id);
    }

    @Override
    public void deleteBatch(List<Long> ids) {
        for (Long id : ids){
            DishEntity dish = dishDao.getDishById(id);
            if (dish.getStatus() == StatusConstant.ENABLE){
                throw new DeletionNotAllowedException(MessageConstant.DISH_ON_SALE);
            }
        }

        List<Long> setmealIdsByDishIds = setMealDishDao.getSetmealIdsByDishIds(ids);
        if (setmealIdsByDishIds != null && setmealIdsByDishIds.size() > 0){
            throw new DeletionNotAllowedException(MessageConstant.DISH_BE_RELATED_BY_SETMEAL);
        }

        for (Long id : ids){
            dishDao.deleteById(id);
            dishFlavorDao.deleteByDishId(id);
        }
    }

    @Override
    public List<DishEntity> getDishByCategoryId(Long id) {
        return dishDao.getDishByCategoryId(id);
    }

    @Override
    public void changeStatusById(Long id, Integer status) {
        dishDao.changeStatusById(id, status);
    }

    @Override
    public void updateDishWithFlavor(DishDTO dishDTO) {
        DishEntity dish = new DishEntity();

        BeanUtils.copyProperties(dishDTO, dish);

        dishDao.updateById(dish);

        dishFlavorDao.deleteById(dish);


        List<DishFlavorEntity> flavors = dishDTO.getFlavors();
        if (flavors != null && flavors.size() > 0){
            flavors.forEach(dishFlavor -> {
                dishFlavor.setDishId(dishDTO.getId());
            });
            dishFlavorDao.insertBatch(flavors);
        }
    }

    @Override
    public boolean saveBatch(Collection<DishService> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<DishService> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<DishService> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(DishService entity) {
        return false;
    }

    @Override
    public DishService getOne(Wrapper<DishService> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<DishService> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<DishService> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<DishService> getBaseMapper() {
        return null;
    }

    @Override
    public Class<DishService> getEntityClass() {
        return null;
    }
}

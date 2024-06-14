package com.ruoyi.dish.service.impl;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.StatusConstant;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.common.utils.bean.BeanUtils;

import com.ruoyi.dish.domin.DishEntity;
import com.ruoyi.dish.domin.DishFlavorEntity;


import com.ruoyi.dish.domin.dto.DishDTO;
import com.ruoyi.dish.domin.dto.DishPageQueryDTO;
import com.ruoyi.dish.domin.vo.DishVO;


import com.ruoyi.dish.mapper.DishDao;
import com.ruoyi.dish.mapper.DishFlavorDao;
import com.ruoyi.dish.mapper.SetMealDishDao;
import com.ruoyi.dish.service.DishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service("dishService")
@Slf4j
public class DishServiceImpl implements DishService {

    @Autowired
    DishDao dishDao;
    @Autowired
    DishFlavorDao dishFlavorDao;
    @Autowired
    SetMealDishDao setmealDishDao;


    /**
     * 新增菜品以及对应口味数据
     *
     * @param dishDTO 菜品及其口味
     * @return 结果
     */
    @Override
    public void insertSysDishWithFlavor(DishDTO dishDTO) {

        DishEntity dish = new DishEntity();

        // 拷贝数据
        BeanUtils.copyProperties(dishDTO, dish);

        // 向菜品表 插入1条数据
        dishDao.insert(dish);

        // 获取insert语句生成的主键值
        Long dishId = dish.getId();

        List<DishFlavorEntity> flavors = dishDTO.getFlavors();
        if (flavors != null && flavors.size() > 0){

            flavors.forEach(dishFlavorEntity -> {
                dishFlavorEntity.setDishId(dishId);
            });
            // 向口味表插入n条数据
            dishFlavorDao.insertBatch(flavors);
        }

    }


    /**
     * 修改菜品以及对应口味数据
     *
     * @param dishDTO 菜品及其口味
     */
    @Override
    public void updateDishWithFlavor(DishDTO dishDTO) {
        DishEntity dish = new DishEntity();

        // 拷贝数据
        BeanUtils.copyProperties(dishDTO, dish);

        // 向菜品表 修改1条数据
        dishDao.updateById(dish);

        // 删除原有口味
        dishFlavorDao.deleteById(dish);


        List<DishFlavorEntity> flavors = dishDTO.getFlavors();
        if (flavors != null && flavors.size() > 0){

            flavors.forEach(dishFlavorEntity -> {
                dishFlavorEntity.setDishId(dishDTO.getId());
            });
            // 向口味表插入n条数据
            dishFlavorDao.insertBatch(flavors);
        }
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
        PageHelper.startPage(dishPageQueryDTO.getPage(), dishPageQueryDTO.getPageSize());
        Page<DishVO> page = dishDao.pageQuery(dishPageQueryDTO);
        return new PageResult(page.getTotal(),page.getResult());
    }

    @Override
    public DishVO getDishWithFlavorById(Long id) {

//        DishEntity dish = dishDao.getDishById(id);
//
//        List<DishFlavorEntity> dishFlavor = dishFlavorDao.getByDishId(id);

        return dishDao.getDishWithFlavorById(id);
    }

    @Override
    public void deleteBatch(List<Long> ids) {
        //判断当前菜品是否能够删除--是否存在起售中的菜品？？
        for (Long id : ids) {
            DishEntity dish = dishDao.getDishById(id);
            if (dish.getStatus() == StatusConstant.ENABLE) {
                //当前菜品处于起售中，不能删除
            }
        }

        //判断当前菜品是否能够删除--是否被套要关联了？？
        List<Long> setmealIds = setmealDishDao.getSetmealIdsByDishIds(ids);
        if (setmealIds != null && setmealIds.size() > 0){
            log.info("套餐包含该菜品");
        }

        //删除菜品表中的菜品数据
        for (Long id :ids){
            dishDao.deleteById(id);
            //删除菜品关联的口味数期
            dishFlavorDao.deleteById(id);
        }
    }

    @Override
    public List<DishEntity> getDishByCategoryId(Long CategoryId) {
        return dishDao.getDishByCategoryId(CategoryId);
    }

    @Override
    public void changeStatusById(Long id,Integer status) {
        dishDao.changeStatusById(id, status);
    }


    @Override
    public boolean saveBatch(Collection<DishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<DishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<DishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(DishEntity entity) {
        return false;
    }

    @Override
    public DishEntity getOne(Wrapper<DishEntity> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<DishEntity> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<DishEntity> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<DishEntity> getBaseMapper() {
        return null;
    }

    @Override
    public Class<DishEntity> getEntityClass() {
        return null;
    }
}
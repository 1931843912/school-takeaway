package com.ruoyi.web.service_admin.impl;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.result.PageResult;
import com.ruoyi.common.utils.bean.BeanUtils;

import com.ruoyi.web.entity_admin.SysDishEntity;
import com.ruoyi.web.entity_admin.SysDishFlavorEntity;


import com.ruoyi.web.entity_admin.dto.DishDTO;
import com.ruoyi.web.entity_admin.dto.DishPageQueryDTO;
import com.ruoyi.web.entity_admin.vo.DishVO;
import com.ruoyi.web.mapper.admin.SysDishDao;
import com.ruoyi.web.mapper.admin.SysDishFlavorDao;

import com.ruoyi.web.service_admin.SysDishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service("sysDishService")
@Slf4j
public class SysDishServiceImpl implements SysDishService  {

    @Autowired
    SysDishDao sysDishDao;
    @Autowired
    SysDishFlavorDao sysDishFlavorDao;


    /**
     * 新增菜品以及对应口味数据
     *
     * @param dishDTO 菜品及其口味
     * @return 结果
     */
    @Override
    public int insertSysDishWithFlavor(DishDTO dishDTO) {

        SysDishEntity dish = new SysDishEntity();

        // 拷贝数据
        BeanUtils.copyProperties(dishDTO, dish);

        // 向菜品表 插入1条数据
        sysDishDao.insert(dish);

        // 获取insert语句生成的主键值
        Long dishId = dish.getId();

        List<SysDishFlavorEntity> flavors = dishDTO.getFlavors();
        if (flavors != null && flavors.size() > 0){

            flavors.forEach(sysDishFlavorEntity -> {
                sysDishFlavorEntity.setDishId(dishId);
            });
            // 向口味表插入n条数据
            sysDishFlavorDao.insertBatch(flavors);
        }

        return 0;
    }

    @Override
    public int updateSysDish(SysDishEntity sysDish) {
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
        PageHelper.startPage(dishPageQueryDTO.getPage(), dishPageQueryDTO.getPageSize());
        Page<DishVO> page = sysDishDao.pageQuery(dishPageQueryDTO);
        return new PageResult(page.getTotal(),page.getResult());
    }


    @Override
    public boolean save(SysDishEntity entity) {
        return false;
    }

    @Override
    public boolean saveBatch(Collection<SysDishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<SysDishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        return false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<SysDishEntity> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(SysDishEntity entity) {
        return false;
    }

    @Override
    public boolean update(SysDishEntity entity, Wrapper<SysDishEntity> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<SysDishEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(SysDishEntity entity) {
        return false;
    }

    @Override
    public SysDishEntity getById(Serializable id) {
        return null;
    }

    @Override
    public Collection<SysDishEntity> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<SysDishEntity> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public SysDishEntity getOne(Wrapper<SysDishEntity> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<SysDishEntity> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<SysDishEntity> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<SysDishEntity> queryWrapper) {
        return 0;
    }

    @Override
    public List<SysDishEntity> list(Wrapper<SysDishEntity> queryWrapper) {
        return null;
    }

    @Override
    public IPage<SysDishEntity> page(IPage<SysDishEntity> page, Wrapper<SysDishEntity> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<SysDishEntity> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<SysDishEntity> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<SysDishEntity> page, Wrapper<SysDishEntity> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<SysDishEntity> getBaseMapper() {
        return null;
    }
}
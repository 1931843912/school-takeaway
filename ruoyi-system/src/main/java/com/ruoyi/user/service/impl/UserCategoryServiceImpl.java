package com.ruoyi.user.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.user.entity.constant.MessageConstant;
import com.ruoyi.user.entity.constant.StatusConstant;
import com.ruoyi.user.entity.dto.CategoryDTO;
import com.ruoyi.user.entity.dto.CategoryPageQueryDTO;
import com.ruoyi.user.entity.exception.DeletionNotAllowedException;
import com.ruoyi.user.entity.po.Category;
import com.ruoyi.user.mapper.UserCategoryMapper;
import com.ruoyi.user.mapper.UserDishMapper;
import com.ruoyi.user.mapper.UserSetmealMapper;
import com.ruoyi.user.result.PageResult;
import com.ruoyi.user.service.UserCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分类业务层
 */
@Service
@Slf4j
public class UserCategoryServiceImpl implements UserCategoryService {

    @Resource
    private UserCategoryMapper userCategoryMapper;
    @Resource
    private UserDishMapper userDishMapper;
    @Resource
    private UserSetmealMapper userSetmealMapper;

    /**
     * 新增分类
     * @param categoryDTO
     */
    public void save(CategoryDTO categoryDTO) {
        Category category = new Category();
        //属性拷贝
        BeanUtils.copyProperties(categoryDTO, category);

        //分类状态默认为禁用状态0
        category.setStatus(StatusConstant.DISABLE);

        //设置创建时间、修改时间、创建人、修改人
        //category.setCreateTime(LocalDateTime.now());
        //category.setUpdateTime(LocalDateTime.now());
        //category.setCreateUser(BaseContext.getCurrentId());
        //category.setUpdateUser(BaseContext.getCurrentId());

        userCategoryMapper.insert(category);
    }

    /**
     * 分页查询
     * @param categoryPageQueryDTO
     * @return
     */
    public PageResult pageQuery(CategoryPageQueryDTO categoryPageQueryDTO) {
        PageHelper.startPage(categoryPageQueryDTO.getPage(),categoryPageQueryDTO.getPageSize());
        //下一条sql进行分页，自动加入limit关键字分页
        Page<Category> page = userCategoryMapper.pageQuery(categoryPageQueryDTO);
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 根据id删除分类
     * @param id
     */
    public void deleteById(Long id) {
        //查询当前分类是否关联了菜品，如果关联了就抛出业务异常
        Integer count = userDishMapper.countByCategoryId(id);
        if(count > 0){
            //当前分类下有菜品，不能删除
            throw new DeletionNotAllowedException(MessageConstant.CATEGORY_BE_RELATED_BY_DISH);
        }

        //查询当前分类是否关联了套餐，如果关联了就抛出业务异常
        count = userSetmealMapper.countByCategoryId(id);
        if(count > 0){
            //当前分类下有菜品，不能删除
            throw new DeletionNotAllowedException(MessageConstant.CATEGORY_BE_RELATED_BY_SETMEAL);
        }

        //删除分类数据
        userCategoryMapper.deleteById(id);
    }

    /**
     * 修改分类
     * @param categoryDTO
     */
    public void update(CategoryDTO categoryDTO) {
        Category category = new Category();
        BeanUtils.copyProperties(categoryDTO,category);

        //设置修改时间、修改人
        //category.setUpdateTime(LocalDateTime.now());
        //category.setUpdateUser(BaseContext.getCurrentId());

        userCategoryMapper.update(category);
    }

    /**
     * 启用、禁用分类
     * @param status
     * @param id
     */
    public void startOrStop(Integer status, Long id) {
        Category category = Category.builder()
                .id(id)
                .status(status)
                //.updateTime(LocalDateTime.now())
                //.updateUser(BaseContext.getCurrentId())
                .build();
        userCategoryMapper.update(category);
    }

    /**
     * 根据类型查询分类
     * @param type
     * @return
     */
    public List<Category> list(Integer type,Integer userId) {
        Map<String,Integer> map = new HashMap<>();
        map.put("type", type);
        map.put("userId", userId);
        return userCategoryMapper.list(map);
    }
}

package com.ruoyi.web.controller.user;


import com.ruoyi.user.entity.po.Category;
import com.ruoyi.user.result.Result;
import com.ruoyi.user.service.UserCategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController("userCategoryController")
@RequestMapping("/user/category")
@Api(tags = "C端-分类接口")
public class UserCategoryController {

    @Resource
    private UserCategoryService userCategoryService;

    /**
     * 查询分类
     * @param type
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("查询分类")
    public Result<List<Category>> list(Integer type) {
        List<Category> list = userCategoryService.list(type);
        return Result.success(list);
    }
}

package com.ruoyi.web.controller.user;

import com.ruoyi.user.entity.po.Category;
import com.ruoyi.user.result.Result;
import com.ruoyi.web.entity_user.MerchantEntity;
import com.ruoyi.web.service_user.MerchantService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user/merchant")
public class MerchantController {
    @Autowired
    private MerchantService merchantService;

    /**
     * 查询商家列表
     */
    @GetMapping("/list")
    @ApiOperation("查询分类")
    public Result<List<MerchantEntity>> list() {
        List<MerchantEntity> list = merchantService.selectMerchantList();
        return Result.success(list);
    }
}

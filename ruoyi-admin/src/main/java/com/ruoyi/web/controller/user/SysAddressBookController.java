package com.ruoyi.web.controller.user;


import com.ruoyi.web.entity_user.SysAddressBookEntity;
import com.ruoyi.web.service_user.SysAddressBookService;
import com.ruoyi.web.utils_user.PageUtils;
import com.ruoyi.web.utils_user.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 地址簿
 *
 * @author Franklin
 * @date 2024-06-07 10:57:43
 */
@RestController
@RequestMapping("/user/addressBook")
public class SysAddressBookController {
    @Autowired
    SysAddressBookService sysAddressBookService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sysAddressBookService.queryPage(params);

        return R.ok().put("data", page);
    }

    /**
     * 查询默认地址
     */
    @GetMapping("/default")
    public R defaultlist(@RequestParam Map<String, Object> params){
        params.put("default",0);
        PageUtils page = sysAddressBookService.queryPage(params);
        return R.ok().put("data", page);
    }



    /**
     * 信息
     */
    @GetMapping("/{id}")
    public R info(@PathVariable("id") Long id){
		SysAddressBookEntity sysAddressBook = sysAddressBookService.getById(id);

        return R.ok().put("sysAddressBook", sysAddressBook);
    }

    /**
     * 保存
     */
    @PostMapping("/")
    public R save(@RequestBody SysAddressBookEntity sysAddressBook){
		sysAddressBookService.save(sysAddressBook);
        return R.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/")
    public R update(@RequestBody SysAddressBookEntity sysAddressBook){
        if (sysAddressBook.getId() == null){
            return R.error("ID为空");
        }
		sysAddressBookService.updateById(sysAddressBook);
        return R.ok();
    }

    @PutMapping("/default")
    public R updatedefault(@RequestBody SysAddressBookEntity sysAddressBook){
        sysAddressBook.setIsDefault(0);
        sysAddressBookService.updateById(sysAddressBook);
        return R.ok();
    }
    /**
     * 删除
     */
    @DeleteMapping("/")
    public R delete(Long[] id){
		sysAddressBookService.removeByIds(Arrays.asList(id));
        return R.ok();
    }

}

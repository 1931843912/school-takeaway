package com.ruoyi;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

/**
 * @Description:
 * @Author: ChenGuanZhou
 * @Date: 2024/06/07
 */
public class FastGenerator {
    public static void main(String[] args) {
        String url= "jdbc:mysql://localhost:3306/sky_take_out?useSSL=true&useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8";
        String username = "root";
        String password = "123456";
        FastAutoGenerator.create(url, username, password)
                .globalConfig(builder -> {
                    builder.author("ChenGuanZhou") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("D:\\gitProject\\schooltakeaway\\ruoyi-admin\\src\\main\\java\\com\\ruoyi\\web"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.ruoyi.generator") // 设置父包名
                            .moduleName("FATHER") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "D:\\gitProject\\schooltakeaway\\ruoyi-admin\\src\\main\\java\\com\\ruoyi\\web\\mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("sys_employee") // 设置需要生成的表名
                            .addTablePrefix("t_", "c_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}

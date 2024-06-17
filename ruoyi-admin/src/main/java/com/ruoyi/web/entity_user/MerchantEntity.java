package com.ruoyi.web.entity_user;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MerchantEntity extends BaseEntity {
    private Long id;
    private Long userId;
    private String storeName;
    private List<String> dishList;
    private int status;
}

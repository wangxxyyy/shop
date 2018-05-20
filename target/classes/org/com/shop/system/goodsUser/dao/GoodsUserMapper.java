package org.com.shop.system.goodsUser.dao;

import org.com.shop.system.goodsUser.model.GoodsUser;

public interface GoodsUserMapper {
    int deleteByPrimaryKey(String id);

    int insert(GoodsUser record);

    int insertSelective(GoodsUser record);

    GoodsUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(GoodsUser record);

    int updateByPrimaryKey(GoodsUser record);

    GoodsUser login(String loginName, String loginPassword);
}
package org.com.shop.business.shopingCart.dao;

import org.com.shop.business.shopingCart.model.ShopingCart;

import java.util.List;

public interface ShopingCartMapper {
    int deleteByPrimaryKey(String id);

    int insert(ShopingCart record);

    int insertSelective(ShopingCart record);

    ShopingCart selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ShopingCart record);

    int updateByPrimaryKey(ShopingCart record);

    void deleteById(String id);

    List<ShopingCart> getShop(String id);

    void deleteRecordById(String id);
}
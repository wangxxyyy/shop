package org.com.shop.business.items.dao;

import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.shopingCart.model.ShopingCart;

import java.util.List;
import java.util.Map;

public interface ItemsShopMapper {
    int deleteByPrimaryKey(String id);

    int insert(ItemsShop record);

    int insertSelective(ItemsShop record);

    ItemsShop selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ItemsShop record);

    int updateByPrimaryKey(ItemsShop record);

    List<ItemsShop> getList(Map<String, Object> param);

    int getListCount(Map<String, Object> param);

    List<ItemsShop> getListItemsShop(String goodsClassfyId);

    ItemsShop getListItems(String specificCommodityId);

    ItemsShop getCommodity(String goodsId);

    List<ShopingCart> getListItemsShops(Map<String,Object> params);
}
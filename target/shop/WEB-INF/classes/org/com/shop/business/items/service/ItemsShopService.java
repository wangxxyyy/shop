package org.com.shop.business.items.service;

import org.com.shop.business.items.model.ItemsShop;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/27 0027.
 */
public interface ItemsShopService {
    List<ItemsShop> getList(Map<String, Object> param);

    int getListCount(Map<String, Object> param);

    int saveOrUpdateItemsShop(ItemsShop itemsShop);

    void deleteShopItems(String id);

    List<ItemsShop> getListItemsShop(String goodsClassfyId);

    ItemsShop getListItems(String id);

    ItemsShop getCommodity(String goodsId);
}

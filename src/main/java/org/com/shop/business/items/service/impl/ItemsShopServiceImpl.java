package org.com.shop.business.items.service.impl;

import org.com.shop.business.items.dao.ItemsShopMapper;
import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.com.shop.common.CommonUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/27 0027.
 */
@Service
public class ItemsShopServiceImpl implements ItemsShopService {

    @Resource
    ItemsShopMapper itemsShopMapper;

    @Override
    public List<ItemsShop> getList(Map<String, Object> param) {
        List<ItemsShop> list = itemsShopMapper.getList(param);
        return list;
    }

    @Override
    public int  getListCount(Map<String, Object> param) {
        return itemsShopMapper.getListCount(param);
    }

    @Override
    public int saveOrUpdateItemsShop(ItemsShop itemsShop) {
        if(itemsShop.getId()!=null&&!"".equals(itemsShop.getId())){
            itemsShopMapper.updateByPrimaryKeySelective(itemsShop);
        }else{
            itemsShop.setId(CommonUtil.getUUID());
            itemsShop.setCreateDate(new Date());
            itemsShopMapper.insertSelective(itemsShop);
        }
        return 1;
    }

    @Override
    public void deleteShopItems(String id) {
        itemsShopMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<ItemsShop> getListItemsShop(String goodsClassfyId) {
        List<ItemsShop> list = itemsShopMapper.getListItemsShop(goodsClassfyId);
        return list;
    }

    @Override
    public ItemsShop getListItems(String id) {
        ItemsShop itemsShop = itemsShopMapper.getListItems(id);
        return itemsShop;
    }

    @Override
    public ItemsShop getCommodity(String goodsId) {
        ItemsShop commodity = itemsShopMapper.getCommodity(goodsId);
        return commodity;
    }
}


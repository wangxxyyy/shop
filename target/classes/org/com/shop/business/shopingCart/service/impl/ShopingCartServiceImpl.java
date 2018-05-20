package org.com.shop.business.shopingCart.service.impl;

import org.com.shop.business.items.dao.ItemsShopMapper;
import org.com.shop.business.shopingCart.dao.ShopingCartMapper;
import org.com.shop.business.shopingCart.model.ShopingCart;
import org.com.shop.business.shopingCart.service.ShopingCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/18 0018.
 */
@Service
public class ShopingCartServiceImpl implements ShopingCartService {

    @Resource
    ShopingCartMapper shopingCartMapper;

    @Resource
    ItemsShopMapper itemsShopMapper;

    @Override
    public int saveShopingCart(ShopingCart shopingCart) {
        String id = shopingCart.getItemsshopId();

        //同一个商品多次选择，先执行删除方法
        shopingCartMapper.deleteById(id);

        shopingCartMapper.insertSelective(shopingCart);
        return 1;
    }

    @Override
    public List<ShopingCart> getShop(String id) {
        List<ShopingCart> ShopingCartList = shopingCartMapper.getShop(id);
        List<String> itemsShopIds = new ArrayList<String>();
        for(int i=0;i<ShopingCartList.size();i++){
            ShopingCart itemsShop = ShopingCartList.get(i);
            itemsShopIds.add(itemsShop.getItemsshopId());
        }

        Map<String,Object> params = new HashMap<String,Object>();
        params.put("itemsShopIds",itemsShopIds);

        List<ShopingCart> list = itemsShopMapper.getListItemsShops(params);
        return list;
    }

    @Override
    public void deleteRecord(String id) {
        shopingCartMapper.deleteRecordById(id);
    }
}

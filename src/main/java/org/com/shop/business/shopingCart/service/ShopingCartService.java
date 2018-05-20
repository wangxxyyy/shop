package org.com.shop.business.shopingCart.service;

import org.com.shop.business.shopingCart.model.ShopingCart;

import java.util.List;

/**
 * Created by Administrator on 2017/2/18 0018.
 */
public interface ShopingCartService {


    int saveShopingCart(ShopingCart shopingCart);

    List<ShopingCart> getShop(String id);

    void deleteRecord(String id);
}

package org.com.shop.system.goodsUser.service;

import org.com.shop.system.goodsUser.model.GoodsUser;

/**
 * Created by Administrator on 2017/2/16 0016.
 */
public interface GoodsUserService {
    GoodsUser login(String loginName, String loginPassword);
}

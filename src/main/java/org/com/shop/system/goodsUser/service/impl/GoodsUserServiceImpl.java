package org.com.shop.system.goodsUser.service.impl;

import org.com.shop.system.goodsUser.dao.GoodsUserMapper;
import org.com.shop.system.goodsUser.model.GoodsUser;
import org.com.shop.system.goodsUser.service.GoodsUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/2/16 0016.
 */
@Service
public class GoodsUserServiceImpl implements GoodsUserService {

    @Resource
    GoodsUserMapper goodsUserMapper;

    @Override
    public GoodsUser login(String loginName, String loginPassword) {
        GoodsUser loginUser =   goodsUserMapper.login(loginName,loginPassword);
        return loginUser;
    }
}

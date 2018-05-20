package org.com.shop.business.shoppingRecord.controller;

import org.com.shop.business.shopingCart.model.ShopingCart;
import org.com.shop.business.shopingCart.service.ShopingCartService;
import org.com.shop.system.goodsUser.model.GoodsUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/2/28 0028.
 */
@Controller
@RequestMapping("/shoppingRecord")
public class ShoppingRecordController {

    @Resource
    ShopingCartService shopingCartServiceImpl;

    @RequestMapping("/shoppingRecordHome")
    public ModelAndView shoppingRecord(HttpServletRequest request){
        ModelAndView view = new ModelAndView();
        HttpSession session = request.getSession();
        GoodsUser goodsUser = (GoodsUser) session.getAttribute("goodsUser");
        String id = goodsUser.getId();
        try {
            List<ShopingCart> list  = shopingCartServiceImpl.getShop(id);
            view.addObject("list",list);
            view.setViewName("shoppingRecord/shoppingRecordIndex");
        }catch (Exception e){
            e.printStackTrace();
        }
        return view;
    }
}
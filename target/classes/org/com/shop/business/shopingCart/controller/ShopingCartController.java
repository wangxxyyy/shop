package org.com.shop.business.shopingCart.controller;

import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.com.shop.business.shopingCart.model.ShopingCart;
import org.com.shop.business.shopingCart.service.ShopingCartService;
import org.com.shop.common.CommonUtil;
import org.com.shop.system.goodsUser.model.GoodsUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Administrator on 2017/2/15 0015.
 */
@Controller
@RequestMapping("/shopingCart")
public class ShopingCartController {

    @Resource
    ShopingCartService shopingCartServiceImpl;

    @Resource
    ItemsShopService itemsShopServiceImpl;

    @RequestMapping("/shopingCartHome")
    public ModelAndView shopingCart(String id){
        ModelAndView view = new ModelAndView();
        try{
           ItemsShop shop = itemsShopServiceImpl.getListItems(id);
           view.addObject("shop",shop);
           view.setViewName("shopingCart/shopingCartIndex");
        }catch(Exception e) {
            e.printStackTrace();
        }
        return view;
    }

    @RequestMapping("/saveShopingCart")
    @ResponseBody
    public int saveShopingCart(HttpServletRequest request, ShopingCart shopingCart){
        int  state = 0;
        String id = request.getParameter("id");
        int sum = Integer.parseInt(request.getParameter("sum"));
        try{
            ItemsShop itemsShop = itemsShopServiceImpl.getListItems(id);
            HttpSession session = request.getSession();
            GoodsUser goodsUser = (GoodsUser)session.getAttribute("goodsUser");
            shopingCart.setLoginUserId(goodsUser.getId());
            shopingCart.setId(CommonUtil.getUUID());
            shopingCart.setCreateDate(new Date());
            shopingCart.setPrice(itemsShop.getPrice());
            shopingCart.setItemsshopId(itemsShop.getId());
            shopingCart.setTotal(sum);

             state = shopingCartServiceImpl.saveShopingCart(shopingCart);

        }catch (Exception e){
            e.printStackTrace();
        }
        return state;
    }

    @RequestMapping("/deleteRecord")
    @ResponseBody
    public int deleteRecord(HttpServletRequest request){
        int state = 0;
        String id  = request.getParameter("id");
        try{
             shopingCartServiceImpl.deleteRecord(id);
             state = 1;
        }catch (Exception e){
            e.printStackTrace();
            state = -1;
        }
        return state;
    }
}



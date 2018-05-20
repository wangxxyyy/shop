package org.com.shop.business.specificCommodity.controller;

import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/2/11 0011.
 */
@Controller
@RequestMapping("/specificCommodity")
public class specificCommodityController {

    @Resource
    ItemsShopService itemsShopServiceImpl;


    @RequestMapping("/specificCommodityHome")
    public ModelAndView  specificCommodity(String specificCommodityId){
        ModelAndView view = new ModelAndView();
        try{
            ItemsShop goods  =itemsShopServiceImpl.getListItems(specificCommodityId);
            view.addObject("itemsShop",goods);
            view.setViewName("specificCommodity/specificCommodityIndex");
        }catch(Exception e){
            e.printStackTrace();
        }
        return view;
    }
}

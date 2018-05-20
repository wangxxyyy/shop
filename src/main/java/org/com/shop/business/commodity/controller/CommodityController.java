package org.com.shop.business.commodity.controller;

import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/1/21 0021.
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController {

    @Resource
    ItemsShopService itemsShopServiceImpl;

    @RequestMapping("/commodityHome")
    public ModelAndView commodityHome(String goodsClassfyId) {
        ModelAndView view = new ModelAndView();
        try {
            //通过id查数据
            List<ItemsShop> list =  null;
            list = itemsShopServiceImpl.getListItemsShop(goodsClassfyId);
            view.addObject("list",list);
            view.setViewName("commodity/commodityIndex");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }
}

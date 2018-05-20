package org.com.shop.business.goods.controller;

import org.com.shop.business.goods.model.GoodsClassify;
import org.com.shop.business.goods.service.GoodsClassifyService;
import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.com.shop.system.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goodsClassify")
public class GoodsClassifyController {

	@Resource
	GoodsClassifyService goodsClassifyServiceImpl;

	@Resource
	ItemsShopService itemsShopServiceImpl;
	
	@RequestMapping("/index")
	public ModelAndView goods(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		
		try{
			view.setViewName("goods/goodsClassifyIndex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return view;
	}

	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> list(GoodsClassify goodsClassify,HttpServletRequest request){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("start", (page-1)*rows);
			params.put("rows", rows);
			params.put("name",goodsClassify.getName());
			List<GoodsClassify> list = goodsClassifyServiceImpl.getList(params);
			int count = goodsClassifyServiceImpl.getListCount(params);

			result.put("rows",list);
			result.put("total",count);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}


	@RequestMapping("/saveOrUpdateGoodsClassify")
	@ResponseBody
	public int saveOrUpdateGoodsClassify(GoodsClassify goodsClassify,HttpServletRequest request){
		int state = 0;
		try{
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			goodsClassify.setCreateUserId(user.getId());
			state = goodsClassifyServiceImpl.saveOrUpdateGoodsClassify(goodsClassify);
		}catch(Exception e){
			e.printStackTrace();
		}
			return state;
	}

	@RequestMapping("/deleteGoodsClassify")
	@ResponseBody
	public int deleteGoodsClassify(String id){
		int state = 0;
		try{
			goodsClassifyServiceImpl.deleteGoodsClassify(id);
			state = 1;
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
	}

	@RequestMapping("/listItemsShop")
	@ResponseBody
	public Map<String,Object> list(ItemsShop itemsShop, HttpServletRequest request){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("start",(page-1)*rows);
			param.put("rows",rows);
			List<ItemsShop> list = itemsShopServiceImpl.getList(param);
			int count = itemsShopServiceImpl.getListCount(param);
			result.put("rows",list);
			result.put("total",count);
		}catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}
}

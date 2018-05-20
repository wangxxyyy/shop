package org.com.shop.system.home.controller;

import org.com.shop.business.goods.model.GoodsClassify;
import org.com.shop.business.goods.service.GoodsClassifyService;
import org.com.shop.system.goodsUser.model.GoodsUser;
import org.com.shop.system.menu.model.Menu;
import org.com.shop.system.menu.service.MenuService;
import org.com.shop.system.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Resource
	MenuService menuServiceImpl;

	@Resource
	GoodsClassifyService goodsClassifyServiceImpl;
	
	@RequestMapping("/index")
	public ModelAndView login(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		try{
			HttpSession session =request.getSession();
			User user = (User) session.getAttribute("user");
		 	view.addObject("user", user);
			List<Menu> menuList = menuServiceImpl.getByUserId(user.getId());
			view.addObject("menuList", menuList);
			view.setViewName("main");
		}catch(Exception e){
			e.printStackTrace();
		}
		return view;
	}

	@RequestMapping("/homePage")
	public ModelAndView homePage(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		try {
			HttpSession session = request.getSession();
			GoodsUser goodsUser =  (GoodsUser)session.getAttribute("goodsUser");

			List<GoodsClassify> list = goodsClassifyServiceImpl.getClassifyList();
			view.addObject("list", list);
			view.addObject("goodsUser",goodsUser);
			view.setViewName("index");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
}

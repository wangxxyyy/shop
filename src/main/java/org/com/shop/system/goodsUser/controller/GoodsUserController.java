package org.com.shop.system.goodsUser.controller;

import org.com.shop.system.goodsUser.model.GoodsUser;
import org.com.shop.system.goodsUser.service.GoodsUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/2/16 0016.
 */

@Controller
@RequestMapping("/goodsUser")
public class GoodsUserController {

    @Resource
    GoodsUserService goodsUserServiceImpl;

    @RequestMapping("/login")
    @ResponseBody
    public int userLogin(HttpServletRequest request){
    String loginName = request.getParameter("loginName");
    String loginPassword = request.getParameter("loginPassword");
    int state = 0;
    try{
        if(loginName!=null&&!"".equals(loginName)
                &&loginPassword!=null&&!"".equals(loginPassword)){
            GoodsUser loginUser = goodsUserServiceImpl.login(loginName,loginPassword);
            if(loginUser!=null){
                HttpSession session = request.getSession();
                session.setAttribute("goodsUser",loginUser);
                state = 1;
            }
        }
    }catch(Exception e){
      e.printStackTrace();
      state = -1;
    }
        return state;
    }

    @RequestMapping("/quitHome")
    public ModelAndView quit(HttpServletRequest request){
        ModelAndView view = new ModelAndView();
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("goodsUser");
            view.setViewName("goodsLogin");
        }catch (Exception e){
            e.printStackTrace();
        }
        return view;
    }
}

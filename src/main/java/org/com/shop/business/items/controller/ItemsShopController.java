package org.com.shop.business.items.controller;

import org.com.shop.business.goods.model.GoodsClassify;
import org.com.shop.business.goods.service.GoodsClassifyService;
import org.com.shop.business.items.model.ItemsShop;
import org.com.shop.business.items.service.ItemsShopService;
import org.com.shop.system.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/27 0027.
 */
@Controller
@RequestMapping("/itemsShop")
public class ItemsShopController {

    @Resource
    ItemsShopService itemsShopServiceImpl;

    @Resource
    GoodsClassifyService goodsClassifyServiceImpl;


    @RequestMapping("/index")
    public ModelAndView itemsGoods(HttpServletRequest request){
        ModelAndView view = new ModelAndView();
        try {
            view.setViewName("items/ItemsGoodsIndex");
        }catch(Exception e){
            e.printStackTrace();
        }
        return view;
    }

    @RequestMapping("/list")
    @ResponseBody
   public Map<String,Object> list(HttpServletRequest request, ItemsShop itemsShop) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            int page = Integer.parseInt(request.getParameter("page"));
            int rows = Integer.parseInt(request.getParameter("rows"));
            String name = itemsShop.getName();
            Map<String,Object> param = new HashMap<String,Object>();
            param.put("start", (page-1)*rows);
            param.put("rows", rows);
            param.put("name",name);
            List<ItemsShop> list = itemsShopServiceImpl.getList(param);
            int count = itemsShopServiceImpl.getListCount(param);

            result.put("rows",list);
            result.put("total",count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("/saveOrUpdateItemsShop")
    @ResponseBody
    public int saveOrUpdateItemsShop(@RequestParam("photos") MultipartFile file, ItemsShop itemsShop, HttpServletRequest request){
        int state = 0;
        String trueFileName = null;
        try{
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            itemsShop.setCreateUserId(user.getId());

            if (file!=null) {// 判断上传的文件是否为空
                String path=null;// 文件路径
                String type=null;// 文件类型
                String fileName = file.getOriginalFilename();// 文件原名称
                System.out.println("上传的文件原名称:"+fileName);
                // 判断文件类型
                type = fileName.indexOf(".")!=-1?fileName
                        .substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
                if (type!=null) {// 判断文件类型是否为空
                    if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                        // 项目在容器中实际发布运行的根路径
                        String realPath=request.getSession().getServletContext().getRealPath("/");
                        // 自定义的文件名称
                        trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                        // 设置存放图片文件的路径
                        path=realPath +"upload/" + trueFileName;
                        System.out.println("存放图片文件的路径:"+path);
                        // 转存文件到指定的路径
                        file.transferTo(new File(path));
                        System.out.println("文件成功上传到指定目录下");
                    }else {
                        System.out.println("不是我们想要的文件类型,请按要求重新上传");
                    }
                }else {
                    System.out.println("文件类型为空");
                }
            }else {
                System.out.println("没有找到相对应的文件");
            }
            itemsShop.setPhoto(trueFileName);
            state = itemsShopServiceImpl.saveOrUpdateItemsShop(itemsShop);

        }catch (Exception e){
           e.printStackTrace();
        }
        return state;
    }

    @RequestMapping("/deleteItemsShop")
    @ResponseBody
    public int deleteShopItems(HttpServletRequest request){
        String id = request.getParameter("id");
        int state = 0;
        try {
            itemsShopServiceImpl.deleteShopItems(id);
            state = 1;
        }catch (Exception e){
            state = -1;
            e.printStackTrace();
        }
            return state;
    }

    @RequestMapping("/listClassify")
    @ResponseBody
    public List<GoodsClassify> list(){
       List list = null;
        try{
            list = goodsClassifyServiceImpl.getListClassify();
        }catch (Exception e){
            e.printStackTrace();
       }
       return list;
    }
}

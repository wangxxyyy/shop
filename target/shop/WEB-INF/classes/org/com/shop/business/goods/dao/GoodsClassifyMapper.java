package org.com.shop.business.goods.dao;

import org.com.shop.business.goods.model.GoodsClassify;

import java.util.List;
import java.util.Map;

public interface GoodsClassifyMapper {
    int deleteByPrimaryKey(String id);

    int insert(GoodsClassify record);

    int insertSelective(GoodsClassify record);

    GoodsClassify selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(GoodsClassify record);

    int updateByPrimaryKey(GoodsClassify record);

    int getListCount(Map<String, Object> param);

    List<GoodsClassify> getList(Map<String, Object> param);

    List<GoodsClassify> getListClassify();

    List<GoodsClassify> getClassifyList();
}
package org.com.shop.business.goods.service;

import org.com.shop.business.goods.model.GoodsClassify;

import java.util.List;
import java.util.Map;

public interface GoodsClassifyService {

	List<GoodsClassify> getList(Map<String, Object> params);

	int getListCount(Map<String, Object> params);

    int saveOrUpdateGoodsClassify(GoodsClassify goodsClassify);

    void deleteGoodsClassify(String id);

    List getListClassify();

    List<GoodsClassify> getClassifyList();
}

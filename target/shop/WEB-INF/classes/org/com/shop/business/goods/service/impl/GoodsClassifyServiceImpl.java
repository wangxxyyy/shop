package org.com.shop.business.goods.service.impl;

import org.com.shop.business.goods.dao.GoodsClassifyMapper;
import org.com.shop.business.goods.model.GoodsClassify;
import org.com.shop.business.goods.service.GoodsClassifyService;
import org.com.shop.common.CommonUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class GoodsClassifyServiceImpl implements GoodsClassifyService {

	@Resource
	GoodsClassifyMapper  goodsClassifyMapper;

	@Override
	public List<GoodsClassify> getList(Map<String, Object> params) {
		List<GoodsClassify> list = goodsClassifyMapper.getList(params);
		return list;
	}

	@Override
	public int getListCount(Map<String, Object> params) {
		return goodsClassifyMapper.getListCount(params);
	}

	@Override
	public int saveOrUpdateGoodsClassify(GoodsClassify goodsClassify) {
		if(goodsClassify.getId()!=null&&!"".equals(goodsClassify.getId())){
			goodsClassifyMapper.updateByPrimaryKeySelective(goodsClassify);
		}else{
			goodsClassify.setCreateDate(new Date());
			goodsClassify.setId(CommonUtil.getUUID());
			goodsClassifyMapper.insertSelective(goodsClassify);
		}
		return 1;
	}

	@Override
	public void deleteGoodsClassify(String id) {
		goodsClassifyMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List getListClassify() {
		List<GoodsClassify> list = goodsClassifyMapper.getListClassify();
		return list;
	}

	@Override
	public List<GoodsClassify> getClassifyList() {
		List<GoodsClassify> list = goodsClassifyMapper.getClassifyList();
		return list;
	}
}

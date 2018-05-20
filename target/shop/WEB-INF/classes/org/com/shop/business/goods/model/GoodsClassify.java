package org.com.shop.business.goods.model;

import java.util.Date;
import java.util.List;

public class GoodsClassify {
    private String id;

    private String name;

    private Integer state;

    private String createUserId;

    private String parentId;

    private Date createDate;

    private Integer orders;

    private String url;

    /**
     *  下拉框显示帮助属性
     */
    private String text;

    private GoodsClassify parent;

    private List<GoodsClassify> children;

    public List<GoodsClassify> getChildren() {
        return children;
    }

    public void setChildren(List<GoodsClassify> children)    {
        this.children = children;
    }

    public GoodsClassify getParent() {
        return parent;
    }

    public void setParent(GoodsClassify parent) {
        this.parent = parent;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getText() {
        return this.name;
    }
}
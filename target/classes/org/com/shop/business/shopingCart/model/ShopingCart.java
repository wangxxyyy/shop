package org.com.shop.business.shopingCart.model;

import java.util.Date;

public class ShopingCart {
    private String id;

    private Double price;

    private String loginUserId;

    private Integer state;

    private Integer total;

    private Date createDate;

    private String itemsshopId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getLoginUserId() {
        return loginUserId;
    }

    public void setLoginUserId(String loginUserId) {
        this.loginUserId = loginUserId == null ? null : loginUserId.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getItemsshopId() {
        return itemsshopId;
    }

    public void setItemsshopId(String itemsshopId) {
        this.itemsshopId = itemsshopId == null ? null : itemsshopId.trim();
    }
}
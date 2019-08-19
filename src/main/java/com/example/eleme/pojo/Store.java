package com.example.eleme.pojo;

public class Store {
    private String shopid;

	private String name;

	private String description;

	private Integer deliveryTime;

	private Float score;

	private Integer sellCount;

	private String bulletin;

	private Integer ratingCount;

	private Float serviceScore;

	private Float rankRate;

	private Float minPrice;

	private Float deliveryPrice;

	private Float foodScore;

	private String avatar;

	private String infos;

	private String pics;

	private String support;

	private String cardid;

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid == null ? null : shopid.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public Integer getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(Integer deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Integer getSellCount() {
		return sellCount;
	}

	public void setSellCount(Integer sellCount) {
		this.sellCount = sellCount;
	}

	public String getBulletin() {
		return bulletin;
	}

	public void setBulletin(String bulletin) {
		this.bulletin = bulletin == null ? null : bulletin.trim();
	}

	public Integer getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(Integer ratingCount) {
		this.ratingCount = ratingCount;
	}

	public Float getServiceScore() {
		return serviceScore;
	}

	public void setServiceScore(Float serviceScore) {
		this.serviceScore = serviceScore;
	}

	public Float getRankRate() {
		return rankRate;
	}

	public void setRankRate(Float rankRate) {
		this.rankRate = rankRate;
	}

	public Float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}

	public Float getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(Float deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public Float getFoodScore() {
		return foodScore;
	}

	public void setFoodScore(Float foodScore) {
		this.foodScore = foodScore;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar == null ? null : avatar.trim();
	}

	public String getInfos() {
		return infos;
	}

	public void setInfos(String infos) {
		this.infos = infos == null ? null : infos.trim();
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics == null ? null : pics.trim();
	}

	public String getSupport() {
		return support;
	}

	public void setSupport(String support) {
		this.support = support == null ? null : support.trim();
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid == null ? null : cardid.trim();
	}

}
package com.example.eleme.pojo;

/**
 * 未读的历史消息
 * 好友者id
 * 最新消息内容
 * 未读消息数目
 * 好友名
 * 好友头像
 * @author krisk
 *
 */
public class HistoryMsg {
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getMsg() {
		return Msg;
	}
	public void setMsg(String msg) {
		Msg = msg;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getFriendName() {
		return friendName;
	}
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	public String getFriendImg() {
		return friendImg;
	}
	public void setFriendImg(String friendImg) {
		this.friendImg = friendImg;
	}
	private String senderId;
	private String Msg; 
	private Integer number;
	private String friendName;
	private String friendImg;
}

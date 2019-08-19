package com.example.eleme.pojo;

import java.io.Serializable;
/**
 * socket传入的内容对象
 * @author krisk
 *
 */
public class DataContent implements Serializable {
	private static final long serialVersionUID = -3993641991365673918L;
	private Integer action; //动作类型
	private ChatMsg chatMsg;//消息内容
	private String extend; //扩展字段
	public Integer getAction() {
		return action;
	}
	public void setAction(Integer action) {
		this.action = action;
	}
	public ChatMsg getChatMsg() {
		return chatMsg;
	}
	public void setChatMsg(ChatMsg chatMsg) {
		this.chatMsg = chatMsg;
	}
	public String getExtend() {
		return extend;
	}
	public void setExtend(String extend) {
		this.extend = extend;
	}

	
}

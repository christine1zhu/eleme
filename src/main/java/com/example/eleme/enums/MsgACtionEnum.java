package com.example.eleme.enums;

/**
 * 发送消息类型的枚举
 */
public enum MsgACtionEnum {

	CONNECT(0,"第一次初始化连接"),
	CHAT(1,"聊天消息"),
	BROADCAST(2,"广播"),
	KEEPALIVE(3,"客户端保持心跳");
	
	public final Integer type;
	public String getContent() {
		return content;
	}
	public final String content;
	
	private MsgACtionEnum(Integer type, String content) {
		this.type =type;
		this.content =content;
	}
	public Integer getType() {
		return type;
	}  

}

package com.example.eleme.netty;

import java.util.HashMap;


import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.example.eleme.enums.MsgACtionEnum;
import com.example.eleme.pojo.ChatMsg;
import com.example.eleme.pojo.DataContent;
import com.example.eleme.service.impl.ChatSerciveImpl;
import com.example.eleme.service.model.IChatService;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.AsciiHeadersEncoder.NewlineType;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;



/**
 * 处理消息的handler，
 * TextWebSocketFrameL是用于websocket专门处理文本的对象，frames是消息的载体
 * @author krisk
 *
 */
@Service
public class chatHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
	
	//用于记录所有客户端的channel
	private static ChannelGroup clients =new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
	//用户channel和id的映射集和
	private static HashMap<String, Channel> UserChannelMap = new HashMap<>();
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
		//获取客户端传的信息
		String content = msg.text();
		System.out.println(content);
		Channel currentChannel = ctx.channel();
		JSONObject contentJsonObject = JSONObject.parseObject(content);
		DataContent dataContent = (DataContent) JSONObject.toJavaObject(contentJsonObject, DataContent.class);

		//判断消息类型
		Integer action = dataContent.getAction();
		if(action == MsgACtionEnum.CONNECT.type ) {
			//websocket第一次open，关联uerid和channel
			String senderId = dataContent.getChatMsg().getSenderId();
			UserChannelMap.put(senderId, currentChannel);
			//测试
			for (HashMap.Entry <String, Channel> entry: UserChannelMap.entrySet()) {
				System.out.println("UserId:" + entry.getKey()+",ChannelId: "+entry.getValue().id().asShortText());
			}
		} else if (action == MsgACtionEnum.CHAT.type) {
			IChatService chatService =new ChatSerciveImpl();
            //2.2.3 手动获取userService对象
//			ChatSerciveImpl chatService = (ChatSerciveImpl)SpringUtil.getBean("ChatSerciveImpl");
//            UsersMapper usersMapper = (UsersMapper) SpringUtil.getBean("usersMapper");
			//聊天类型消息，存数据库，标记状态的签收状态【未签收】
			ChatMsg chatMsg = dataContent.getChatMsg();
			String receiverId = chatMsg.getReceiverId();
			String msgId = chatService.saveMsg(chatMsg);
			chatMsg.setMsgId(msgId);
			//获取接收端channel
			Channel receiverChannel = UserChannelMap.get(receiverId);
			if (receiverChannel == null) {
				//用户离线，推送消息（Jpsuh，推送）
			}else {
				for(Channel channel : clients) {
					if(receiverChannel.equals(channel)) {
						receiverChannel.writeAndFlush(
								new TextWebSocketFrame(JSONObject.toJSONString(chatMsg)));
					}
				}
			}
		}else if (action == MsgACtionEnum.BROADCAST.type) {
			for (Channel channel:UserChannelMap.values()) {
				channel.writeAndFlush(new TextWebSocketFrame(JSONObject.toJSONString(dataContent.getChatMsg())));
			}
		}else if (action == MsgACtionEnum.KEEPALIVE.type) {
			//心跳类型消息
		}}
		
//		System.out.println(ctx.channel().id()+"接收到的数据"+content);
//		for (Channel channel : clients) {
//			if(ctx.channel().equals(channel)) {
//			channel.writeAndFlush(
//					new TextWebSocketFrame(
//							ctx.channel().id()+"发送消息为"+content));
//		}}
		//与上面for循环方法一致
//		clients.writeAndFlush(
//				 new TextWebSocketFrame("[服务器在]"+LocalDateTime.now()
//				 +"接收消息，消息为"+ content));
//	}
	/**
	 * 客户端连接服务器（打开连接后）
	 * 获取客户端的channel，放到channelGroup中管理
	 */
	@Override
	public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
		System.out.println(ctx.channel().remoteAddress()+"加入");
		clients.add(ctx.channel());
	}

	@Override
	public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
		//当触发handlerRemoved，channelGroup自动移除对应的channel
		//clients.remove(ctx.channel());
		String asShortText = ctx.channel().id().asShortText();
        System.out.println("客户端被移除，channelId为：" + asShortText);
        clients.remove(ctx.channel());
        for (HashMap.Entry <String, Channel> entry: UserChannelMap.entrySet()) {
			System.out.println("UserId:" + entry.getKey()+",ChannelId: "+entry.getValue().id().asShortText());
		}
		
	}

}

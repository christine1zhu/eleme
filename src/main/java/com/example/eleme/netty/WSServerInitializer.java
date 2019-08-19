package com.example.eleme.netty;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;

public class WSServerInitializer extends ChannelInitializer<SocketChannel>{

	@Override
	protected void initChannel(SocketChannel ch) throws Exception {
		// TODO Auto-generated method stub
		ChannelPipeline pipeline = ch.pipeline();
		//websocket基于http协议,http编解码器
		pipeline.addLast(new HttpServerCodec());
		//对写大数据流的支持
		pipeline.addLast(new ChunkedWriteHandler());
		//对httpmessage聚合，符合成fullhttprequest fullhttpresponse
		//几乎netty中所有编程，都会用到此handler
		pipeline.addLast(new HttpObjectAggregator(1024*64));
		
		//====以上用于支持http协议==
		/**
		 * websocket服务器处理的协议，指定给客户端的连接访问的路由：/ws
		 * 本handler帮助处理事情，
		 * 处理握手动作：handshaking close ping pong
		 * websocket 以frames形式传输，不同数据类型由不同的frames
		 */
		pipeline.addLast(new WebSocketServerProtocolHandler("/ws"));
		//自定义handler
		pipeline.addLast(new chatHandler());
	}

}

package com.example.eleme.netty;

import org.springframework.stereotype.Component;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

@Component
public class WSServer {
	
	private static class SingleletionWSServer{
		 static final WSServer instance = new WSServer();
	}
	
	public static WSServer getInstance() {
		return SingleletionWSServer.instance;	
	}
	
	private ServerBootstrap serverBootstrap;
	private EventLoopGroup mainGroup;
	private EventLoopGroup subGroup;
	private ChannelFuture future;
	
	
	public WSServer() {
		mainGroup = new NioEventLoopGroup();
		subGroup =new NioEventLoopGroup(); 
		serverBootstrap = new ServerBootstrap();
		serverBootstrap.group(mainGroup, subGroup)
		.channel(NioServerSocketChannel.class)
		.childHandler(new WSServerInitializer() );
	}
	
	public void start() {
		this.future =serverBootstrap.bind(8088);
		System.out.println("netty websocket server 启动");
	}
}

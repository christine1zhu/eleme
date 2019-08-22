package com.example.eleme;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.example.eleme.netty.WSServer;

@Component
public class NettyBooter implements ApplicationListener<ContextRefreshedEvent> {

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if (event.getApplicationContext().getParent()==null) {
		try {
			WSServer.getInstance().start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	}
}
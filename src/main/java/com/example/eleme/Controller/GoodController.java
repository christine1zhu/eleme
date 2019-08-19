package com.example.eleme.Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.eleme.pojo.Good;
import com.example.eleme.pojo.Store;
import com.example.eleme.service.model.IGoodService;

@RestController
public class GoodController {
	
	@Resource
	private IGoodService goodService;
	
	//获取商品类型
	@PostMapping("/goods")
	public List<Good> selectByshopId(HttpServletRequest request){
		String shopid = request.getParameter("shopid");
		System.out.println(shopid);
		List<Good> goodslist = goodService.selectByshopId(shopid);
		System.out.println("goods done==");
		return goodslist;
	}
	//获取某栏目下店铺信息
	@GetMapping("/storeinfo")
	public List<Store> selectById(HttpServletRequest request){
		String cardId = request.getParameter("cardId");
		String shopId =request.getParameter("shopId");
		List<Store> storelist;
		if(shopId==null) {
			//商家列表信息
			int fn =Integer.parseInt(request.getParameter("fn"));
			int offset = Integer.parseInt(request.getParameter("offset"));
			storelist= goodService.selectBycardId(cardId,offset,fn);
			System.out.println("storelist done==");
		} else {
			//单个商家信息
			storelist = goodService.selectBycardAndshopId(cardId,shopId);
			System.out.println("store done==");			
		}
		return storelist;		
	}
}

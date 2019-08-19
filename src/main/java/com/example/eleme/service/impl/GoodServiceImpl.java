package com.example.eleme.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.eleme.dao.GoodMapper;
import com.example.eleme.dao.StoreMapper;
import com.example.eleme.pojo.Good;
import com.example.eleme.pojo.Store;
import com.example.eleme.service.model.IGoodService;
@Service
public class GoodServiceImpl implements IGoodService  {
	@Resource
	private GoodMapper goodmapper;
	
	@Resource
	private StoreMapper storemapper;
	
	public List<Good> selectByshopId(String shopid){
		return this.goodmapper.selectByshopId(shopid);
	}
	
	public List<Store> selectBycardId(String cardId,int offset,int fn){
		return this.storemapper.selectBycardId(cardId,offset,fn);
	}
	
	public List<Store> selectBycardAndshopId(String cardId,String shopId){
		return this.storemapper.selectBycardAndshopId(cardId,shopId);
	}
}

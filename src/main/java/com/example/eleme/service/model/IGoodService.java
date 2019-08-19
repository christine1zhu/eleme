package com.example.eleme.service.model;

import java.util.List;

import com.example.eleme.pojo.Good;
import com.example.eleme.pojo.Store;

public interface IGoodService {
	public List<Good> selectByshopId(String shopid);
	
	public List<Store> selectBycardId(String cardId,int offset,int fn);
	
	public List<Store> selectBycardAndshopId(String cardId,String shopId);
}

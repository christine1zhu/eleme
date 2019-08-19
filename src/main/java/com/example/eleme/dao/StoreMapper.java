package com.example.eleme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import com.example.eleme.pojo.Store;

public interface StoreMapper {

	int deleteByPrimaryKey(String shopid);

	int insert(Store record);

	int insertSelective(Store record);

	Store selectByPrimaryKey(String shopid);

	int updateByPrimaryKeySelective(Store record);

	int updateByPrimaryKey(Store record);

    List<Store> selectBycardId(@Param("cardId") String cardId,@Param("offset") Integer offset,@Param("fn") Integer fn);
    
    List<Store> selectBycardAndshopId(@Param("cardId") String cardId,@Param("shopId") String shopId);
}
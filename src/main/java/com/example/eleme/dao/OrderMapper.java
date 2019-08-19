package com.example.eleme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.eleme.pojo.HistoryOrder;
import com.example.eleme.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer key);

	int insert(Order record);

	int insertSelective(Order record);

	Order selectByPrimaryKey(Integer key);

	int updateByPrimaryKeySelective(Order record);

	int updateByPrimaryKey(Order record);
	
	List<HistoryOrder> queryOrdersByUser(@Param("userId") Integer UserId);

	int updateByOrderId(@Param("stateString")String stateString, @Param("orderId")String order_id);

}
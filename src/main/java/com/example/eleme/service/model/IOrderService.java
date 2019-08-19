package com.example.eleme.service.model;

import java.util.List;
import java.util.Map;

import com.example.eleme.pojo.HistoryOrder;
import com.example.eleme.pojo.Order;

public interface IOrderService {
	public int insertOrder (Order order);

	public String CodeGenertor();
	
	public Map<String, List<HistoryOrder>> queryOrdersByUser(int UserId);

	public int updateOrderByConfirm(String stateString,String order_id);
}

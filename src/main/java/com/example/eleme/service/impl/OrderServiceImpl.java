package com.example.eleme.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.eleme.dao.OrderMapper;
import com.example.eleme.pojo.HistoryOrder;
import com.example.eleme.pojo.Order;
import com.example.eleme.service.model.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {
	@Resource
	private OrderMapper ordermapper;
	
	public static int[] nums = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    public static Random random = new Random();

    
	@Override
	public int insertOrder(Order order) {
		return this.ordermapper.insertSelective(order);
	}
	
	 public Map<String, List<HistoryOrder>> queryOrdersByUser(int userId) {
		 List<HistoryOrder> orginOrderList = this.ordermapper.queryOrdersByUser(userId);
		 Map<String, List<HistoryOrder>> resultMap =orginOrderList.stream()
				 .collect(Collectors.groupingBy(HistoryOrder::getOrder_id));
		 return resultMap;
		 
	}
	
	public String CodeGenertor() {
	 StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 11; i++) {
            int index = random.nextInt(10);
            builder.append(nums[index]);
        }
        return builder.toString();
    }

	@Override
	public int updateOrderByConfirm(String stateString,String order_id) {
		return ordermapper.updateByOrderId(stateString,order_id);
	}
}

package com.example.eleme.Controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.eleme.annotation.UserLoginToken;
import com.example.eleme.pojo.HistoryOrder;
import com.example.eleme.pojo.Order;
import com.example.eleme.service.model.IOrderService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@RestController
public class OrderController {
	
	@Resource
	private IOrderService orderService;
	
	@UserLoginToken
	@PostMapping("/pay")
	public int AddOrder(@RequestBody JSONObject jsonbody, HttpServletRequest request){
		JSONArray foodList= jsonbody.getJSONArray("foodlist");
		Order order = new Order();
		order.setCreateTime(new Date());
		order.setState("待发货");
		order.setStoreId(jsonbody.getString("seller"));
		order.setUserId(jsonbody.getInt("user"));
		String order_id = orderService.CodeGenertor();
		order.setOrder_id(order_id);
		for(int i=0;i<foodList.size();i++) {
			JSONObject food =  (JSONObject) foodList.get(i);
			order.setCount(food.getInt("count"));
			order.setGoodsId(food.getInt("id"));
			order.setPrice((float)food.getDouble("price"));
			order.setSumPrice((float)food.getDouble("sum_price"));
			int res = orderService.insertOrder(order);
			if(res==0) {
//				return 0;
			}
	}
		return 1;
	}
	
	@UserLoginToken
	@ResponseBody
	@GetMapping("/order")
	public Map<String, List<HistoryOrder>> queryOrdersByUser(@RequestParam(value = "userId") Integer id){
		try {
			Map<String, List<HistoryOrder>> orderlist = orderService.queryOrdersByUser(id);
//			System.out.println(orderlist);
			return orderlist;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@UserLoginToken
	@PostMapping("/comfirmOrder")
	public int updateOrderByConfirm (HttpServletRequest httpServletRequest) {
		String idString=httpServletRequest.getParameter("order_id");
		String stateString = "已确认";
		return orderService.updateOrderByConfirm(stateString,idString);
	}
}

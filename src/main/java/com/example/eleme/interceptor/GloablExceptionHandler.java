//package com.example.eleme.interceptor;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.alibaba.fastjson.JSONObject;
//
//@ControllerAdvice
//public class GloablExceptionHandler {
//	//内部改成message形式，不会返回到前端错误
////	 @ResponseBody
////	    @ExceptionHandler(Exception.class)
////	    public Object handleException(Exception e) {
////	        String msg = e.getMessage();
////	        if (msg == null || msg.equals("")) {
////	            msg = "服务器出错";
////	        }
////	        JSONObject jsonObject = new JSONObject();
////	        jsonObject.put("message", msg);
////	        return jsonObject;
////	    }
//	 @ResponseBody
//	    @ExceptionHandler(Exception.class)
//	    public void handleException(HttpServletResponse response,Exception e) {
//	        String msg = e.getMessage();
////	        System.out.println(msg);
////	        if (msg == null || msg.equals("")) {
////	            msg = "服务器出错";
////	        }
//	        if(msg=="401") {
//	        	response.setStatus(401); 
//	        }
////	        JSONObject jsonObject = new JSONObject();
////	        jsonObject.put("message", msg);
////	        return jsonObject;
//	    }
//}

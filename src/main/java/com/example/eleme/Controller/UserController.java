package com.example.eleme.Controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.example.eleme.annotation.UserLoginToken;
import com.example.eleme.pojo.HistoryMsg;
import com.example.eleme.pojo.MsgDB;
import com.example.eleme.pojo.User;
import com.example.eleme.service.impl.TokenServiceImpl;
import com.example.eleme.service.model.IChatService;
import com.example.eleme.service.model.IUserService;


@RestController
public class UserController {
	@Resource
	private IUserService userService; 
	@Resource 
	private TokenServiceImpl tokenService;
	@Resource
	private IChatService chatService;
	
	@ResponseBody
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		String username = request.getParameter("username");		
		String password = request.getParameter("password");	
		User user = userService.selectByUsername(username);
		if(user == null) {
			jsonObject.put("msg", "登录失败，用户不存在");
		}else {
			if(!user.getPassword().equals(password)) {
				jsonObject.put("msg", "登录失败，密码错误");
			}else {
				String token = tokenService.getToken(user);
				jsonObject.put("msg","success");
				jsonObject.put("token", token);
				jsonObject.put("user", user);
			}
		}
		return jsonObject.toString();
	}
	
	/**
	 * 获取好友列表里未读的历史数据的最新一条和个数,以及好友信息
	 * @param request
	 * @param response
	 * @return
	 */
	@UserLoginToken
	@ResponseBody
	@GetMapping("/friends")
	public List<HistoryMsg> querymyfriendList(@RequestParam(value = "my_id") String id) {
		List<HistoryMsg> historyMsgList = new ArrayList<>();
		try {
			List<User> friendList = userService.queryfriend(id);
			for(User friend:friendList) {
				HistoryMsg historyMsgs=new HistoryMsg();
				String friendIdString =friend.getId();
				HistoryMsg Msg = chatService.queryMsgNumber(id,friendIdString);	
				historyMsgs.setFriendImg(friend.getImg());
				historyMsgs.setFriendName(friend.getName());
				historyMsgs.setSenderId(friendIdString);
				if(Msg!=null) {
				historyMsgs.setMsg(Msg.getMsg());
				historyMsgs.setNumber(Msg.getNumber());
				}
				historyMsgList.add(historyMsgs);
			}
			return historyMsgList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @param file 图片文件
	 * @param userId 用户id
	 * @param path 图片存储路径
	 * @param request
	 * @return 更新图片信息
	 */
	@ResponseBody
	@PostMapping("/UpdateImg")
	public JSONObject UpdateImg(@RequestParam(value = "file") MultipartFile file,
			@RequestParam(value = "userid")String userId,
			@RequestParam(value="path") String path,
			HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		if(file.isEmpty()) {
			jsonObject.put("msg", "error");
		}
		String fileName = file.getOriginalFilename();
		String suffixName = fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID()+suffixName;
		File destFile = new File(path+"/"+fileName);
		if(!destFile.getParentFile().exists()) {
			destFile.getParentFile().mkdirs();
		}
		try {
			file.transferTo(destFile);
			System.out.println(destFile.toString());
			String imgUrlString="/static/UserImg/"+fileName;
			User user=userService.findUserById(userId);
			user.setImg(imgUrlString);
			int i = userService.updateUserById(user);
			if(i==1) {
				jsonObject.put("msg", "success");
				jsonObject.put("imgurl", imgUrlString);
			}else {
				jsonObject.put("msg", "error");
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 jsonObject.put("msg", "error");
			// TODO: handle exception
		} finally {
			return jsonObject;
		}
	}
	
	@RequestMapping(value="/UpdateUser", method = RequestMethod.POST)
	public int UpdateUser(HttpServletRequest request, HttpServletResponse response) {
		//法一，构建对象，一个个配置属性
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setId( request.getParameter("id"));
		user.setAge( Integer.parseInt(request.getParameter("age")));
		user.setPassword(request.getParameter("password"));
		System.out.println("get update done ---");
		System.out.println(user.toString());
		int i = userService.updateUserById(user);
		return i;
	}
	
	@PostMapping(value = "/queryMsg")
	public List<MsgDB> queryMsg(HttpServletRequest request) {
		String myIdString =request.getParameter("myId");
		String toIdString = request.getParameter("toId");
		List<MsgDB> msglist =null;
		try {
			msglist = chatService.queryMsg(myIdString,toIdString);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msglist;
	}
	
	@PostMapping(value = "/SignMsg")
	public int SignMsg(HttpServletRequest request) {
		String myIdString =request.getParameter("myId");
		String toIdString = request.getParameter("toId");
		String oldSign = "待读";
		String toSign ="已读";
		System.out.println(myIdString+toIdString);
		int i=chatService.updateflag(toSign,oldSign,myIdString,toIdString);
		return i;
	}
}

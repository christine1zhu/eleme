package com.example.eleme.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import org.n3r.idworker.Sid;//唯一订单号生成

import com.example.eleme.dao.MsgDBMapper;
import com.example.eleme.pojo.ChatMsg;
import com.example.eleme.pojo.HistoryMsg;
import com.example.eleme.pojo.MsgDB;
import com.example.eleme.service.model.IChatService;

@Service
public class ChatSerciveImpl implements IChatService {
	@Autowired
	private MsgDBMapper msgDBMapper;
	 @PostConstruct
	    public void init() {
		 chatSerciveImpl = this;
	    }

	public static ChatSerciveImpl chatSerciveImpl;

//	@Resource
//	private Sid sid;
	Sid sid =new Sid();
	@Override
	public String saveMsg(ChatMsg chatMsg) {
		MsgDB msgDB = new MsgDB();
		String msgId =this.sid.nextShort();
		msgDB.setChat_msg(chatMsg.getMsg());
		msgDB.setCreate_time(new Date());
		msgDB.setId(msgId);
		msgDB.setReceiver_id(chatMsg.getReceiverId());
		msgDB.setSender_id(chatMsg.getSenderId());
		msgDB.setSgin_flag("待读");
		chatSerciveImpl.msgDBMapper.insert(msgDB);
//		if (flag==1) {
			return msgId;
//		}else {
//			return null;
//		}
	}
	@Override
	public List<MsgDB> queryMsg(String myIdString, String toIdString) {
		List<MsgDB> MsgList =chatSerciveImpl.msgDBMapper.SelectbyId(myIdString,toIdString);
	return MsgList;
}
	@Override
	public int updateflag(String toSign, String oldSign, String myIdString, String toIdString) {
		return chatSerciveImpl.msgDBMapper.updateflagbyid(toSign,oldSign,myIdString,toIdString);
	}
	

	@Override
	public HistoryMsg queryMsgNumber(String my_id, String friend_id) {
		HistoryMsg historyMsg = new HistoryMsg();
		historyMsg=chatSerciveImpl.msgDBMapper.queryMsgNumber(my_id,friend_id);
		return historyMsg;
	}
}
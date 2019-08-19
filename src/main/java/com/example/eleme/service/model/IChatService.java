package com.example.eleme.service.model;

import java.util.List;

import com.example.eleme.pojo.ChatMsg;
import com.example.eleme.pojo.HistoryMsg;
import com.example.eleme.pojo.MsgDB;

public interface IChatService {
	public String saveMsg(ChatMsg chatMsg);

	public List<MsgDB> queryMsg(String myIdString, String toIdString);

	public int updateflag(String toSign, String oldSign, String myIdString, String toIdString);

	public HistoryMsg queryMsgNumber(String my_id, String friendIdString); 
}

package com.example.eleme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.eleme.pojo.HistoryMsg;
import com.example.eleme.pojo.MsgDB;

public interface MsgDBMapper {
    int deleteByPrimaryKey(String id);

    int insert(MsgDB record);

    int insertSelective(MsgDB record);

    MsgDB selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(MsgDB record);

    int updateByPrimaryKey(MsgDB record);

	List<MsgDB> SelectbyId(@Param("myIdString") String myIdString, @Param("toIdString") String toIdString);

	int updateflagbyid(@Param("toSign") String toSign, @Param("oldSign") String oldSign, @Param("myIdString") String myIdString, @Param("toIdString") String toIdString);

	HistoryMsg queryMsgNumber(@Param("my_id") String my_id, @Param("friend_id") String friendString);
}
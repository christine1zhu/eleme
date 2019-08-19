package com.example.eleme.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.eleme.dao.CardMapper;
import com.example.eleme.pojo.Card;
import com.example.eleme.service.model.ICardService;

@Service
public class CardServiceImpl implements ICardService {
	@Resource
	private CardMapper cardmapper;
	
	public List<Card> selectall(){
		return this.cardmapper.selectall();
	}

}

package com.example.eleme.Controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.eleme.pojo.Card;
import com.example.eleme.service.model.ICardService;

@RestController
public class CardController {
	@Resource
	private ICardService cardService;
	
	@GetMapping("/cardinfo")
	public List<Card> queryCardAll(){
		List<Card> cardinfo = cardService.selectall();
		return cardinfo;
	}
	
}

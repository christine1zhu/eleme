package com.example.eleme.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.example.eleme.dao.TestMapper;
import com.example.eleme.pojo.Test;
import com.example.eleme.service.model.ITestService;


@Service
public class TestServicelmpl implements ITestService{
	@Resource
	private TestMapper testmapper;
	@Override
	public List<Test> findUsers(){
		return this.testmapper.selectAll( );
	}
}

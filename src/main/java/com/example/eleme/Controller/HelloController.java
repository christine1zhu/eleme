package com.example.eleme.Controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.eleme.pojo.Test;
import com.example.eleme.service.model.ITestService;

@CrossOrigin
@RestController
public class HelloController {
	
	@Resource
	private JdbcTemplate jdbcTmp;
	
	@Resource
	private ITestService testService;
	
	@RequestMapping("/")
	public String index() {
		return "Welcome zhuzhu";
	}
	
	@ResponseBody
	@RequestMapping(value = "/testmysql",method = RequestMethod.GET)
	public List<Test> testMysql() {
		System.out.println("get testmysql done---");
		List<Test> testlist = testService.findUsers();
		return testlist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public List<Map<String, Object>> testTemplate(HttpServletRequest request, HttpServletResponse response) {
		 List<Map<String, Object>> list = jdbcTmp.queryForList("select * from user");
	        return list;
	}
}

package com.example.eleme;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.ResponseBody;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ElemeApplicationTests {
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Test
	public void contextLoads() {
	}
	
	@ResponseBody
	@Test
	public void testMysql() {
		List<Map<String, Object>> result = jdbcTemplate.queryForList("select * from testmysql");
		System.out.println("query result is " + result.size());
		System.out.println("success");
	}
}

package com.example.eleme.service.impl;

import java.util.Date;
import org.springframework.stereotype.Service;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.eleme.pojo.User;

@Service
public class TokenServiceImpl {
	final static long TOKEN_EXP = 1000 * 60 *30;//过期时间,测试使用十分钟
    public String getToken(User user) {
//        Algorithm algorithm = Algorithm.HMAC256(user.getPassword());
//        Date expiresDate= new Date(System.currentTimeMillis()+TOKEN_EXP);
//        Map<String, Object> header = new HashMap<>(2);
//        header.put("typ", "JWT");
//        header.put("alg", "HS256");
//        // 附带username，userId信息，生成签名
//        String token = JWT.create()
//                .withHeader(header)
//                .withClaim("userId", user.getId())
//                .withClaim("username",user.getName())
//                //.withAudience(user.getId()())
//                .withExpiresAt(expiresDate)
//                .sign(algorithm);
       System.out.println(new Date(System.currentTimeMillis()+TOKEN_EXP));
       String token= JWT.create().withAudience(user.getId())// 将 user id 保存到 token 里面
        		.withExpiresAt(new Date(System.currentTimeMillis()+TOKEN_EXP))//过期时间
                .sign(Algorithm.HMAC256(user.getPassword()));// 以 password 作为 token 的密钥
        return token;
    }
}

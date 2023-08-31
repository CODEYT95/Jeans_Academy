package com.project.jeans;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
public class JeansApplication {

	public static void main(String[] args) {
		SpringApplication.run(JeansApplication.class, args);
	}

}

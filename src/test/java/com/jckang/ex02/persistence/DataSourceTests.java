package com.jckang.ex02.persistence;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.fail;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class DataSourceTests {
	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
	@Test
	public void testConnection() {
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection con = dataSource.getConnection();) {
			log.info(session);
			log.info(con);
		} catch (SQLException e) {
			fail(e.getMessage());
			e.printStackTrace();
		}
		
	}
}

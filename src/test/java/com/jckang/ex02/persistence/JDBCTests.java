package com.jckang.ex02.persistence;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.fail;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		String url = "jdbc:oracle:thin:@test_medium?TNS_ADMIN=/home/opc/Dev/Oracle/Wallet/Wallet_test";
		String id = "ADMIN";
		String password ="Oracledb!486@";
		try(Connection con = DriverManager.getConnection(url, id, password)){
			log.info(con);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			fail("error occured");
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {

		}
	}
}

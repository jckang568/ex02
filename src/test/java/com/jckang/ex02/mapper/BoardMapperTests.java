package com.jckang.ex02.mapper;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.jckang.ex02.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	/*
	 * @Test public void testGetList() { mapper.getList().forEach(board ->
	 * log.info(board)); }
	 */

	/*
	 * @Test public void testInsert() { BoardVO board = new BoardVO();
	 * board.setTitle("새로 작성하는 글"); board.setContent("새로 작성하는 내용");
	 * board.setWriter("newbie"); mapper.insert(board); log.info(board); }
	 */

	/*
	 * @Test public void testRead() { // 존재하는 게시물 번호로 테스트 BoardVO board =
	 * mapper.read(5L); log.info(board); }
	 */
	
	/*
	 * @Test public void testDelete() { log.info("DELETE COUNT: " +
	 * mapper.delete(3L)); }
	 */
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
}

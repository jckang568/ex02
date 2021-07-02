package com.jckang.ex02.mapper;

import java.util.List;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.domain.Criteria;

public interface BoardMapper {
	// @Select("SELECT * FROM TBL_BOARD WHERE BNO > 0")
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria criteria);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);

	public int getTotalCount(Criteria criteria);
}

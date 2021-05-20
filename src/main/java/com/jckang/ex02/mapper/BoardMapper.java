package com.jckang.ex02.mapper;

import java.util.List;

import com.jckang.ex02.domain.BoardVO;

public interface BoardMapper {
	// @Select("SELECT * FROM TBL_BOARD WHERE BNO > 0")
	public List<BoardVO> getList();
}

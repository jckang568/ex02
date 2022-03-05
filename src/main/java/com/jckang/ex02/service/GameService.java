package com.jckang.ex02.service;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.domain.Criteria;

import java.util.List;

public interface GameService {
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria criteria);

	public int getTotal(Criteria criteria);
}

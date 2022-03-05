package com.jckang.ex02.service.impl;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.domain.Criteria;
import com.jckang.ex02.mapper.BoardMapper;
import com.jckang.ex02.service.BoardService;
import com.jckang.ex02.service.GameService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
public class GameServiceImpl implements GameService {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {

	}

	@Override
	public BoardVO get(Long bno) {
		return null;
	}

	@Override
	public boolean modify(BoardVO board) {
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}

	@Override
	public List<BoardVO> getList(Criteria criteria) {
		return null;
	}

	@Override
	public int getTotal(Criteria criteria) {
		return 0;
	}
}

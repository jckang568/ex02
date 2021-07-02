package com.jckang.ex02.service.impl;

import java.util.List;

import com.jckang.ex02.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.mapper.BoardMapper;
import com.jckang.ex02.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("BoardServiceImpl < register passed..................." + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("BoardServiceImpl < get passed................." + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("BoardServiceImpl < modify passed................." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("BoardServiceImpl < remove passed................." + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria criteria) {
		log.info("BoardServiceImpl < getList passed................." + criteria);
		return mapper.getListWithPaging(criteria);
	}

	@Override
	public int getTotal(Criteria criteria) {
		log.info("BoardServiceImpl < getTotal passed................." + criteria);
		return mapper.getTotalCount(criteria);
	}
	/*
	@Override
	public List<BoardVO> getList() {
		log.info("BoardServiceImpl < getList passed.................");
		return mapper.getList();
	}
	*/
}

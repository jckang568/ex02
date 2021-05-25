package com.jckang.ex02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	@GetMapping("/list")
	public void list(Model model) {
		log.info("BoardController < list passed.......................");
		model.addAttribute("list", service.getList());
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		/*
		 * String 으로 반환 시 'redirect:' 접두어를 사용하는데 이를 이용하면 스프링 MVC가 내부적으로
		 * response.sendRedirect()를 처리해 주기 때문에 편리합니다.
		 */
		return "redirect:/board/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get passed....................");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove passed................." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}

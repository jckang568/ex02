package com.jckang.ex02.controller;

import com.jckang.ex02.domain.Criteria;
import com.jckang.ex02.domain.PageDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jckang.ex02.domain.BoardVO;
import com.jckang.ex02.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.io.File;

@Controller
@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
    private BoardService service;

	/*
	@GetMapping("/list")
	public void list(Model model) {
		log.info("BoardController < list passed.......................");
		model.addAttribute("list", service.getList());
	}
	*/

    @GetMapping("/list")
    public void list(Criteria criteria, Model model) {
        log.info("BoardController < list passed......................." + criteria);
        model.addAttribute("list", service.getList(criteria));
        /*model.addAttribute("pageMaker", new PageDTO(criteria, 123));*/
        int total = service.getTotal(criteria);
        log.info("total: " + total);
        model.addAttribute("pageMaker", new PageDTO(criteria, total));
    }

    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr) {
        log.info("register : " + board);
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        rttr.addFlashAttribute("service", "register");
        /*
         * String 으로 반환 시 'redirect:' 접두어를 사용하는데 이를 이용하면 스프링 MVC가 내부적으로
         * response.sendRedirect()를 처리해 주기 때문에 편리합니다.
         */
        return "redirect:/board/list";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or modify passed....................");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("modify:" + board);
        if (service.modify(board)) {
            rttr.addFlashAttribute("result", board.getBno());
            rttr.addFlashAttribute("service", "modify");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("remove passed................." + bno);
        if (service.remove(bno)) {
            rttr.addFlashAttribute("result", bno);
            rttr.addFlashAttribute("service", "remove");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/board/list";
    }

    @GetMapping("/register")
    public void register() {

    }

}

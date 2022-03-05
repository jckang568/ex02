package com.jckang.ex02.controller;

import com.jckang.ex02.service.GameService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/game/*")
@AllArgsConstructor
public class GameController {
    private final GameService gameService;

    @GetMapping("/guesswhat")
    public void init(Model model) {
        model.addAttribute("test", "hahaha");
    }
}


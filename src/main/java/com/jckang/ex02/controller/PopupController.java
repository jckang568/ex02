package com.jckang.ex02.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/popup/*")
@AllArgsConstructor
public class PopupController {

    @GetMapping("/map")
    public void map(Model model) {
        log.info("map passed");
    }
}

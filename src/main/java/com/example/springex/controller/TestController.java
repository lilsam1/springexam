package com.example.springex.controller;

import com.example.springex.dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j2
public class TestController {
    @GetMapping("/test01")
    public void test() {
        log.info("GET test01 todo register...");
    }

    @PostMapping("/test02")
    public void test(TodoDTO todoDTO, Model model) {
        log.info("POST test register");
        model.addAttribute("todoDTO", todoDTO);
    }
}

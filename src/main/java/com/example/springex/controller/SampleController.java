package com.example.springex.controller;

import com.example.springex.dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@Controller
@Log4j2
public class SampleController {
    @GetMapping("/hello")
    public void hello() {
        log.info("hello...");
    }

    @GetMapping("/ex1")
    public void ex1(String name, int age) {
        log.info("ex1...");
        log.info("name: " + name);
        log.info("age: " + age);
    }

    @GetMapping("/ex2")
    public void ex2(@RequestParam(name = "name", defaultValue = "aaa") String name,
                    @RequestParam(name = "age", defaultValue = "16") int age) {
        log.info("ex2...");
        log.info("name: " + name);
        log.info("age: " + age);
    }

    @GetMapping("/ex3")
    public void ex3(LocalDate dueDate) {
        log.info("ex3...");
        log.info("dueDate: " + dueDate);
    }

    @GetMapping("/ex4")
    public void ex4(Model model) {
        log.info("----------");
        model.addAttribute("message", "Hello World");
    }

    @GetMapping("/ex4_1")
    // 자동으로 생성된 변수명 todoDTO 외에 다른 이름으로 사용하고 싶으면 명시적으로 @ModelAttribute()를 지정
    // 아래의 경우 JSP에서 ${dto}와 같은 이름의 변수로 처리 가능
    public void ex4Extra(@ModelAttribute("dto") TodoDTO todoDTO, Model model) {
        log.info(todoDTO);
    }

    @GetMapping("/ex5")
    // addAttribue() 리다이렉트할 떄 쿼리 스트링이 되는 값을 지정. 데이터를 추가하면 리다이렉트할 URL에 쿼리 스트링으로 추가됨
    // addFlashAttribute() 일회용으로만 데이터를 전달하고 삭제되는 값을 지정. URL에 보이지는 않지만 JSP에서 일회용으로 사용할 수 있음
    public String ex5(RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("name", "ABC");
        redirectAttributes.addFlashAttribute("result", "success");

        return "redirect:/ex6";
    }

    @GetMapping("/ex6")
    public void ex6() {

    }
}

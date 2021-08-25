package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz03Controller_DisplayJspViewWithViewResolver {
	
	//http://localhost/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String ex02() {
		
		return "lesson01/quiz03";
	}
}

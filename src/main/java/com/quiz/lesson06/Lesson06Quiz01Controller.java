package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson06/Quiz01")
@Controller
public class Lesson06Quiz01Controller {
	
	// URL: localhost:88/lesson06/Quiz01/addFavorite
	@RequestMapping("/addFavorite")
	public String addFavorite (
				
			) {
		return "lesson06/addFavorite";
	}
	
}

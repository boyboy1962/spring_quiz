package com.quiz.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.favoriteBO;

@RequestMapping("/lesson06/Quiz02")
@Controller
public class Lesson06Quiz02Controller {
	
	@Autowired
	private favoriteBO favoriteBO;
	
	// URL: localhost:88/lesson06/Quiz02/addFavoriteView2
		@RequestMapping("/addFavoriteView2")
		public String addFavorite (
					
				) {
			return "lesson06/addFavoriteNew";
		}
		
		@RequestMapping("/isDuplication")
		@ResponseBody
		public Map<String, Boolean> isDuplication(
					@RequestParam("url") String url
				){
			// SELECT DB - url
			boolean duplicated = favoriteBO.existFavoriteByUrl(url);
			
			Map<String, Boolean> result = new HashMap<>();
			result.put("is_duplication", duplicated);
			
			return result;
		}
}

package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.favoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/Quiz01")
@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	private favoriteBO favoriteBO;
	
	// URL: localhost:88/lesson06/Quiz01/addFavorite
	@RequestMapping("/addFavoriteView")
	public String addFavorite (
				
			) {
		return "lesson06/addFavorite";
	}
	
	// submit : Controller -> view 리턴(화면으로 보낸다)
	// ajax: @Controller + @ ResponseBody -> String, JSON(데이터만 보낸다)
	
	@ResponseBody //이거 않하면 ajax가 작동하지 않는다. (404 에러가 뜨며 )
	@PostMapping("/addFavorite")
	public Map<String, String> addFavorite(
				@RequestParam("name") String name
				, @RequestParam("url") String url
			) {
		// DB INSERT
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
		
		
	}
	
	@RequestMapping("/favoriteList")
	public String favoriteList(Model model) {
		// DB에서 즐겨 찾기 목록을 Select
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		// model 객체에 저장한다.
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/favoriteList";
	}
	
	@PostMapping("/check_duplication_url")
	@ResponseBody
	public Map<String, Boolean> checkDuplicationUrl(
				@RequestParam("url") String url
			) {
		// url DB 조회 중복 체크
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		
		// 결과 map 구성
		
		Map<String, Boolean>  result = new HashMap<>();
		result.put("isDuplication", false);
		
		if (favorite != null) {			
			result.put("isDuplication", true);		
		}
		return result;
		
	}
	
}

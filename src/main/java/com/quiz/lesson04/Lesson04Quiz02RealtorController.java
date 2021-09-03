package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	//요청 URL: http://localhost:88/lesson04/quiz02/1
	@RequestMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	
	//요청 URL: http://localhost/lesson04/quiz02/add_realtor
	@RequestMapping("/add_realtor")
	public String addRealtor (
				@ModelAttribute Realtor realtor
				,Model model
			) {
		// DB INSERT
		realtorBO.addRealtor(realtor);
		
		// DB SELECT
		Realtor realtor2 = realtorBO.getRealtorById(realtor.getId());
		
		// VIEW 데이터 세팅(model)
		model.addAttribute("realtor", realtor2);
		
		return "lesson04/afterRealtor";
	}
	
	// 짠 수업내용을 올리기 위해 그냥 작성하는 주석이야 무시하렴
	
	
}

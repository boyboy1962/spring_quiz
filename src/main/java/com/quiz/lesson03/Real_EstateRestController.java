package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.Real_EstateBO;
import com.quiz.lesson03.model.Real_Estate;

@RestController
public class Real_EstateRestController {
	
	@Autowired
	private Real_EstateBO  real_EstateBO;
	
	// url: http://localhost:88/lessson03/quiz01/1?id=#
	@RequestMapping("/lesson03/quiz01/1")
	public Real_Estate quiz01(
			@RequestParam("id") int id
			) {
		Real_Estate real_estate = real_EstateBO.getReal_EstateById(id);
		return real_estate;
	}
}

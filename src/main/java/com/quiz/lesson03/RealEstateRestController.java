package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO  realEstateBO;
	
	// url: http://localhost:88/lessson03/quiz01/1?id=#
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam("id") int id
			) {
		RealEstate realEstate = realEstateBO.getRealEstateById(id);
		return realEstate;
	}
	
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rentPrice") int rentPrice
			) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateByRentPrice(rentPrice);
		return realEstate;
	}

	
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam("price") int price,
			@RequestParam("area") int area
			) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateByAreaAndPrice(area, price);
		return realEstate;
	}	
}

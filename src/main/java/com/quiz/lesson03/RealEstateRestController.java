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
	
	// url: http://localhost:88/lesson03/quiz01/1?id=#
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
	
//	// url: http://localhost:88/lesson03/quiz02/1
//	@RequestMapping("/lesson03/quiz02/1")
//	public String quiz02_1() {
//		RealEstate realEstate = new RealEstate();
//		realEstate.setRealtorId(3);
//		realEstate.setAddress("푸르지용 리버 303동 1104호");
//		realEstate.setArea(89);
//		realEstate.setType("매매");
//		realEstate.setPrice(1000000);
//		realEstate.setRentPrice(null);
//		
//		int rowCount = realEstateBO.addRealEstate(realEstate);
//		
//		return "성골 : " + rowCount;
//	}
}

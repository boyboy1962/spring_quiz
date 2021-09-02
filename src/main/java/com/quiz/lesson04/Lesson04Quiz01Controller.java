package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// 요청 URL : http://localhost:88/lesson04/quiz01/1
	@RequestMapping("/1")
	public String ex01_1() {
		return "lesson04/addSeller";
	}
	
	//@RequestMapping("/add_seller") //이것은 get도 받는 것이 가능하다.
	@PostMapping("/add_seller")
	public String addSeller(
				@RequestParam("nickname") String nickname,
				//@RequestParam("profileImageUrl") String profileImageUrl, // 해당 방식은 필수 방식이다.
				@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
				@RequestParam("temperature") double temperature
			) {
		Seller seller = new Seller();
		seller.setNickname(nickname);
		seller.setProfileImageUrl(profileImageUrl);
		seller.setTemperature(temperature);
		
		int rowCount = sellerBO.addSeller(seller);
		
		return "lesson04/afterAddSeller";
		
	}
	
	@GetMapping("/seller_info")
	public String getLastSeller(
				Model model,
				@RequestParam(value = "id", required = false) Integer id
			) {
		
		Seller seller = new Seller();
		
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		
		
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/lastSeller";
		
		
		
		// 여기에 seller 정보 받기
		
		
	}
}

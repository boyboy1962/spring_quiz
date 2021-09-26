package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
@RequestMapping("/lesson06/quiz03")
public class Lesson06Quiz03Controller {
	
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/bookingMain")
	public String booking () {
		
		return "lesson06/booking";
	}
	
	@RequestMapping("/bookingList")
	public String bookingList (Model model) {
		
		// DB select
		List<Booking> bookingList = bookingBO.getBookingList();
	
		// model에 저장
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/bookingList";
	}
	
	@RequestMapping("/bookingNow")
	public String bookingNow () {
		
		return "lesson06/bookingAdd";
	}
	@ResponseBody
	@PostMapping("/addBooking")
	public Map<String, String> addBooking(
			Booking booking
//			@RequestParam("name") String name
//			, @RequestParam("headcount") int headcount
//			, @RequestParam("day") int day
//			, @RequestParam("date") String date
//			, @RequestParam("phoneNumber") String phoneNumber
			) {
		// DB Insert
		bookingBO.addBooking(booking);
		
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/deleteBooking")
	public Map<String, String> deleteBooking(
				@RequestParam("bookingId") int id
			) {
		
		// DB Delete
		bookingBO.removeBookingById(id);
		
		System.out.print("!@#$%^&*" + id);
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson06/quiz03/findBooking")
	public Map<String, Object> findBooking(// MAP으로 바꿔야 할 수 도 있음
				@RequestParam("bookingName") String name
				, @RequestParam("bookingPhone") String phone
			) { 
		
		Booking bookingInfo = new Booking();
		
		bookingInfo = bookingBO.findBookingByNameAndPhone(name, phone);
		
		Map<String, Object> infoList = new HashMap<>();
		infoList.put("name", bookingInfo.getName());
		infoList.put("headcount", bookingInfo.getHeadcount());
		infoList.put("day", bookingInfo.getDay());
		infoList.put("date", bookingInfo.getDate());
		infoList.put("phoneNumber", bookingInfo.getPhoneNumber());
		infoList.put("state", bookingInfo.getState());
		
		return infoList;
	}
	
}

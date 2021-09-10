package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherBO;
import com.quiz.lesson05.model.WeatherHistory;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherBO weatherBO;
	
	@RequestMapping("/weather")
	public String weather(
				Model model
			) {
		//select
		List<WeatherHistory> weatherHistoryList = weatherBO.getWeather();
		//model에 담는다.
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		
		
		return "weather/koreaMeteorologicalAdministrationMainPage";
	}
	
	@RequestMapping("/addWeather")
	public String addWeather() {
		
		return "weather/addWeatherPage";
	}
	
	@RequestMapping("/afterAddWeather")
	public String afterAddWeather(
			@ModelAttribute WeatherHistory weather
			) {
		
		weatherBO.addWeather(weather);
		
		return "redirect:/weather";
	}
	
	
}

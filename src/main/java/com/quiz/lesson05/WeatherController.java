package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {
	
	@RequestMapping("/weather")
	public String weather() {
		
		return "weather/koreaMeteorologicalAdministrationMainPage";
	}
	
	@RequestMapping("/addWeather")
	public String addWeather() {
		
		return "weather/addWeatherPage";
	}
}

package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherDAO;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class WeatherBO {

	@Autowired
	WeatherDAO weatherDAO;
	
	public List<WeatherHistory> getWeather() {
		return weatherDAO.selectWeather();
	}

	public void addWeather(WeatherHistory weather) {
		weatherDAO.insertWeather(weather);
		
	}

}

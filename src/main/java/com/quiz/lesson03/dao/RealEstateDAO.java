package com.quiz.lesson03.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstateById(int id);
	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice);
	public List<RealEstate> selectRealEstateByAreaAndPrice(int area, int price);
}

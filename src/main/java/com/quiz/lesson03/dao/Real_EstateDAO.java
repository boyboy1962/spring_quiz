package com.quiz.lesson03.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.Real_Estate;

@Repository
public interface Real_EstateDAO {
	public Real_Estate selectReal_EstateById(int id);
}

package com.quiz.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public Booking selectBookingByNameAndPhone(String name, String phone);

	public List<Booking> selectBookingList();

	public void insertBooking(Booking booking);

	public void deleteBookingById(int id);

	
	
	
	
}

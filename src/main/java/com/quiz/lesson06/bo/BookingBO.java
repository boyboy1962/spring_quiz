package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.model.Booking;
import com.quiz.lesson06.dao.BookingDAO;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}

	public void addBooking(Booking booking) {
		bookingDAO.insertBooking(booking);
	}

	public void removeBookingById(int id) {
		bookingDAO.deleteBookingById(id);
	}

	public Booking findBookingByNameAndPhone(String name, String phone) {
		return bookingDAO.selectBookingByNameAndPhone(name, phone);
	}
	
	
}

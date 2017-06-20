package com.rental.car.service;

import java.util.List;

import com.rental.car.domain.Car;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;

public interface ReservationService {

	public Reservation save(Reservation reservation);

	public Reservation getById(String id);

	public Reservation deleteByReservation(Reservation reservation);

	public Reservation deleteById(String id);

	public List<Reservation> getAllReservation();

	public List<Car> getQueryReturnCar(Reservation reservation);

	public List<Reservation> getActiveReservation();

	public List<Reservation> getReservationListByUser(User user);

	public void getUpdateAllReservationByCar();

	public List<Reservation> getApprovalReservationListByUser(String username);
	
	public void getReservationApprovalUpdate(String id,Boolean approvalStatus);

	public void getReservationCarHireUpdate(Reservation reservation);

}

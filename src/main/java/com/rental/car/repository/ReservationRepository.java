package com.rental.car.repository;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.rental.car.domain.Car;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;

public interface ReservationRepository {

	public Reservation save(Reservation reservation);

	public Reservation getById(String id);

	public Reservation deleteByReservation(Reservation reservation);

	public Reservation deleteById(String id);

	public List<Reservation> getAllReservation();

	public List<Car> getQueryReturnCar(Reservation reservation);

	public List<Car> getQueryBySelectedState(Reservation reservation);

	public List<Reservation> getActiveReservation();

	public AggregationResults<Reservation> getDateQueryByReservation(Reservation reservation);

	public void getCarHireUpdate();

	public List<Reservation> getReservationListByUser(User user);

	public void getUpdateAllReservationByCar();
	
	public List<Reservation> getApprovalReservationListByUser(String username);
	
	public void getReservationApprovalUpdate(String id,Boolean ApprovalStatus);

	public void getReservationCarHireUpdate(Reservation reservation);

}

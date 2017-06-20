package com.rental.car.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.rental.car.domain.Car;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;
import com.rental.car.repository.ReservationRepository;
import com.rental.car.service.ReservationService;

@Service
@Component
public class ReservationServiceImpl implements ReservationService {

	private ReservationRepository reservationRepository;

	@Autowired
	public ReservationServiceImpl(ReservationRepository reservationRepository) {
		super();
		this.reservationRepository = reservationRepository;
	}

	@Override
	public Reservation save(Reservation reservation) {
		return reservationRepository.save(reservation);
	}

	@Override
	public Reservation getById(String id) {
		return reservationRepository.getById(id);
	}

	@Override
	public Reservation deleteByReservation(Reservation reservation) {
		return reservationRepository.deleteByReservation(reservation);
	}

	@Override
	public Reservation deleteById(String id) {
		return reservationRepository.deleteById(id);
	}

	@Override
	public List<Reservation> getAllReservation() {
		return reservationRepository.getAllReservation();
	}

	@Override
	public List<Car> getQueryReturnCar(Reservation reservation) {
		return reservationRepository.getQueryReturnCar(reservation);
	}

	public ReservationRepository getReservationRepository() {
		return reservationRepository;
	}

	public void setReservationRepository(ReservationRepository reservationRepository) {
		this.reservationRepository = reservationRepository;
	}

	public ReservationServiceImpl() {

	}

	@Override
	public List<Reservation> getActiveReservation() {
		return reservationRepository.getActiveReservation();
	}

	@Override
	public List<Reservation> getReservationListByUser(User user) {
		return reservationRepository.getReservationListByUser(user);
	}

	@Override
	public void getUpdateAllReservationByCar() {
		reservationRepository.getUpdateAllReservationByCar();
	}

	@Override
	public List<Reservation> getApprovalReservationListByUser(String username) {
		return reservationRepository.getApprovalReservationListByUser(username);
	}

	@Override
	public void getReservationApprovalUpdate(String id,Boolean approvalStatus) {
		reservationRepository.getReservationApprovalUpdate(id,approvalStatus);
	}

	@Override
	public void getReservationCarHireUpdate(Reservation reservation) {
		reservationRepository.getReservationCarHireUpdate(reservation);
	}
}

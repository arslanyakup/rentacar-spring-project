package com.rental.car.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;

import com.rental.car.domain.Car;
import com.rental.car.domain.Location;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;
import com.rental.car.repository.ReservationRepository;
import com.rental.car.service.CarService;
import com.rental.car.service.LocationService;
import com.rental.car.service.ReservationService;
import com.rental.car.service.UserService;

public class TestClass {

	public static void main(String[] args) throws ParseException {

		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("META-INF/servlet-context.xml");
		CarService carService = applicationContext.getBean(CarService.class);
		LocationService locationService = applicationContext.getBean(LocationService.class);
		// AddressService addressService =
		// applicationContext.getBean(AddressService.class);
		ReservationService reservationService = applicationContext.getBean(ReservationService.class);
		ReservationRepository reservationRepository = applicationContext.getBean(ReservationRepository.class);
		UserService userService = applicationContext.getBean(UserService.class);

		for (Car c:carService.getCarListByRankAndSelectedCity("arslanyakup")){
			System.out.println(c);
		}



		SimpleDateFormat dateFormat = new SimpleDateFormat("d/MM/y");
		String datep1 = "05/03/2017 10:50";
		String datep2 = "08/03/2017 10:50";
		String datep3 = "13/03/2017 10:50";
		String datep4 = "15/03/2017 10:50";
		String datep5 = "25/03/2017 10:50";
		String datep6 = "30/03/2017 10:50";
		String datep7 = "08/04/2017 10:50";
		String datep8 = "19/04/2017 10:50";
		String datep9 = "07/05/2017 10:50";
		String datep10 = "09/05/2017 10:50";
		Date date1 = dateFormat.parse(datep1);
		Date date2 = dateFormat.parse(datep2);
		Date date3 = dateFormat.parse(datep3);
		Date date4 = dateFormat.parse(datep4);
		Date date5 = dateFormat.parse(datep5);
		Date date6 = dateFormat.parse(datep6);
		Date date7 = dateFormat.parse(datep7);
		Date date8 = dateFormat.parse(datep8);
		Date date9 = dateFormat.parse(datep9);
		Date date10 = dateFormat.parse(datep10);
//		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy h:mm");
//		LocalDate first = LocalDate.parse(datep9, dateTimeFormatter);
//		LocalDate second = LocalDate.parse(datep10, dateTimeFormatter);
//
//		long days = ChronoUnit.DAYS.between(first, second);
//		System.out.println(days);

//		Car car1 = carService.findOne("58adb6b14c44313198d4ac34");
//		Car car2 = carService.findOne("58adb6f14c44313198d4ac35");
//		Car car3 = carService.findOne("58adb7234c44313198d4ac36");
//		Car car4 = carService.findOne("58adb7464c44313198d4ac37");
//		Car car5 = carService.findOne("58adb76b4c44313198d4ac38");
//		Car car6 = carService.findOne("58adb7b34c44313198d4ac3a");
//		Car car7 = carService.findOne("58adb7d34c44313198d4ac3b");
//		Car car8 = carService.findOne("58adb81b4c44313198d4ac3e");
//
//		Location location1 = locationService.getLocation("58adeac84c443135704735de");
//		Location location2 = locationService.getLocation("58adeae84c443135704735df");
//		Location location3 = locationService.getLocation("58adeafa4c443135704735e0");
//		Location location4 = locationService.getLocation("58adebad4c443135704735e1");
//
//		User hakan = userService.getUser("58b732867667751544712da6");
//		User yakup = userService.getUser("58b83bc67667750f68e092a0");
//		User mehmet = userService.getUser("58bd681736867a1eb882c79b");
//
//		Reservation reservation1 = new Reservation(car8, location1, date1, date2, hakan);
//		Reservation reservation2 = new Reservation(car4, location3, date3, date4, mehmet);
//		Reservation reservation3 = new Reservation(car3, location2, date5, date6, mehmet);
//		Reservation reservation4 = new Reservation(car6, location4, date7, date8, yakup);
//		Reservation reservation5 = new Reservation(car7, location2, date9, date10, hakan);
//		Reservation reservation6 = new Reservation(car7, location2, date7, date10, hakan);
		
		//reservationRepository.getUpdateAllReservationByCar();
		
		//List<Reservation> reservations=reservationRepository.getApprovalReservationListByUser("ayfirat");
		//System.out.println("------------getApproval-------------");
		//System.out.println(reservations.size());
		//reservationService.save(reservation6);
		// reservationService.save(reservation4);
		// reservationService.save(reservation3);
		// reservationService.save(reservation2);
		// reservationService.save(reservation1);

		// Rezervasyon Test
		// String startdatep="10/03/2017 11:55";
		// String enddatep="30/03/2017 12:00";
		// Date startdate=dateFormat.parse(startdatep);
		// Date enddate=dateFormat.parse(enddatep);
		// Reservation reservation6=new Reservation(startdate, enddate);
		// List<Car>
		// carList=reservationRepository.getQueryReturnCar(reservation6);
		// for(Car c:carList){
		// System.out.println(c);
		// }

		// reservationRepository.getUpdateAllReservationByCar();

		// Aktif rezervasyonlar�n bulunmas� Test...
		// List<Reservation>
		// reservations=reservationRepository.getActiveReservation();
		// for(Reservation r:reservations){
		// System.out.println("Start: "+r.getStartdate()+" End:
		// "+r.getEnddate());
		// }

		// Tarihi ge�en rezervasyonlardaki arabalar�n hire alanlar�n�n
		// g�ncellenmesi i�in...
		// reservationRepository.getCarHireUpdate();

		// List<Car> carList=carService.getCarListByUsername("arslanyakup");
		// for(Car c:carList){
		// System.out.println(c.getModel());
		// }




	}
}

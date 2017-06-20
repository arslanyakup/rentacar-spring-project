package com.rental.car.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.rental.car.domain.Car;
import com.rental.car.service.CarService;
import com.rental.car.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.rental.car.domain.Reservation;
import com.rental.car.service.LocationService;
import com.rental.car.service.ReservationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

@Controller
@Component
@SessionAttributes(value = { "newReservation"})
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private CarService carService;

	private LocationService locationService;

	private ReservationService reservationService;

	private UserService userService;

	@ModelAttribute("newReservation")
	public void initializeReservation(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("newReservation", reservation);
	}

	@Autowired
	public HomeController(UserService userService, CarService carService,LocationService locationService,ReservationService reservationService) {
		this.userService=userService;
		this.carService=carService;
		this.reservationService=reservationService;
		this.locationService = locationService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("newReservation") Reservation reservation, Locale locale, Model model, HttpServletRequest request) {
		List<Car> carListByCity=new ArrayList<>();
		carListByCity=carService.findAll();
		List<Car> prestijCars=carService.getCarListBySelectedState("Prestij");
		List<Car> premiumCars=carService.getCarListBySelectedState("Premium");
		model.addAttribute("prestijCars", prestijCars);
		model.addAttribute("premiumCars", premiumCars);
		model.addAttribute("carListByCity", carListByCity);
		reservation=new Reservation();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("dd/MM/yyyy");
		String startdate=simpleDateFormat.format(new Date());
		String enddate=simpleDateFormat.format((new Date()).getTime()+(1000*60*60*24));
		reservation.setDatest(startdate);
		reservation.setDateend(enddate);
		model.addAttribute("newReservation", reservation);
		model.addAttribute("cityList", locationService.getAllCity());
		return "home";
	}

	@RequestMapping(value = "/byCity")
	public @ResponseBody List<String> getLocationByCity(@RequestParam("city") String city) {
		List<String> locationList = locationService.getLocationByCity(city);
		return locationList;
	}
	
	@RequestMapping(value="/approvalUser")
	public @ResponseBody Integer getApprovalReservationListByUser(@RequestParam("username") String username){
		List<Reservation> reservationList=reservationService.getApprovalReservationListByUser(username);
		return reservationList.size();
	}

	@RequestMapping(value = "/getUserBy",method = RequestMethod.GET)
	public @ResponseBody Boolean getUserBy(@RequestParam("username") String username){
		return userService.getUserBy(username);
	}

	@RequestMapping(value = "hakkimizda")
	public String getHakkimizda(){
		return "user/hakkimizda";
	}

	@RequestMapping(value = "iletisim")
	public String getIletisim(){
		return "user/iletisim";
	}

	@RequestMapping(value = "kiralamakosullari")
	public String getKiralamaKosullari(){
		return "user/kiralamakosullari";
	}
	public LocationService getLocationService() {
		return locationService;
	}

	public void setLocationService(LocationService locationService) {
		this.locationService = locationService;
	}

}

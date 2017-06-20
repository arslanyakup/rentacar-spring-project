package com.rental.car.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.rental.car.domain.Car;
import com.rental.car.domain.Location;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;
import com.rental.car.service.CarService;
import com.rental.car.service.LocationService;
import com.rental.car.service.ReservationService;
import com.rental.car.service.UserService;
import com.rental.car.validator.ReservationValidator;

@Controller
@Component
@RequestMapping(value = "/reservation")
@SessionAttributes(value = { "newReservation", "newUser" })
public class ReservationController {

	private ReservationService reservationService;
	private LocationService locationService;
	private CarService carService;
	private UserService userService;
	private ReservationValidator reservationValidator;
	
	private Path userImagePath;

	private Path ehliyetImagePath;

	@Autowired
	public ReservationController(LocationService locationService, ReservationService reservationService,
			CarService carService, UserService userService,ReservationValidator reservationValidator) {
		super();
		this.reservationValidator=reservationValidator;
		this.userService = userService;
		this.carService = carService;
		this.locationService = locationService;
		this.reservationService = reservationService;
	}

	@ModelAttribute("newReservation")
	public void initializeReservation(Model model) {
		Reservation reservation = new Reservation();
		model.addAttribute("newReservation", reservation);
	}

	@RequestMapping(value = "/byCity")
	public @ResponseBody List<String> getLocationByCity(@RequestParam("city") String city, Model model) {
		List<String> locationList = locationService.getLocationByCity(city);
		return locationList;
	}

	@RequestMapping(value = "/reservationQuery", method = RequestMethod.POST)
	public String getQueryByReturnCar(@ModelAttribute("newReservation") Reservation reservation, Model model,BindingResult result)
			throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy", Locale.US);
		Date startdate = dateFormat.parse(reservation.getDatest());
		Date enddate = dateFormat.parse(reservation.getDateend());
		reservation.setStartdate(startdate);
		reservation.setEnddate(enddate);

		reservationValidator.validate(reservation, result);

		if (result.hasErrors()){
			model.addAttribute("cityList", locationService.getAllCity());
			return "/home";
		}
		dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm", Locale.US);
		startdate = dateFormat.parse(reservation.getDatest() + " " + reservation.getStarthour());
		enddate = dateFormat.parse(reservation.getDateend() + " " + reservation.getEndhour());
		List<Car> carList = reservationService.getQueryReturnCar(reservation);
		int size = carList.size();
		model.addAttribute("size", size);
		List<String> cityList = locationService.getAllCity();
		model.addAttribute("cityList", cityList);
		model.addAttribute("newReservation", reservation);
		model.addAttribute("carList", carList);
		List<String> carType = new ArrayList<>();
		carType.add("Ekonomik");
		carType.add("Orta");
		carType.add("Standart");
		carType.add("Prestij");
		carType.add("Premium");
		carType.add("Büyük");
		carType.add("Tümü");

		List<String> gearType = new ArrayList<>();
		gearType.add("Otomatik");
		gearType.add("Manuel");

		List<String> fuelType = new ArrayList<>();
		fuelType.add("Dizel");
		fuelType.add("Benzin");
		fuelType.add("LPG");
		model.addAttribute("fuelType", fuelType);
		model.addAttribute("carType", carType);
		model.addAttribute("gearType", gearType);
		return "user/querycarlist";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUserByReservation(Model model, @ModelAttribute("newReservation") Reservation reservation) throws ParseException {
		if(reservation.getHiredUsername()==""){
			User user=new User();
			model.addAttribute("newUser", user);
			return "user/registeruser";
		}
		reservation.setApprovalStatus(false);
		reservationService.save(reservation);
		model.addAttribute("newReservation", reservation);
		return "user/reservationinformation";
	}

	@RequestMapping(value = "/selectedcar", method = RequestMethod.GET)
	public String getSelectedCar(@ModelAttribute("newReservation") Reservation reservation, Model model)
			throws ParseException {
		reservation.setCar(carService.findOne(reservation.getCar().getId()));
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		Location begLoc = new Location(reservation.getReceptionLocation().getLocationname(),reservation.getReceptionLocation().getCity());
		Date stdate = dateFormat.parse(reservation.getDatest() + " " + reservation.getStarthour());
		Date dateend = dateFormat.parse(reservation.getDateend() + " " + reservation.getEndhour());
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate first = LocalDate.parse(reservation.getDatest(), dateTimeFormatter);
		LocalDate second = LocalDate.parse(reservation.getDateend(), dateTimeFormatter);
		long gun_sayisi = ChronoUnit.DAYS.between(first, second);
		reservation.setStartdate(stdate);
		reservation.setEnddate(dateend);
		reservation.setTotalprice(gun_sayisi * reservation.getCar().getPrice());
		User caruser=userService.getUserByUsername(reservation.getCar().getUsername());
		model.addAttribute("caruser", caruser);
		model.addAttribute("gunsayisi", gun_sayisi);
		model.addAttribute("newReservation", reservation);
		return "user/selectedcar";
	}

	@RequestMapping(value = "information", method = RequestMethod.POST)
	public String getInfoReservation(Model model, @ModelAttribute("newReservation") Reservation reservation,
			@ModelAttribute("newUser") User user,BindingResult result) throws ParseException {
		
		if (result.hasErrors()) {
			return "user/selectedcar";
		}
		reservation.setApprovalStatus(false);
		reservation.setHiredUsername(user.getUsername());
		ehliyetImagePath = Paths.get("D:/NeonProjects/RentACar/src/main/webapp/resources/resim/ehliyet-image/" + user.getUsername() + ".png");
		userImagePath = Paths.get( "D:/NeonProjects/RentACar/src/main/webapp/resources/resim/user-image/" + user.getUsername() + ".png");
		MultipartFile profilePicture = user.getUserImage();
		MultipartFile ehliyetPicture = user.getEhliyetImage();
		user.setImagePath(user.getUsername() + ".png");
		if (ehliyetPicture != null && !ehliyetPicture.isEmpty()) {
			try {
				ehliyetPicture.transferTo(new File(ehliyetImagePath.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Car image save failed");
			}
		}

		if (profilePicture != null && !profilePicture.isEmpty()) {
			try {
				profilePicture.transferTo(new File(userImagePath.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Car image save failed");
			}
		}
		
		user.setRole("ROLE_USER");
		userService.save(user);
		reservationService.save(reservation);
		Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getRoleList());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		model.addAttribute("newReservation", reservation);
		return "user/reservationinformation";
	}
	
	@RequestMapping(value="/approvalreservation/{id}",method=RequestMethod.GET)
	public String approvalReservation(@PathVariable("id") String id,
			@RequestParam(name="approvalStatus", required=false) Boolean approval, Model model){
		Reservation reservation=reservationService.getById(id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		reservation.setDatest(dateFormat.format(reservation.getStartdate()));
		reservation.setDateend(dateFormat.format(reservation.getStartdate()));
		User hiredUser=userService.getUserByUsername(reservation.getHiredUsername());
		reservationService.getReservationApprovalUpdate(id,approval);

		if (approval==true){
			reservationService.getReservationCarHireUpdate(reservation);
			userService.getCarHireUpdate(reservation);
			model.addAttribute("user", hiredUser);
			model.addAttribute("newReservation", reservation);
			return "user/approvalreservation";
		}
		else {
			reservationService.deleteByReservation(reservation);
			return "user/approvalreservationfalse";
		}
	}
}

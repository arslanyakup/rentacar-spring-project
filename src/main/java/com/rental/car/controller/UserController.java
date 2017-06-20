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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.rental.car.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.rental.car.service.ReservationService;
import com.rental.car.service.UserService;

@RequestMapping(value = "/user")
@Controller
@SessionAttributes(value={"newUser"})
public class UserController {

	private CarService carService;

	private UserService userService;

	private ReservationService reservationService;

	private Path carImagePath;

	private Path userImagePath;

	private Path ehliyetImagePath;

	private UserValidator userValidator;

	@Autowired
	public UserController(UserValidator userValidator, CarService carService, UserService userService, ReservationService reservationService) {
		super();
		this.userValidator=userValidator;
		this.reservationService = reservationService;
		this.carService = carService;
		this.userService = userService;
	}

	@RequestMapping(value = "/carlist")
	public String carList(Model model) {
		model.addAttribute("carList", carService.findAll());
		return "user/carlist";
	}

	@RequestMapping(value = "register")
	public String registerUserDefault(Model model) {
		model.addAttribute("newUser", new User());
		return "user/register";
	}


	@RequestMapping(value = "registeruser")
	public String registerUser(Model model) {
		model.addAttribute("newUser", new User());
		return "user/registeruser";
	}

	@RequestMapping(value = "registeruser", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("newUser") User user, Model model, BindingResult result) {
		userValidator.validate(user,result);

		if (result.hasErrors()) {
			return "user/register";
		}
		ehliyetImagePath = Paths.get("G:/intellij/RentACar/src/main/webapp/resources/resim/ehliyet-image/"
				+ user.getUsername() + ".png");
		userImagePath = Paths.get(
				"G:/intellij/RentACar/src/main/webapp/resources/resim/user-image/" + user.getUsername() + ".png");
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
		Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(),user.getRoleList());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		model.addAttribute("user", user);
		return "redirect:/";
	}

	@RequestMapping(value = "/addcar", method = RequestMethod.GET)
	public String addCar(Model model) {
		model.addAttribute("newCar", new Car());
		List<String> carType = new ArrayList<>();
		carType.add("Ekonomik");
		carType.add("Orta");
		carType.add("Standart");
		carType.add("Prestij");
		carType.add("Premium");
		carType.add("Tümü");
		List<String> gearType = new ArrayList<>();
		gearType.add("Otomatik");
		gearType.add("Manuel");
		List<String> fuelType = new ArrayList<>();
		fuelType.add("Benzinli");
		fuelType.add("Dizel");
		fuelType.add("LPG");
		model.addAttribute("carType", carType);
		model.addAttribute("fuelType", fuelType);
		model.addAttribute("gearType", gearType);
		return "user/addcar";
	}

	@RequestMapping(value = "/addcar", method = RequestMethod.POST)
	public String addCar(@Valid @ModelAttribute("newCar") Car car, BindingResult result, HttpServletRequest request,
			Model model) {

		if (result.hasErrors()) {
			List<String> carType = new ArrayList<>();
			carType.add("Ekonomik");
			carType.add("Orta");
			carType.add("Standart");
			carType.add("Prestij");
			carType.add("Premium");
			carType.add("Tümü");
			List<String> gearType = new ArrayList<>();
			gearType.add("Otomatik");
			gearType.add("Manuel");
			List<String> fuelType = new ArrayList<>();
			fuelType.add("Benzinli");
			fuelType.add("Dizel");
			fuelType.add("LPG");
			model.addAttribute("carType", carType);
			model.addAttribute("fuelType", fuelType);
			model.addAttribute("gearType", gearType);
			return "user/addcar";
		}
		carImagePath = Paths.get("G:/intellij/RentACar/src/main/webapp/resources/resim/car-image/"
				+ car.getUsername() + "_" + car.getBrand() + "_" + car.getModel() + ".png");
		car.setImagepath(car.getUsername() + "_" + car.getBrand() + "_" + car.getModel() + ".png");
		carService.save(car);
		MultipartFile multipartFile = car.getCarimage();

		if (multipartFile != null && !multipartFile.isEmpty()) {
			try {
				multipartFile.transferTo(new File(carImagePath.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Car image save failed");
			}
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/profile/{user}", method = RequestMethod.GET)
	public String getUserProfile(@PathVariable("user") String username, Model model) {
		User user = userService.getUserByUsername(username);
		List<Car> carList = carService.getCarListByUsername(username);
		List<Reservation> reservationList = reservationService.getReservationListByUser(user);
		List<Reservation> approvalReservationList=reservationService.getApprovalReservationListByUser(username);
		for (Reservation r : approvalReservationList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			r.setDatest(dateFormat.format(r.getStartdate()));
			r.setDateend(dateFormat.format(r.getEnddate()));
		}
		for (Reservation r : reservationList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			r.setDatest(dateFormat.format(r.getStartdate()));
			r.setDateend(dateFormat.format(r.getEnddate()));
		}
		model.addAttribute("approvalReservation", approvalReservationList);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("carList", carList);
		model.addAttribute("user", user);
		return "user/profile";
	}

	@RequestMapping(value = "/profile/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user) {
		userService.updateUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/profile/updatephoto")
	public String updateUserPhoto(@ModelAttribute(value = "user") User user, BindingResult result) {
		User user2 = userService.getUser(user.getId());
		userImagePath = Paths.get(
				"G:/intellij/RentACar/src/main/webapp/resources/resim/user-image/" + user2.getUsername() + ".png");
		MultipartFile multipartFile = user.getUserImage();
		if (multipartFile != null && !multipartFile.isEmpty()) {
			try {
				System.out.println("try...");
				multipartFile.transferTo(new File(userImagePath.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Car image save failed");
			}
		}
		return "redirect:/";
	}

	@RequestMapping(value = "profile/passwordconfirm", method = RequestMethod.GET)
	public @ResponseBody String changePassword(@RequestParam("userid") String userid) {
		User user = userService.getUser(userid);
		return user.getPassword();
	}

	@RequestMapping(value = "profile/changepassword", method = RequestMethod.POST)
	public @ResponseBody String changePassword1(@RequestBody User post_data) {
		System.out.println(post_data.getId());
		userService.updatePassword(post_data.getId(), post_data.getPassword());
		return "";
	}

}

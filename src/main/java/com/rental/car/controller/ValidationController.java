package com.rental.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rental.car.domain.Reservation;

@Controller
public class ValidationController {

    @RequestMapping(value = "/compareDate", method = RequestMethod.POST)
	public @ResponseBody Boolean compareDate(@RequestBody Reservation reservation) {

		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy");
			Date startdate = dateFormat.parse(reservation.getDatest());
			Date enddate = dateFormat.parse(reservation.getDateend());
			System.out.println(startdate);
			System.out.println(enddate);
			if (startdate.compareTo(enddate) >= 0) {
				return false;
			}
			else {
				return true;
			}
		}
		catch (Exception e){
			System.err.println(e);
			return true;
		}
	}

}

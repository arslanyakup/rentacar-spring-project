package com.rental.car.validator;


import com.rental.car.domain.Reservation;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by Arslan on 6.5.2017.
 */

@Component
public class ReservationValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {

        return Reservation.class.isAssignableFrom(clazz);
    }


    @Override
    public void validate(Object target, Errors errors) {
        Reservation reservation=(Reservation) target;

        if (reservation.getStartdate().compareTo(reservation.getEnddate()) > 0){
            errors.rejectValue("datest","error.datest","İade tarihinden sonra olamaz!");
            errors.rejectValue("dateend","error.dateend","Alış tarihinden önce olamaz!");
        }
        else{
            ValidationUtils.rejectIfEmptyOrWhitespace(errors,"datest","error.datest","Boş bırakılamaz");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors,"dateend","error.dateend","Boş bırakılamaz");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"starthour","error.starthour","Boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"endhour","error.endhour","Boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"receptionLocation.city","error.city","Boş bırakılamaz!");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"receptionLocation.locationname","error.district","Boş bırakılamaz");
    }
}

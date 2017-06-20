package com.rental.car.validator;

import com.rental.car.domain.User;
import com.rental.car.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Arslan on 21.5.2017.
 */
@Component
public class UserValidator implements Validator {

    UserService userService;

    @Autowired
    public UserValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user=(User) target;

        if (userService.getUserBy(user.getUsername())==false){
            errors.rejectValue("username","error.username","Bu kullanıcı adı başka bir kullanıcı tarafından kullanılıyor!!");
        }


        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"firstname","error.firstname","İsim alanı boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"lastname","error.lastname","Soyisim alanı boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"username","error.username","Kulanıcı Adı alanı boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email","error.email","Mail adresi alanı boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"telephone","error.telephone","Telefon alanı boş bırakılamaz");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password","error.password","Şifre alanı boş bırakılamaz");

    }
}

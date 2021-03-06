package com.rental.car.repository;

import java.util.List;

import com.rental.car.domain.Reservation;
import org.springframework.security.core.userdetails.UserDetails;

import com.rental.car.domain.User;

public interface UserRepository {

	public User save(User user);

	public User getUser(String id);

	public User deleteUserBy(String id);

	public User deleteUserBy(User user);

	public List<User> gelAllUser();

	public User getUserByUsername(String username);

	public Boolean getUserBy(String username);

	public void updateUser(User user);
	
	public void updatePassword(String userid, String password);

	public void getCarHireUpdate(Reservation reservation);


}

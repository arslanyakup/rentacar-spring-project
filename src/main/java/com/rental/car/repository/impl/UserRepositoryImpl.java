package com.rental.car.repository.impl;

import java.util.ArrayList;
import java.util.List;

import com.rental.car.domain.Car;
import com.rental.car.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.rental.car.domain.Role;
import com.rental.car.domain.User;
import com.rental.car.repository.UserRepository;

import static org.springframework.data.mongodb.core.query.Query.query;

@Repository
@Component
public class UserRepositoryImpl implements UserRepository {

	private MongoOperations mongoOperations;

	@Autowired
	public UserRepositoryImpl(MongoOperations mongoOperations) {
		super();
		this.mongoOperations = mongoOperations;
	}

	@Override
	public User save(User user) {
		mongoOperations.insert(user);
		return user;
	}

	@Override
	public User getUser(String id) {
		Query query = Query.query(Criteria.where("_id").is(id));
		User user = mongoOperations.findOne(query, User.class);
		return user;
	}

	@Override
	public User deleteUserBy(String id) {
		User user = getUser(id);
		mongoOperations.remove(user);
		return user;
	}

	@Override
	public User deleteUserBy(User user) {
		mongoOperations.remove(user);
		return user;
	}

	@Override
	public List<User> gelAllUser() {
		List<User> userList = mongoOperations.findAll(User.class);
		return userList;
	}

	@Override
	public User getUserByUsername(String username) {
		Query query = Query.query(Criteria.where("username").is(username));
		User user = mongoOperations.findOne(query, User.class);
		return user;
	}

	@Override
	public void updateUser(User user) {
		Update update=new Update();
		update.set("firstname", user.getFirstname());
		update.set("lastname", user.getLastname());
		update.set("email", user.getEmail());
		update.set("telephone", user.getTelephone());
		update.set("address.city", user.getAddress().getCity());
		update.set("address.district", user.getAddress().getDistrict());
		update.set("address.wideAddress", user.getAddress().getWideAddress());
		Query query=Query.query(Criteria.where("id").is(user.getId()));
		mongoOperations.updateFirst(query, update, User.class);
	}

	@Override
	public void updatePassword(String userid, String password) {
		Query query=Query.query(Criteria.where("id").is(userid));
		Update update=new Update();
		update.set("password", password);
		mongoOperations.updateFirst(query, update, User.class);
	}

	public Boolean getUserBy(String username){

		Query query=Query.query(Criteria.where("username").is(username));
		User user=mongoOperations.findOne(query,User.class);

		if (user==null){
			return true;
		}
		else{
			return false;
		}
	}
	public void getCarHireUpdate(Reservation reservation){
		Update update = new Update();
		update.set("hire", true);
		mongoOperations.updateFirst(query(Criteria.where("_id").is(reservation.getCar().getId())), update, Car.class);
	}
}

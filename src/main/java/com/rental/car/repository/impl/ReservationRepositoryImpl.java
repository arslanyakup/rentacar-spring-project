package com.rental.car.repository.impl;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.group;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.match;
import static org.springframework.data.mongodb.core.query.Query.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.rental.car.domain.Car;
import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;
import com.rental.car.repository.ReservationRepository;
import com.rental.car.sendmail.ReservationInformationMail;
import com.rental.car.service.CarService;

@Repository
@Component
public class ReservationRepositoryImpl implements ReservationRepository {

	private MongoOperations mongoOperations;
	private CarService carService;
	private ReservationInformationMail informationMail;

	@Autowired
	public ReservationRepositoryImpl(MongoOperations mongoOperations, CarService carService,ReservationInformationMail informationMail) {
		super();
		this.informationMail=informationMail;
		this.mongoOperations = mongoOperations;
		this.carService = carService;
	}

	@Override
	public Reservation save(Reservation reservation) {
		mongoOperations.save(reservation);
		return reservation;
	}

	@Override
	public Reservation getById(String id) {
		Query query = Query.query(Criteria.where("_id").is(id));
		Reservation reservation = mongoOperations.findOne(query, Reservation.class);
		return reservation;
	}

	@Override
	public Reservation deleteByReservation(Reservation reservation) {
		mongoOperations.remove(reservation);
		return reservation;
	}

	@Override
	public Reservation deleteById(String id) {
		Reservation reservation = getById(id);
		mongoOperations.remove(reservation);
		return reservation;
	}

	@Override
	public List<Reservation> getAllReservation() {
		List<Reservation> reservationList = mongoOperations.findAll(Reservation.class);
		return reservationList;
	}

	@Override
	public List<Car> getQueryReturnCar(Reservation reservation) {
		if (reservation.getCarTypeList() == null) {
			List<String> carType = new ArrayList<>();
			carType.add("Ekonomik");
			carType.add("Orta");
			carType.add("Standart");
			carType.add("Prestij");
			carType.add("Premium");
			carType.add("Büyük");
			carType.add("Tümü");
			reservation.setCarTypeList(carType);
		}

		if (reservation.getGearTypeList() == null) {
			List<String> gearType = new ArrayList<>();
			gearType.add("Otomatik");
			gearType.add("Manuel");
			reservation.setGearTypeList(gearType);
		}

		if (reservation.getFuelTypeList() == null) {
			List<String> fuelType = new ArrayList<>();
			fuelType.add("Dizel");
			fuelType.add("Benzin");
			fuelType.add("LPG");
			reservation.setFuelTypeList(fuelType);
		}
		Query query = new Query(Criteria.where("hire").is(false).and("vehicleclass").in(reservation.getCarTypeList())
				.and("geartype").in(reservation.getGearTypeList()).and("fueltype").in(reservation.getFuelTypeList()));
		List<Car> carList = mongoOperations.find(query, Car.class);
		System.out.println("----------Sorgudan donenler--------");
		for (Car c : carList) {
			System.out.println(c.getModel());
		}
		System.out.println("-------Aggregation dan donenler--------");
		for (Reservation r : getDateQueryByReservation(reservation)) {
			carList.add(r.getCar());
			System.out.println(r.getCar().getModel());
		}
		return carList;
	}

	@Override
	public List<Car> getQueryBySelectedState(Reservation reservation) {
		return null;
	}

	public MongoOperations getMongoOperations() {
		return mongoOperations;
	}

	public void setMongoOperations(MongoOperations mongoOperations) {
		this.mongoOperations = mongoOperations;
	}

	// Metod �al��t�, test edilecek!!
	@Override
	public List<Reservation> getActiveReservation() {
		Date date = new Date();
		Query query = Query.query(Criteria.where("enddate").gt(date).and("startdate").lte(date));
		List<Reservation> reservationList = mongoOperations.find(query, Reservation.class);
		return reservationList;
	}

	// Bu metodda Aggregate icerisini yazarken kaldim. 13 Mart 01:17!!!
	@Override
	public AggregationResults<Reservation> getDateQueryByReservation(Reservation reservation) {
		if (reservation.getCarTypeList() == null) {
			List<String> carType = new ArrayList<>();
			carType.add("Ekonomik");
			carType.add("Orta");
			carType.add("Standart");
			carType.add("Prestij");
			carType.add("Premium");
			carType.add("Büyük");
			carType.add("Tümü");
			reservation.setCarTypeList(carType);
		}

		if (reservation.getGearTypeList() == null) {
			List<String> gearType = new ArrayList<>();
			gearType.add("Otomatik");
			gearType.add("Manuel");
			reservation.setGearTypeList(gearType);
		}

		if (reservation.getFuelTypeList() == null) {
			List<String> fuelType = new ArrayList<>();
			fuelType.add("Dizel");
			fuelType.add("Benzin");
			fuelType.add("LPG");
			reservation.setFuelTypeList(fuelType);
		}
		getCarHireUpdate();
		Aggregation aggregation = Aggregation.newAggregation(match(Criteria.where("car.hire").is(true)),
				match(new Criteria().orOperator(Criteria.where("enddate").lt(reservation.getStartdate()),
						Criteria.where("startdate").gt(reservation.getEnddate()))),
				match(Criteria.where("car.vehicleclass").in(reservation.getCarTypeList())),
				match(Criteria.where("car.geartype").in(reservation.getGearTypeList())),
				match(Criteria.where("car.fueltype").in(reservation.getFuelTypeList())), group("id", "car"));
		AggregationResults<Reservation> results = mongoOperations.aggregate(aggregation, Reservation.class,
				Reservation.class);
		return results;
	}

	// Bu metodda g�ncelleme yap�lacak!!!
	@Override
	public void getCarHireUpdate() {
		Date date = new Date();
		Aggregation aggregation = Aggregation.newAggregation(match(Criteria.where("enddate").lt(date)),
				group("car.id"));
		AggregationResults<Car> carIdList = mongoOperations.aggregate(aggregation, Reservation.class, Car.class);
		for (Car s : carIdList) {
			Query query = Query.query(Criteria.where("id").is(s.getId()));
			Update update = new Update();
			update.set("hire", false);
			mongoOperations.updateFirst(query, update, Car.class);
		}
	}

	// Araban�n sahibi olan kullan�c�ya yap�lan t�m rezervasyonlar
	@Override
	public List<Reservation> getReservationListByUser(User user) {
		Query query = Query.query(Criteria.where("car.username").is(user.getUsername()));
		List<Reservation> reservationList = mongoOperations.find(query, Reservation.class);
		return reservationList;
	}

	// Reservationlardaki arabalar� yeni de�erlerine g�ncellemek i�in yaz�ld�!!!
	@Override
	public void getUpdateAllReservationByCar() {
		List<Reservation> reservationList = mongoOperations.findAll(Reservation.class);
		for (Reservation r : reservationList) {
			Query query1 = Query.query(Criteria.where("id").is(r.getCar().getId()));
			Car car = mongoOperations.findOne(query1, Car.class);
			Query query = Query.query(Criteria.where("car").is(r.getCar()));
			Update update = new Update();
			update.set("car", car);
			mongoOperations.updateFirst(query, update, Reservation.class);
		}
	}

	@Override
	public List<Reservation> getApprovalReservationListByUser(String username) {
		Query query = Query.query(Criteria.where("username").is(username));
		User user = mongoOperations.findOne(query, User.class);
		List<Reservation> reservationList = new ArrayList<>();
		for (Reservation r : getReservationListByUser(user)) {
			if (r.isApprovalStatus() == false) {
				reservationList.add(r);
			}
		}
		return reservationList;
	}

	@Override
	public void getReservationApprovalUpdate(String id, Boolean approvalStatus) {
		Query query = Query.query(Criteria.where("id").is(id));
		Reservation reservation=mongoOperations.findOne(query, Reservation.class);
		Update update = new Update();
		update.set("approvalStatus", approvalStatus);
		mongoOperations.updateFirst(query, update, Reservation.class);
		if (approvalStatus == true) {
			informationMail.ReservationInfoMailSender(reservation);
		}
		if (approvalStatus==false){
			informationMail.ReservationInfoFalseMailSender(reservation);
		}
	}

	public ReservationInformationMail getInformationMail() {
		return informationMail;
	}

	public void setInformationMail(ReservationInformationMail informationMail) {
		this.informationMail = informationMail;
	}


	public void getReservationCarHireUpdate(Reservation reservation){
		Update update=new Update();
		update.set("car.hire",true);
		Query query=Query.query(Criteria.where("id").is(reservation.getId()));
		mongoOperations.updateFirst(query,update,Reservation.class);
	}
}

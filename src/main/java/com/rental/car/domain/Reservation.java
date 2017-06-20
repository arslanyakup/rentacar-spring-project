package com.rental.car.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Future;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection = "reservations", language = "turkish")
public class Reservation {

	@Id
	private String id;
	@NotEmpty(message="Araba seçimi yapmadýnýz!")
	private Car car;
	private User user;
	@NotEmpty(message="Bu alan boþ býrakýlamaz!!")
	private Location receptionLocation;
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm")
	private Date startdate;
	private long totalprice;
	@Transient
	@NotEmpty(message="Alýþ Tarihi boþ býrakýlamaz!!")
	private String datest;
	@Transient
	@NotEmpty(message="Alýþ Saati boþ býrakýlamaz!!")
	private String starthour;
	@Future
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm")
	private Date enddate;
	@Transient
	@NotEmpty(message="Ýade Tarihi boþ býrakýlamaz!!")
	private String dateend;
	@Transient
	@NotEmpty(message="Ýade Saati boþ býrakýlamaz!!")
	private String endhour;
	@Transient
	private List<String> carTypeList;
	@Transient
	private List<String> gearTypeList;
	@Transient
	private List<String> fuelTypeList;
	private String hiredUsername;
	private boolean approvalStatus;

	public Reservation() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public Location getReceptionLocation() {
		return receptionLocation;
	}

	public void setReceptionLocation(Location receptionLocation) {
		this.receptionLocation = receptionLocation;
	}

	public List<String> getCarTypeList() {
		return carTypeList;
	}

	public void setCarTypeList(List<String> carTypeList) {
		this.carTypeList = carTypeList;
	}

	public List<String> getGearTypeList() {
		return gearTypeList;
	}

	public void setGearTypeList(List<String> gearTypeList) {
		this.gearTypeList = gearTypeList;
	}

	public List<String> getFuelTypeList() {
		return fuelTypeList;
	}

	public void setFuelTypeList(List<String> fuelTypeList) {
		this.fuelTypeList = fuelTypeList;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public String getStarthour() {
		return starthour;
	}

	public void setStarthour(String starthour) {
		this.starthour = starthour;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getEndhour() {
		return endhour;
	}

	public void setEndhour(String endhour) {
		this.endhour = endhour;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDatest() {
		return datest;
	}

	public void setDatest(String datest) {
		this.datest = datest;
	}

	public String getDateend() {
		return dateend;
	}

	public void setDateend(String dateend) {
		this.dateend = dateend;
	}

	public long getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(long totalprice) {
		this.totalprice = totalprice;
	}

	public String getHiredUsername() {
		return hiredUsername;
	}

	public void setHiredUsername(String hiredUsername) {
		this.hiredUsername = hiredUsername;
	}

	public boolean isApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(boolean approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public Reservation(Car car, User user, Location receptionLocation, Date startdate, String datest, String starthour,
			Date enddate, String dateend, String endhour, long totalprice) {
		super();
		this.totalprice = totalprice;
		this.car = car;
		this.user = user;
		this.receptionLocation = receptionLocation;
		this.startdate = startdate;
		this.datest = datest;
		this.starthour = starthour;
		this.enddate = enddate;
		this.dateend = dateend;
		this.endhour = endhour;
	}

	public Reservation(Car car, Location receptionLocation, Date startdate, String starthour, Date enddate,
			String endhour, List<String> carTypeList, List<String> gearTypeList, List<String> fuelTypeList, User user) {
		super();
		this.user = user;
		this.car = car;
		this.receptionLocation = receptionLocation;
		this.startdate = startdate;
		this.starthour = starthour;
		this.enddate = enddate;
		this.endhour = endhour;
		this.carTypeList = carTypeList;
		this.gearTypeList = gearTypeList;
		this.fuelTypeList = fuelTypeList;
	}

	public Reservation(Car car, Location receptionLocation, Date startdate, String starthour, Date enddate,
			String endhour, User user) {
		super();
		this.car = car;
		this.user = user;
		this.receptionLocation = receptionLocation;
		this.startdate = startdate;
		this.starthour = starthour;
		this.enddate = enddate;
		this.endhour = endhour;
	}

	public Reservation(Car car, Location receptionLocation, Date startdate, Date enddate, User user) {
		super();
		this.car = car;
		this.user = user;
		this.receptionLocation = receptionLocation;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public Reservation(Date startdate, Date enddate) {
		super();
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public Reservation(Car car, Location receptionLocation, Date startdate, Date enddate) {
		super();
		this.car = car;
		this.receptionLocation = receptionLocation;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public Reservation(Car car, Location receptionLocation, String datest, String dateend) {
		super();
		this.car = car;
		this.receptionLocation = receptionLocation;
		this.datest = datest;
		this.dateend = dateend;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", car=" + car + ", user=" + user + ", receptionLocation=" + receptionLocation
				+ ", startdate=" + startdate + ", totalprice=" + totalprice + ", datest=" + datest + ", starthour="
				+ starthour + ", enddate=" + enddate + ", dateend=" + dateend + ", endhour=" + endhour
				+ ", carTypeList=" + carTypeList + ", gearTypeList=" + gearTypeList + ", fuelTypeList=" + fuelTypeList
				+ ", hiredUsername=" + hiredUsername + ", approvalStatus=" + approvalStatus + "]";
	}

}

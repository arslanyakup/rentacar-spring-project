package com.rental.car.domain;

import java.util.List;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.web.multipart.MultipartFile;

@Document(collection = "cars", language = "turkish")
public class Car {

	@Id
	private String id;
	@NotEmpty(message="Marka alanı boş bırakılamaz!!")
	private String brand;
	@NotEmpty(message="Model alanı boş bırakılamaz!!")
	private String model;
	private String vehicleclass;
	@Min(value=1950,message="Geçersiz model yılı!!")
	private int year;
	private boolean hire;
	private String geartype;
	private String fueltype;
	@Min(value=1,message="Geçersiz Araç kapasitesi!!")
	private int capacity;
	private String imagepath;
	@Min(value=1,message="Geçersiz Araç fiyatı!!")
	private int price;
	private List<String> reservationIdList;
	private String username;
	private int rank;
	@Transient
	private MultipartFile carimage;

	public Car() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Car(String id) {
		super();
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getVehicleclass() {
		return vehicleclass;
	}

	public void setVehicleclass(String vehicleclass) {
		this.vehicleclass = vehicleclass;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public boolean isHire() {
		return hire;
	}

	public void setHire(boolean hire) {
		this.hire = hire;
	}

	public String getGeartype() {
		return geartype;
	}

	public void setGeartype(String geartype) {
		this.geartype = geartype;
	}

	public String getFueltype() {
		return fueltype;
	}

	public void setFueltype(String fueltype) {
		this.fueltype = fueltype;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public MultipartFile getCarimage() {
		return carimage;
	}

	public void setCarimage(MultipartFile carimage) {
		this.carimage = carimage;
	}

	public int getPrice() {
		return price;
	}

	public int getRank() { return rank; }

	public void setRank(int rank) { this.rank = rank; }

	public void setPrice(int price) {
		this.price = price;
	}

	public List<String> getReservationIdList() {
		return reservationIdList;
	}

	public void setReservationIdList(List<String> reservationIdList) {
		this.reservationIdList = reservationIdList;
	}

	public Car(String brand, String model, String vehicleclass, int year, boolean hire,
			String geartype, String fueltype, int capacity, String imagepath) {
		super();
		this.model = model;
		this.imagepath = imagepath;
		this.brand = brand;
		this.vehicleclass = vehicleclass;
		this.year = year;
		this.hire = hire;
		this.geartype = geartype;
		this.fueltype = fueltype;
		this.capacity = capacity;
	}

	public Car(String brand, String model, String vehicleclass, int year, String geartype, String fueltype,
			int capacity, String imagepath) {
		super();
		this.brand = brand;
		this.model = model;
		this.vehicleclass = vehicleclass;
		this.year = year;
		this.geartype = geartype;
		this.fueltype = fueltype;
		this.capacity = capacity;
		this.imagepath = imagepath;
	}

	public Car(String brand, String model, String vehicleclass, int year, String geartype, String fueltype,
			int capacity, String imagepath, int price) {
		super();
		this.brand = brand;
		this.model = model;
		this.vehicleclass = vehicleclass;
		this.year = year;
		this.geartype = geartype;
		this.fueltype = fueltype;
		this.capacity = capacity;
		this.imagepath = imagepath;
		this.price = price;
	}

	@Override
	public String toString() {
		return "id=" + id + ", brand=" + brand + ", model=" + model + ", vehicleclass=" + vehicleclass + ", year="
				+ year + ", hire=" + hire + ", geartype=" + geartype + ", fueltype=" + fueltype + ", capacity="
				+ capacity + ", imagepath=" + imagepath + ", price=" + price  + ", username=" + username;
	}





}

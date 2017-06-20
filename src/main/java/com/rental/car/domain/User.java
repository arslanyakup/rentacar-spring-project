package com.rental.car.domain;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.multipart.MultipartFile;

@Document(collection = "users", language = "turkish")
public class User {

	@Id
	private String id;
	@NotEmpty(message="Lütfen adýnýzý giriniz!!")
	private String firstname;
	@NotEmpty(message="Lütfen soyadýnýzý giriniz!!")
	private String lastname;
	@NotEmpty(message="Kullanýcý adý alaný zorunludur!!")
	private String username;
	@NotEmpty(message="E-Mail alaný zorunludur!!")
	private String email;
	@NotEmpty(message="Þifrenizi girmediniz!!")
	private String password;
	@NotEmpty
	private Address address;
	@NotEmpty(message="Telefon alaný zorunludur!!")
	private String telephone;
	private String role;
	private List<GrantedAuthority> roleList;
	private String imagePath;
	private String locationId;

	@Transient
	private MultipartFile userImage;

	@Transient
	private MultipartFile ehliyetImage;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User(String string, String string2, List<GrantedAuthority> list) {
	}

	public List<GrantedAuthority> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<GrantedAuthority> roleList) {
		this.roleList = roleList;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public MultipartFile getUserImage() {
		return userImage;
	}

	public void setUserImage(MultipartFile userImage) {
		this.userImage = userImage;
	}

	public MultipartFile getEhliyetImage() {
		return ehliyetImage;
	}

	public void setEhliyetImage(MultipartFile ehliyetImage) {
		this.ehliyetImage = ehliyetImage;
	}

	public User() {
	}

	public User(String firstname, String lastname, String username, String email, Address address, String telephone,
			String locationId) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.address = address;
		this.telephone = telephone;
		this.locationId = locationId;
	}

	public User(String id, String firstname, String lastname, String username, String email, String password,
			Address address, String telephone, String role, String imagePath,
			String locationId, MultipartFile userImage, MultipartFile ehliyetImage) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.telephone = telephone;
		this.role = role;
		this.imagePath = imagePath;
		this.locationId = locationId;
		this.userImage = userImage;
		this.ehliyetImage = ehliyetImage;
	}

	public User(MultipartFile userImage) {
		super();
		this.userImage = userImage;
	}

	@Override
	public String toString() {
		return username;
	}



}

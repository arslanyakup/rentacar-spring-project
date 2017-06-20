package com.rental.car.sendmail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.car.domain.Reservation;
import com.rental.car.domain.User;
import com.rental.car.service.UserService;

@Service
public class ReservationInformationMail {

	private UserService userService;

	@Autowired
	public ReservationInformationMail(UserService userService) {
		super();
		this.userService = userService;
	}

	public void ReservationInfoMailSender(Reservation reservation) {
		System.out.println(reservation);
		User hiredUser = userService.getUserByUsername(reservation.getHiredUsername());
		System.out.println(hiredUser);
		final String username = "trial";
		final String password = "trial";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("arabalikkurumsal@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(hiredUser.getEmail()));
			message.setSubject("Rezervasyon Onay İşlemi");
			message.setText("Merhaba " + hiredUser.getFirstname() + " " + hiredUser.getLastname() + ", "
					+ "Rezervasyonunuz onaylanmıştır...");
			Transport.send(message);
		} catch (MessagingException e) {
			System.err.println("Mesaj gönderirken bir hata oluştu!!" + e.getMessage());
			throw new RuntimeException(e);
		}
	}

	public void ReservationInfoFalseMailSender(Reservation reservation) {
		User hiredUser = userService.getUserByUsername(reservation.getHiredUsername());
		final String username = "trial";
		final String password = "trial";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("arabalikkurumsal@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(hiredUser.getEmail()));
			message.setSubject("Rezervasyon Onay İşlemi");
			message.setText("Merhaba " + hiredUser.getFirstname() + " " + hiredUser.getLastname() + ", "
					+ "Rezervasyonunuz Araç sahibi tarafından olumsuz onaylanmıştır...");
			Transport.send(message);
		} catch (MessagingException e) {
			System.err.println("Mesaj gönderirken bir hata oluştu!!" + e.getMessage());
			throw new RuntimeException(e);
		}
	}
}

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>Seçilen Araba</title>

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->

<!-- Global styles START -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->


<!-- Theme styles START -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/components.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style.css"
	rel="stylesheet">

<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">

	<%@include file="/WEB-INF/views/template/header.jsp"%>
	<div class="main">
		<div class="container">
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<br></br>
					<h1 style="font-family: inherit; ">
						<b>${newReservation.car.brand} ${newReservation.car.model}<b />
							<br />
					</h1>
					<div class="content-page">
						<div class="row margin-bottom-30">
							<!-- BEGIN CAROUSEL -->
							<div class="col-md-5 front-carousel">
								<div class="carousel slide" id="myCarousel">
									<!-- Carousel items -->
									<div class="carousel-inner">
										<div class="item active">
											<img alt=""
												src="<%=request.getContextPath()%>/resources/resim/car-image/${newReservation.car.imagepath}">
										</div>
									</div>
								</div>
							</div>
							<!-- BEGIN PORTFOLIO DESCRIPTION -->
							<div class="col-md-7" style="margin-top: -17px;">
								<br />
								<div class="col-md-6">
									<div class="portlet box green-meadow" style="height: 330px;">
										<div class="portlet-title" style="height: 73px;">
											<div class="caption">
												<label
													style="font-size: large; margin-left: 70px; font-weight: 400; margin-top: 16px;">Araç
													Özellikleri</label>
											</div>
										</div>
										<div style="color: #2E2B2B" class="portlet-body">
											<div class="row front-lists-v2 col-md-6">
												<div style="font-size: 14px; width: 250px;">
													<br /> <label><i class="fa fa-car"></i> Sınıf
														Türü: ${newReservation.car.vehicleclass}</label> <br /> <br /> <label><i
														class="fa fa-dashboard"></i> Yakıt Tipi:
														${newReservation.car.fueltype}</label> <br /> <br /> <label><i
														class="fa fa-cogs"></i> Vites Tipi:
														${newReservation.car.geartype}</label> <br /> <br /> <label><i
														class="fa fa-road"></i> Model Yılı:
														${newReservation.car.year}</label> <br /> <br /> <label><i
														class="fa fa-road"></i> Koltuk Sayısı:
														${newReservation.car.capacity} koltuk</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- END PORTFOLIO DESCRIPTION -->
								<div class="col-md-6">
									<!-- BEGIN Portlet PORTLET-->
									<div class="portlet box green-meadow">
										<div class="portlet-title">
											<div class="caption">
												<a
													href="<%=request.getContextPath()%>/user/profile/${newReservation.car.username}">
													<img class="img-circle" style="width: 50px; height: 53px;"
													alt=""
													src="<%=request.getContextPath()%>/resources/resim/user-image/${newReservation.car.username}.png">
												</a> <a
													href="<%=request.getContextPath()%>/user/profile/${newReservation.car.username}"><label
													style="font-size: large; margin-left: 20px; margin-right: 20px;">
														${caruser.firstname} ${caruser.lastname}</label></a>
											</div>
										</div>
										<div style="color: #2E2B2B" class="portlet-body">
											<div>
												<label>Alış Tarihi</label> <input type="text" size="10"
													readonly class="form-control"
													value="${newReservation.datest}"> <br /> <label>İade
													Tarihi</label> <input type="text" size="10" readonly
													class="form-control" value="${newReservation.dateend}">
												<br /> <br /> <label>Kiralama Süresi:
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${gunsayisi} gün</label> <br />
												<br /> <label>Toplam Tutar:
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													${newReservation.totalprice} TL</label>
											</div>
										</div>
									</div>
									<!-- END Portlet PORTLET-->
								</div>
							</div>
							<!-- END CAROUSEL -->
						</div>
						<div>
							<form:form modelAttribute="newReservation" action="register"
								method="POST">
								<form:input type="hidden" path="hiredUsername"
									value="${pageContext.request.userPrincipal.name}" />
								<div class="col-md-9"></div>
								<div class="col-md-3">
									<button style="background-color: #2F9296; border: 0px;"
										type="submit" class="btn btn-primary btn-lg btn-block"><b>REZERVASYONU&nbsp;ONAYLA</b></button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- BEGIN SIDEBAR & CONTENT -->
		</div>
	</div>
	<%@include file="/WEB-INF/views/template/footer.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/user-profile/changepassword.js"></script>
	<script src="<%=request.getContextPath()%>/resources/ajax.js"></script>
	<script src="<%=request.getContextPath()%>/resources/header.js"></script>
</body>
<!-- END BODY -->
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<!-- Head BEGIN -->
<head>
<title>Anasayfa</title>

<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/img/logos/logoy.png">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/ico/favicon.ico">
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
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-select/css/bootstrap-select.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" />

<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/prettyphoto/css/prettyPhoto.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/swiper/css/swiper.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/animate/animate.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<script
	src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/modernizr.custom.js"></script>

<!-- Theme styles START -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style-responsive.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/theme.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/plugins.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/layout.css"
	rel="stylesheet" type="text/css">

<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">

	<%@ include file="/WEB-INF/views/template/header.jsp"%>

	<!-- WRAPPER -->
	<div class="wrapper">
		<!-- CONTENT AREA -->
		<div class="content-area">

			<!-- PAGE -->
			<section class="page-section no-padding slider">
				<div class="container full-width">

					<div class="main-slider">
						<div class="item slide1 ver1">
							<div class="caption">
								<div class="container">
									<div class="div-table">
										<div class="div-cell">
											<div class="caption-content container">
												<h2 class="caption-title">ARAÇ KİRALAMA SERVİSİ</h2>
												<h3 class="caption-subtitle">SİZE EN UYGUN ARACI HEMEN
													KİRALAYIN</h3>
												<!-- Search form -->
												<div class="row">
													<div class="col-sm-9 col-md-9" style="margin-left: 125px;">
														<div class="form-search dark">
															<c:url value="/reservation/reservationQuery" var="reservationquery"></c:url>
															<form:form name="queryreservation" action="${reservationquery}"
																modelAttribute="newReservation" method="POST">
																<div class="form-title">
																	<i class="fa fa-car"></i>
																	<h2>Aşağıdaki alanları size uygun şekilde
																		doldurarak en uygun aracı bulabilirsiniz!</h2>
																</div>

																<div class="row row-inputs ">
																	<div class="container-fluid">
																		<div class="col-sm-6">
																			<div class="form-group has-icon has-label">
																				<label>İl</label>
																				<form:errors cssStyle="color: #B40404" path="receptionLocation.city"></form:errors>
																				<form:select path="receptionLocation.city"
																					onblur="getLocationBySelectedCity()"
																					style="background-color: #545454; font-family: inherit;"
																					name="city" class="form-control" id="city1">
																					<option value="">İl Seçiniz</option>
																					<c:forEach items="${cityList}" var="city">
																						<option value="${city}">${city}</option>
																					</c:forEach>
																				</form:select>
																				<span class="form-control-icon"><i
																					class="fa fa-home"></i></span>
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="form-group has-icon has-label">
																				<label>Lokasyon</label>
																				<form:errors cssStyle="color: #B40404" path="receptionLocation.locationname"></form:errors>
																				<form:select path="receptionLocation.locationname"
																					id="location1" name="beginlocation"
																					style="background-color: #545454; font-family: inherit;"
																					class="form-control">
																					<option value="">Lokasyon Seçiniz</option>
																				</form:select>
																				<div id="loading"></div>
																				<span class="form-control-icon"><i
																					class="fa fa-map-marker"></i></span>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="row row-inputs">
																	<div class="container-fluid">
																		<input id="username" type="hidden" value="${pageContext.request.userPrincipal.name}"/>
																		<div class="col-sm-3">
																			<div class="form-group has-icon has-label">
																				<label>Alış Tarihi</label>
																				<form:errors cssStyle="color: #B40404" path="datest"></form:errors>
																				<span id="starterror" style="color: #B40404"></span>
																				<div
																					class="input-group input-medium date date-picker"
																					data-date-format="dd/mm/yyyy"
																					data-date-start-date="+0d">
																					<form:input id="datest" path="datest" type="text" class="form-control"
																								onchange="getCompareDate()"></form:input>
																					<span class="input-group-btn">
																						<button
																							style="background-color: #3f4549; color: #b9b9b9; height: 40px;"
																							class="btn default" type="button">
																							<i class="fa fa-calendar"></i>
																						</button>
																					</span>
																				</div>
																			</div>
																		</div>
																		<div class="col-sm-3">
																			<div class="form-group">
																				<label class="control-label">Alış Saati</label>
																				<form:errors cssStyle="color: #B40404" path="starthour"></form:errors>
																				<div class="input-group" data-date-format="H:mm">
																					<form:input name="starthour" path="starthour" type="text"
																						class="form-control timepicker timepicker-24"></form:input>
																					<span class="input-group-btn">
																						<button
																							style="background-color: #3f4549; color: #b9b9b9; height: 40px;"
																							class="btn default" type="button">
																							<i class="fa fa-clock-o"></i>
																						</button>
																					</span>
																				</div>
																			</div>
																		</div>
																		<div class="col-sm-3">
																			<div class="form-group has-icon has-label">
																				<label>İade Tarihi</label>
																				<span id="enderror" style="color: #B40404"></span>
																				<form:errors cssStyle="color:#B40404" path="dateend"></form:errors>
																				<div
																					class="input-group input-medium date date-picker"
																					data-date-format="dd/mm/yyyy"
																					data-date-start-date="+0d">
																					<form:input id="dateend" path="dateend" type="text"
																						class="form-control" onchange="getCompareDate()"></form:input>
																					<span class="input-group-btn">
																						<button
																							style="background-color: #3f4549; color: #b9b9b9; height: 40px;"
																							class="btn default" type="button">
																							<i class="fa fa-calendar"></i>
																						</button>
																					</span>
																				</div>
																			</div>
																		</div>
																		<div class="col-sm-3">
																			<div class="form-group">
																				<label class="control-label">İade Saati</label>
																				<form:errors cssStyle="color: #B40404" path="endhour"></form:errors>
																				<div class="input-group" data-date-format="hh:mm">
																					<form:input name="endhour" path="endhour" type="text"
																						class="form-control timepicker timepicker-24"></form:input>
																					<span class="input-group-btn">
																						<button
																							style="background-color: #3f4549; color: #b9b9b9; height: 40px;"
																							class="btn default" type="submit">
																							<i class="fa fa-clock-o"></i>
																						</button>
																					</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<form:input type="hidden" path="hiredUsername"
																			value="${pageContext.request.userPrincipal.name}" />
																<div class="row row-submit">
																	<div class="container-fluid">
																		<div class="inner">
																			<button type="submit" id="formSearchSubmit"
																				class="btn btn-submit btn-theme pull-right">Araç Bul</button>
																			<br />
																		</div>
																	</div>
																</div>
															</form:form>
														</div>

													</div>
												</div>
												<!-- /Search form -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
			<!-- /PAGE -->
			<!-- PAGE -->
			<section class="page-section">
				<div class="container">

					<h2 class="section-title wow fadeInUp" data-wow-offset="70"
						data-wow-delay="100ms">
						<small>Ne tür bir araba tercih edersiniz?</small> <span> En
							uygun aracı bul</span>
					</h2>

					<div class="tabs wow fadeInUp" data-wow-offset="70"
						data-wow-delay="300ms">
						<ul id="tabs" class="nav">
							<!--
                            -->
							<li class=""><a href="#tab-1" data-toggle="tab">FIRSATLAR</a></li>
							<!--
                            -->
							<li class="active"><a href="#tab-2" data-toggle="tab">TERCİH
									EDİLEN</a></li>
							<!--
                            -->
							<li class=""><a href="#tab-3" data-toggle="tab">EKONOMİK</a></li>
						</ul>
					</div>

					<div class="tab-content wow fadeInUp" data-wow-offset="70"
						data-wow-delay="500ms">

						<!-- tab 1 -->
						<div class="tab-pane fade" id="tab-1">

							<div class="swiper swiper--offers-best">
								<div class="swiper-container">

									<div class="swiper-wrapper">
										<!-- Slides -->
										<c:forEach items="${carListByCity}" var="carList" >
											<div class="swiper-slide">
												<div
														class="thumbnail no-border no-padding thumbnail-car-card">
													<div class="media">
														<a class="media-link" data-gal="prettyPhoto"
														   href="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}">
															<img style="height: 202px; width: 348px;"
																 src="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}"
																 alt="" /> <span class="icon-view"><strong><i
																class="fa fa-eye"></i></strong></span>
														</a>
													</div>
													<div class="caption text-center">
														<h4 class="caption-title">
															<a href="#">${carList.brand}&nbsp;${carList.model}</a>
														</h4>
														<div class="caption-text">${carList.price}₺/günlük</div>
														<div class="buttons">
															<a class="btn btn-theme ripple-effect" href="#">Kirala</a>
														</div>
														<table class="table">
															<tr>
																<td><i class="fa fa-car"></i> ${carList.year}</td>
																<td><i class="fa fa-dashboard"></i> ${carList.fueltype}</td>
																<td><i class="fa fa-cog"></i> ${carList.geartype}</td>
																<td><i class="fa fa-road"></i> ${carList.capacity}&nbsp;kişilik</td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="swiper-button-next">
									<i class="fa fa-angle-right"></i>
								</div>
								<div class="swiper-button-prev">
									<i class="fa fa-angle-left"></i>
								</div>

							</div>

						</div>

						<!-- tab 2 -->
						<div class="tab-pane fade active in" id="tab-2">

							<div class="swiper swiper--offers-popular">
								<div class="swiper-container">

									<div class="swiper-wrapper">
										<!-- Slides -->
										<c:forEach items="${carListByCity}" var="carList" >
										<div class="swiper-slide">
											<div
												class="thumbnail no-border no-padding thumbnail-car-card">
												<div class="media">
													<a class="media-link" data-gal="prettyPhoto"
														href="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}">
														<img style="height: 202px; width: 348px;"
														src="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}"
														alt="" /> <span class="icon-view"><strong><i
																class="fa fa-eye"></i></strong></span>
													</a>
												</div>
												<div class="caption text-center">
													<h4 class="caption-title">
														<a href="#">${carList.brand}&nbsp;${carList.model}</a>
													</h4>
													<div class="caption-text">${carList.price}₺/günlük</div>
													<div class="buttons">
														<a class="btn btn-theme ripple-effect" href="#">Kirala</a>
													</div>
													<table class="table">
														<tr>
															<td><i class="fa fa-car"></i> ${carList.year}</td>
															<td><i class="fa fa-dashboard"></i> ${carList.fueltype}</td>
															<td><i class="fa fa-cog"></i> ${carList.geartype}</td>
															<td><i class="fa fa-road"></i> ${carList.capacity}&nbsp;kişilik</td>
														</tr>
													</table>
												</div>
											</div>
											</div>
										</c:forEach>
									</div>

								</div>

								<!-- If we need navigation buttons -->
								<div class="swiper-button-next">
									<i class="fa fa-angle-right"></i>
								</div>
								<div class="swiper-button-prev">
									<i class="fa fa-angle-left"></i>
								</div>

							</div>

						</div>

						<!-- tab 3 -->
						<div class="tab-pane fade" id="tab-3">

							<div class="swiper swiper--offers-economic">
								<div class="swiper-container">

									<div class="swiper-wrapper">
										<!-- Slides -->
										<c:forEach items="${carListByCity}" var="carList" >
											<div class="swiper-slide">
												<div
														class="thumbnail no-border no-padding thumbnail-car-card">
													<div class="media">
														<a class="media-link" data-gal="prettyPhoto"
														   href="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}">
															<img style="height: 202px; width: 348px;"
																 src="<%=request.getContextPath()%>/resources/resim/car-image/${carList.imagepath}"
																 alt="" /> <span class="icon-view"><strong><i
																class="fa fa-eye"></i></strong></span>
														</a>
													</div>
													<div class="caption text-center">
														<h4 class="caption-title">
															<a href="#">${carList.brand}&nbsp;${carList.model}</a>
														</h4>
														<div class="caption-text">${carList.price}₺/günlük</div>
														<div class="buttons">
															<a class="btn btn-theme ripple-effect" href="#">Kirala</a>
														</div>
														<table class="table">
															<tr>
																<td><i class="fa fa-car"></i> ${carList.year}</td>
																<td><i class="fa fa-dashboard"></i> ${carList.fueltype}</td>
																<td><i class="fa fa-cog"></i> ${carList.geartype}</td>
																<td><i class="fa fa-road"></i> ${carList.capacity}&nbsp;kişilik</td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>

								<!-- If we need navigation buttons -->
								<div class="swiper-button-next">
									<i class="fa fa-angle-right"></i>
								</div>
								<div class="swiper-button-prev">
									<i class="fa fa-angle-left"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /PAGE -->
			</div>
		<br/>
		</div>
		<!-- /CONTENT AREA -->

		<div id="to-top" class="to-top">
			<i class="fa fa-angle-up"></i>
		</div>

	</div>

	<%@include file="/WEB-INF/views/template/footer.jsp"%>
	<!-- END FOOTER -->
	<script s></script>
	<script
			src="<%=request.getContextPath()%>/resources/home.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/superfish/js/superfish.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/js/moment-with-locales.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.smoothscroll.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/swiper/js/swiper.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/prettyphoto/js/jquery.prettyPhoto.js"></script>

	<!-- JS Page Level -->
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/theme-ajax-mail.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/theme.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.cookie.js"></script>
	<script src="<%=request.getContextPath()%>/resources/ajax.js"></script>
	<script src="<%=request.getContextPath()%>/resources/home.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/metronic.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/layout.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/demo.js"
		type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/header.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/components-pickers.js"></script>
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Demo.init(); // init demo features
			ComponentsPickers.init();
		});
	</script>
	<script src="<%=request.getContextPath()%>/resources/header.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/user-profile/changepassword.js"></script>
</body>
<!-- END BODY -->
</html>

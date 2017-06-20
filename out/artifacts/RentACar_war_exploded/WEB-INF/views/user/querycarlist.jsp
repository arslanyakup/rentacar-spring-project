<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!-- Head BEGIN -->
<head>
<title>Arabalık</title>
<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/theme.css">
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/components.css"
	rel="stylesheet" type="text/css">
<!-- Global styles START -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Global styles END -->
<!-- Theme styles START -->
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/plugins.css"
	rel="stylesheet" type="text/css">
<!-- Theme styles END -->

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body id="home" class="wide">

	<%@include file="/WEB-INF/views/template/header.jsp"%>

	<!-- WRAPPER -->
	<div class="wrapper">

		<!-- CONTENT AREA -->
		<div class="content-area">

			<!-- PAGE WITH SIDEBAR -->
			<section class="page-section with-sidebar sub-page">
				<div class="container">
					<div class="row">
						<!-- CONTENT -->
						<c:url value="/reservation/reservationQuery" var="query"></c:url>
						<form:form modelAttribute="newReservation" method="POST"
							action="${query}">
							<div class="col-md-3">

								<div>
									<!-- BEGIN Portlet PORTLET-->
									<div class="portlet box green-meadow">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-search"></i>Arama Bilgileri
											</div>
											<div class="tools">
												<a style="color: black" href="javascript:;" class="collapse">
												</a>
											</div>
										</div>
										<div class="portlet-body">
											<label>İl</label>
											<form:select path="receptionLocation.city"
												onblur="getLocationBySelectedCity3()" name="city"
												style="height: 30px !important;"
												class="bs-select form-control" id="city1">
												<c:forEach items="${cityList}" var="cityList">
													<!-- Kullanıcının diğer sayfada seçtiği bilgilerin 
												otomatik olarak gelmesi için kullanıyoruz.. -->
													<c:if
														test="${newReservation.receptionLocation.city==cityList}">
														<option selected="selected">${newReservation.receptionLocation.city}</option>
													</c:if>
													<c:if
														test="${newReservation.receptionLocation.city!=cityList}">
														<option>${cityList}</option>
													</c:if>
												</c:forEach>
											</form:select>
										</div>
										<div class="portlet-body">
											<label>İlçe</label>
											<form:select style="height: 30px !important;" id="location1"
												path="receptionLocation.locationname"
												class="bs-select form-control">
												<option selected="selected">${newReservation.receptionLocation.locationname}</option>
											</form:select>
										</div>
										<div class="portlet-body">
											<label>Alış Tarihi</label>
											<div style="width: 100% !important;"
												class="input-group input-medium date date-picker"
												data-date-format="dd/mm/yyyy" data-date-start-date="+0d">
												<form:input value="${newReservation.datest}" path="datest"
													type="text" class="form-control"></form:input>
												<span class="input-group-btn">
													<button class="btn default" type="button">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
											</div>
										</div>
										<div class="portlet-body">
											<label>Alış Saati</label>
											<div class="input-group">
												<form:input value="${newReservation.starthour}"
													path="starthour" type="text"
													class="form-control timepicker timepicker-24"></form:input>
												<span class="input-group-btn">
													<button class="btn default" type="button">
														<i class="fa fa-clock-o"></i>
													</button>
												</span>
											</div>
										</div>
										<div class="portlet-body">
											<label>İade Tarihi</label>
											<div style="width: 100% !important;"
												class="input-group input-medium date date-picker"
												data-date-format="dd/mm/yyyy" data-date-start-date="+0d">
												<form:input value="${newReservation.dateend}" path="dateend"
													type="text" class="form-control"></form:input>
												<span class="input-group-btn">
													<button class="btn default" type="button">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
											</div>
										</div>
										<div class="portlet-body">
											<label>İade Saati</label>
											<div class="input-group">
												<form:input value="${newReservation.endhour}" path="endhour"
													type="text" class="form-control timepicker timepicker-24"></form:input>
												<span class="input-group-btn">
													<button class="btn default" type="button">
														<i class="fa fa-clock-o"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<div class="portlet box green-meadow">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-car"></i>Araç Tipi
											</div>
											<div class="tools">
												<a style="color: black" href="javascript:;" class="collapse">
												</a>
											</div>
										</div>
										<div class="portlet-body">
											<div>
												<label> <form:checkbox id="ekonomik"
														path="carTypeList" value="Ekonomik" />Ekonomik <br /> <form:checkbox
														id="orta" path="carTypeList" value="Orta" />Orta <br />
													<form:checkbox id="standart" path="carTypeList"
														value="Standart" />Standart <br /> <form:checkbox
														id="prestij" path="carTypeList" value="Prestij" />Prestij
													<br /> <form:checkbox id="premium" path="carTypeList"
														value="Premium" />Premium <br /> <form:checkbox
														id="buyuk" path="carTypeList" value="Büyük" />Büyük <br />
													<form:checkbox id="tumu" path="carTypeList" value="Tümü" />Tümü
													<br />
												</label>
											</div>

										</div>
									</div>
									<div class="portlet box green-meadow">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-cogs"></i>Vites Türü
											</div>
											<div class="tools">
												<a style="color: black" href="javascript:;" class="collapse">
												</a>
											</div>
										</div>
										<div class="portlet-body">
											<div>
												<label> <c:forEach items="${gearType}" var="gear">
														<form:checkbox path="gearTypeList" value="${gear}" />${gear}
													<br>
													</c:forEach>
												</label>
											</div>

										</div>
									</div>
									<div class="portlet box green-meadow">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-bars"></i>Yakıt Türü
											</div>
											<div class="tools">
												<a style="color: black" href="javascript:;" class="collapse">
												</a>
											</div>
										</div>
										<div class="portlet-body">
											<div>
												<label> <c:forEach items="${fuelType}"
														var="fuelType">
														<form:checkbox path="fuelTypeList" value="${fuelType}" />${fuelType}
														<br />
													</c:forEach>
												</label>
											</div>

										</div>
									</div>
									<!-- END Portlet PORTLET-->
									<div>
										<button style="background-color: #2F9296; border: 0px;"
											type="submit" class="btn btn-primary btn-lg btn-block">SORGULA</button>
									</div>
								</div>
							</div>
						</form:form>

						<div class="col-md-9 content car-listing" id="content">

							<b><h2 style="color: black;">Toplam ${size} adet Araba
									bulduk!!!</h2></b> <br />
							<!-- Car Listing -->
							<c:forEach items="${carList}" var="car">
								<div
									class="thumbnail no-border no-padding thumbnail-car-card clearfix">
									<div class="media">
											<img style="width: 350px; height: 210px;"
											src="<%=request.getContextPath()%>/resources/resim/car-image/${car.imagepath}"
											alt="${car.brand} ${car.model}" />
									</div>
									<div class="caption">
										<h4 class="caption-title">
											<a href="#"></a>
										</h4>
										<h3 class="caption-title-sub">
											<b>${car.brand } ${car.model }</b>
										</h3>
										<div class="caption-text">
											<div style="margin-top: 0px;" class="col-md-6">
												<table style="color: grey;">
													<tr>
														<td style="font-size: 15px;"><i class="fa fa-car"></i><b>
																${car.vehicleclass} sınıf</b></td>
													</tr>
													<tr>
														<td style="font-size: 15px;"><i
															class="fa fa-dashboard"></i><b> ${car.fueltype} yakıt</b></td>
													</tr>
													<tr>
														<td style="font-size: 15px;"><i
															class="fa fa-tachometer"></i><b> ${car.geartype}
																vites</b></td>
													</tr>
													<tr>
														<td style="font-size: 15px;"><i class="fa fa-road"></i><b>
																${car.year } model</b></td>
													</tr>
													<tr>
														<td style="font-size: 15px;"><i class="fa fa-road"><b></i>
															${car.capacity} koltuk</b></td>
													</tr>
												</table>
											</div>
											<div class="col-md-6">
												<label
													style="color:#2F9296; margin-top: center; margin-bottom: center; margin-left: 60px; font-size: 40px;">${car.price}
													TL</label>
											</div>
										</div>
										<form:form modelAttribute="newReservation"
											action="selectedcar" method="GET">
											<form:input type="hidden" path="car.id" value="${car.id}" />
											<form:input type="hidden" path="hiredUsername"
												value="${pageContext.request.userPrincipal.name}" />
											<table class="table">
												<tr>
													<td class="buttons"><button
															style="background-color: #2F9296; border: 0px; font-size: larger;"
															type="submit" class="btn btn-primary btn-lg btn-block"><b>KİRALA</b></button>
													</td>
												</tr>
											</table>
										</form:form>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- /CONTENT -->
					</div>
				</div>
			</section>
			<!-- /PAGE WITH SIDEBAR -->

		</div>
		<!-- /CONTENT AREA -->

		<div id="to-top" class="to-top">
			<i class="fa fa-angle-up"></i>
		</div>
	</div>
	<!-- /WRAPPER -->
	<%@include file="/WEB-INF/views/template/footer.jsp"%>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/jquery.min.js"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/metronic.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/layout.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/demo.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/components-pickers.js"></script>
	<!-- JS Page Level -->
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/ajax.js"></script>
</body>
<!-- END BODY -->
</html>

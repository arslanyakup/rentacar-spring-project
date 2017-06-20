<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@page import="com.rental.car.service.impl.LocationServiceImpl"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.rental.car.service.LocationService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
<title>${user.username}</title>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/uniform.default.css"
	rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="<%=request.getContextPath()%>/resources/user-profile/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/resources/user-profile/profile.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link
	href="<%=request.getContextPath()%>/resources/user-profile/components.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/plugins.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/default.css"
	rel="stylesheet" type="text/css" id="style_color">
<link
	href="<%=request.getContextPath()%>/resources/user-profile/custom.css"
	rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/theme.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/plugins.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/layout.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style-responsive.css"
	rel="stylesheet">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>

	<%@ include file="/WEB-INF/views/template/header.jsp"%>

	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">
		<!-- BEGIN PAGE CONTENT -->
		<div class="page-content">
			<div class="container">
				<div class="row profile">
					<div class="col-md-12">
						<!--BEGIN TABS-->
						<div class="tabbable tabbable-custom tabbable-noborder">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_1_1" data-toggle="tab">Profil</a></li>
								<c:if
									test="${pageContext.request.userPrincipal.name==user.username}">
									<li><a href="#tab_1_3" data-toggle="tab"> Hesap
											Ayarları </a></li>

								</c:if>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_1_1">
									<div class="row">
										<div class="col-md-3">
											<ul class="list-unstyled profile-nav">
												<li><img
													src="<%=request.getContextPath()%>/resources/resim/user-image/${user.imagePath}"
													class="img-responsive" alt="" /></li>
											</ul>
										</div>
										<div class="col-md-9">
											<div class="row">
												<div class="col-md-8 profile-info">
													<h1>${user.firstname}&nbsp;${user.lastname}</h1>

													<ul class="list-inline">
														<br />
														<li><i class="fa fa-map-marker"></i>${user.address.city}</li>
														<br />
														<br />
														<li><i class="fa fa-globe"></i>
															${user.address.district}</li>
														<br />
														<br />
														<li><i class="fa fa-mobile"></i> ${user.telephone}</li>
														<br />
														<br />
														<li><i class="fa fa-envelope-o"></i>${user.email}</li>
													</ul>
												</div>
											</div>
											<!--end row-->
											<div class="tabbable tabbable-custom tabbable-custom-profile">
												<ul class="nav nav-tabs">
													<c:if
														test="${pageContext.request.userPrincipal.name==user.username}">
														<li class="active"><a href="#tab_1_11"
															data-toggle="tab"> Önceki Rezervasyonlar</a></li>
														<li><a href="#tab_1_22" data-toggle="tab">Araçlarım</a></li>
														<li><input id="username" type="hidden"
															value="${pageContext.request.userPrincipal.name==user.username}">
															<a href="#tab_1_23" data-toggle="tab">Onaylanmamış
																Rezervasyonlar </a></li>
													</c:if>
													<c:if
														test="${pageContext.request.userPrincipal.name!=user.username}">
														<li class="active"><a href="#tab_1_22"
															data-toggle="tab">Araçlar</a></li>
													</c:if>

												</ul>
												<div class="tab-content">
													<c:if
														test="${pageContext.request.userPrincipal.name==user.username}">
														<div class="tab-pane active" id="tab_1_11">
															<div class="portlet-body">
																<table
																	class="table table-striped table-bordered table-advance table-hover">
																	<thead>
																		<tr>
																			<th><i class=""></i> Araç</th>
																			<th><i class=""></i> Alış Tarihi</th>
																			<th class="hidden-xs"><i class=""></i>İade
																				Tarihi</th>
																			<th class="hidden-xs"><i class=""></i>Durum</th>
																		</tr>
																	</thead>
																	<c:forEach items="${reservationList}" var="reservation">
																		<tbody>
																			<tr>
																				<td><a href="#"> ${reservation.car.brand}
																						${reservation.car.model}</a></td>
																				<td class="hidden-xs">${reservation.datest}</td>
																				<td class="hidden-xs">${reservation.dateend}</td>
																				<td class="hidden-xs"><c:if
																						test="${reservation.car.hire==true}">
																						<span class="label label-danger label-sm">Kirada</span>
																					</c:if> <c:if test="${reservation.car.hire==false}">
																						<span class="label label-success label-sm">Kiralanabilir</span>
																					</c:if></td>
																			</tr>
																		</tbody>
																	</c:forEach>
																</table>
															</div>
														</div>
														<div class="tab-pane" id="tab_1_22">
															<div class="tab-pane active" id="tab_1_1_1">
																<div class="portlet-body">
																	<table
																		class="table table-striped table-bordered table-advance table-hover">
																		<thead>
																			<tr>
																				<th><i class=""></i> Model</th>
																				<th><i class=""></i> Sınıf</th>
																				<th class="hidden-xs"><i class=""></i>Model
																					Yılı</th>
																				<th class="hidden-xs"><i class=""></i>Vites
																					Tipi</th>
																				<th class="hidden-xs"><i class=""></i>Yakıt
																					Türü</th>
																				<th class="hidden-xs"><i class=""></i>Kapasite</th>
																				<th class="hidden-xs"><i class=""></i>Resim</th>
																				<th class="hidden-xs"><i class=""></i>Durum</th>
																			</tr>
																		</thead>
																		<c:forEach items="${carList}" var="car">
																			<tbody>
																				<tr>
																					<td><a href="#"> ${car.brand} ${car.model}</a></td>
																					<td class="hidden-xs">${car.vehicleclass}</td>
																					<td class="hidden-xs">${car.year}</td>
																					<td class="hidden-xs">${car.geartype}</td>
																					<td class="hidden-xs">${car.fueltype}</td>
																					<td class="hidden-xs">${car.capacity}</td>
																					<td class="hidden-xs"><img alt=""
																						style="height: 80px; width: 130px;"
																						src="<%=request.getContextPath()%>/resources/resim/car-image/${car.imagepath}"></td>
																					<td class="hidden-xs"><c:if
																							test="${car.hire==true}">
																							<span class="label label-danger label-sm">Kirada</span>
																						</c:if> <c:if test="${car.hire==false}">
																							<span class="label label-success label-sm">Kiralanabilir</span>
																						</c:if></td>
																				</tr>
																			</tbody>
																		</c:forEach>
																	</table>
																</div>

															</div>
														</div>
														<div class="tab-pane" id="tab_1_23">
															<div class="tab-pane active" id="tab_1_1_1">
																<div class="portlet-body">
																	<table
																		class="table table-striped table-bordered table-advance table-hover">
																		<thead>
																			<tr>
																				<th><i class=""></i> Araç</th>
																				<th><i class=""></i> Alış Tarihi</th>
																				<th class="hidden-xs"><i class=""></i>İade&nbsp;Tarihi</th>
																				<th class="hidden-xs"><i class=""></i>Rezervasyon&nbsp;Sahibi</th>
																				<th style="width: 113px;" class="hidden-xs"><i
																					class=""></i>Onay Durumu</th>
																			</tr>
																		</thead>
																		<c:forEach items="${approvalReservation}"
																			var="reservation">
																			<tbody>
																				<tr>
																					<td><a href="#">
																							${reservation.car.brand}&nbsp;${reservation.car.model}</a></td>
																					<td class="hidden-xs">${reservation.dateend}</td>
																					<td class="hidden-xs">${reservation.datest}</td>
																					<td class="hidden-xs"><a
																						href="<%=request.getContextPath()%>/user/profile/${reservation.hiredUsername}">
																							${reservation.hiredUsername} </a></td>
																					<td class="hidden-xs"><a
																						href="../../reservation/approvalreservation/${reservation.id}
																						?approvalStatus=true">
																							<button style="width: 40px;" class="btn blue">
																								<i class="fa fa-check"></i>
																							</button>
																					</a> <a
																						href="../../reservation/approvalreservation/${reservation.id}?approvalStatus=false">
																							<button style="width: 40px;" class="btn red">
																								<i class="fa fa-times"></i>
																							</button>
																					</a></td>
																				</tr>
																			</tbody>
																		</c:forEach>
																	</table>
																</div>
															</div>
														</div>
													</c:if>
													<c:if
														test="${pageContext.request.userPrincipal.name!=user.username}">
														<div class="tab-pane active" id="tab_1_22">
															<div class="tab-pane active" id="tab_1_1_1">
																<div class="portlet-body">
																	<table
																		class="table table-striped table-bordered table-advance table-hover">
																		<thead>
																			<tr>
																				<th><i class=""></i> Model</th>
																				<th><i class=""></i> Sınıf</th>
																				<th class="hidden-xs"><i class=""></i>Model
																					Yılı</th>
																				<th class="hidden-xs"><i class=""></i>Vites
																					Tipi</th>
																				<th class="hidden-xs"><i class=""></i>Yakıt
																					Türü</th>
																				<th class="hidden-xs"><i class=""></i>Kapasite</th>
																				<th class="hidden-xs"><i class=""></i>Resim</th>
																				<th class="hidden-xs"><i class=""></i>Durum</th>
																			</tr>
																		</thead>
																		<c:forEach items="${carList}" var="car">
																			<tbody>
																				<tr>
																					<td><a href="#"> ${car.brand} ${car.model}</a></td>
																					<td class="hidden-xs">${car.vehicleclass}</td>
																					<td class="hidden-xs">${car.year}</td>
																					<td class="hidden-xs">${car.geartype}</td>
																					<td class="hidden-xs">${car.fueltype}</td>
																					<td class="hidden-xs">${car.capacity}</td>
																					<td class="hidden-xs"><img alt=""
																						style="height: 80px; width: 130px;"
																						src="<%=request.getContextPath()%>/resources/resim/car-image/${car.imagepath}"></td>
																					<td class="hidden-xs"><c:if
																							test="${car.hire==true}">
																							<span class="label label-danger label-sm">Kirada</span>
																						</c:if> <c:if test="${car.hire==false}">
																							<span class="label label-success label-sm">Kiralanabilir</span>
																						</c:if></td>
																				</tr>
																			</tbody>
																		</c:forEach>
																	</table>
																</div>

															</div>
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--tab_1_2-->
								<div class="tab-pane" id="tab_1_3">
									<div class="row profile-account">
										<div class="col-md-3">
											<ul class="ver-inline-menu tabbable margin-bottom-10">
												<li class="active"><a data-toggle="tab" href="#tab_1-1">
														<i class="fa fa-cog"></i> Kişisel Bilgiler
												</a> <span class="after"> </span></li>
												<li><a data-toggle="tab" href="#tab_2-2"> <i
														class="fa fa-picture-o"></i> Profil Fotografını Güncelle
												</a></li>
												<li><a data-toggle="tab" href="#tab_3-3"> <i
														class="fa fa-lock"></i> Şifre Değiştir
												</a></li>
											</ul>
										</div>
										<div class="col-md-9">
											<div class="tab-content">
												<div id="tab_1-1" class="tab-pane active">
													<form:form modelAttribute="user" role="form"
														action="update" method="POST">
														<div class="form-group">
															<label class="control-label">Ad</label>
															<form:input path="firstname" value="${user.firstname}"
																type="text" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Soyad</label>
															<form:input path="lastname" value="${user.lastname}"
																type="text" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Telefon</label>
															<form:input path="telephone" value="${user.telephone}"
																type="text" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">E-Mail</label>
															<form:input path="email" value="${user.email}"
																type="text" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">İl</label>
															<form:input path="address.city"
																value="${user.address.city}" type="text"
																class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">İlçe</label>
															<form:input path="address.district"
																value="${user.address.district}" type="text"
																class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Geniş Adres</label>
															<form:textarea path="address.wideAddress"
																value="${user.address.wideAddress}" class="form-control"
																rows="3" />
														</div>
														<form:input type="hidden" path="id" value="${user.id}" />
														<div class="margiv-top-10">
															<input value="Güncelle" type=submit class="btn green" />
															<a href="${user.username}" class="btn default">
																Vazgeç </a>
														</div>
													</form:form>
												</div>
												<div id="tab_2-2" class="tab-pane">
													<form:form modelAttribute="user" action="updatephoto"
														method="POST" enctype="multipart/form-data">
														<div class="form-group">
															<div class="fileinput fileinput-new"
																data-provides="fileinput">
																<div class="fileinput-new thumbnail"
																	style="width: 200px; height: 150px;">
																	<img
																		src="<%=request.getContextPath()%>/resources/resim/user-image/${user.imagePath}"
																		alt="" />
																</div>
																<div
																	class="fileinput-preview fileinput-exists thumbnail"
																	style="max-width: 200px; max-height: 150px;"></div>

																<form:input id="userid" type="hidden" path="id"
																	value="${user.id}" />

																<div>
																	<span class="btn default btn-file"> <span
																		class="fileinput-new"> Resim Seç </span> <span
																		class="fileinput-exists"> Değiştir </span> <form:input
																			path="userImage" type="file" name="file" />
																	</span> <a href="#" class="btn default fileinput-exists"
																		data-dismiss="fileinput"> Vazgeç </a>
																</div>
															</div>
														</div>
														<div class="margin-top-10">
															<input value="Güncelle" type=submit class="btn green" />
															<a href="${user.username}" class="btn default">
																Vazgeç </a>
														</div>
													</form:form>
												</div>
												<div id="tab_3-3" class="tab-pane">
													<form id="changepassword" name="changepassword" action="#">
														<div class="form-group">
															<h4 style="color: red" id="oldpasswordconfirm"></h4>
															<label class="control-label">Şimdiki Şifre</label> <input
																id="password" type="password" class="form-control" />
														</div>
														<h4 style="color: red" id="divCheckPasswordMatch"></h4>
														<div class="form-group">
															<label class="control-label">Yeni Şifre</label> <input
																type="password" id="newpassword" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Yeni Şifre Tekrarı</label> <input
																type="password" id="confirmpassword"
																class="form-control" />
														</div>
														<div class="margin-top-10">
															<a class="btn green" onclick="checkPasswordMatch()">
																Şifre Değiştir </a> <a href="${user.username}"
																class="btn default"> Vazgeç </a>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--END TABS-->
					</div>
				</div>
				<!-- END PAGE CONTENT INNER -->
			</div>
		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
	<div class="scroll-to-top">
		<i class="icon-arrow-up"></i>
	</div>
	<%@include file="/WEB-INF/views/template/footer.jsp"%>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/bootbox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery.cokie.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/user-profile/bootstrap-fileinput.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/metronic.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/layout.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/resources/user-profile/demo.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			// initiate layout and plugins
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Demo.init(); // init demo features
		});
	</script>
	<script src="<%=request.getContextPath()%>/resources/header.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/user-profile/changepassword.js"></script>
	<script src="<%=request.getContextPath()%>/resources/ajax.js"></script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

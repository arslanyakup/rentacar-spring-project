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
<title>Kaydol</title>
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
	<div class="page-content">
		<div class="container" style="margin-bottom: 50px;">
			<div class="row profile">
				<div class="col-md-6 col-md-offset-3">
					<!--BEGIN TABS-->
					<div class="tabbable tabbable-custom tabbable-noborder">
						<div class="tab-content">
							<div class="row profile-account">
								<div class="col-md-12">
								<h4 style="margin: auto; padding: inherit;">DEVAM ETMEK İÇİN LÜTFEN AŞAĞIDAKİ ALANLARI EKSİKSİZ DOLDURUN!</h4>
									<div class="tab-content" style="height: 1050px;">
										<div id="tab_1-1" class="tab-pane active">
											<form:form modelAttribute="newUser" action="information"
												enctype="multipart/form-data" method="POST">
												<div class="form-group">
													<label class="control-label">Ad</label>
													<form:input path="firstname" type="text"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">Soyad</label>
													<form:input path="lastname" type="text"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">Kullanıcı Adı</label>
													<form:input id="username" onchange="getUserBy()" path="username" type="text"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">Şifre</label>
													<form:input path="password" type="password"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">Telefon</label>
													<form:input path="telephone" value="${user.telephone}"
														type="text" class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">E-Mail</label>
													<form:input path="email" type="text" class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">İl</label>
													<form:input path="address.city" type="text"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">İlçe</label>
													<form:input path="address.district" type="text"
														class="form-control" />
												</div>
												<div class="form-group">
													<label class="control-label">Geniş Adres</label>
													<form:textarea path="address.wideAddress"
														class="form-control" rows="3" />
												</div>
												<div>
													<div class="col-md-6">
														<label class="control-label">Profil Resmi</label>
														<div class="form-group">
															<div class="fileinput fileinput-new"
																data-provides="fileinput">
																<div class="fileinput-new thumbnail"
																	style="width: 200px; height: 150px;">
																	<img
																		src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
																		alt="" />
																</div>
																<div
																	class="fileinput-preview fileinput-exists thumbnail"
																	style="max-width: 200px; max-height: 150px;"></div>
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
													</div>
													<div class="col-md-6">
														<label class="control-label">Ehliyet Resmi</label>
														<div class="form-group">
															<div class="fileinput fileinput-new"
																data-provides="fileinput">
																<div class="fileinput-new thumbnail"
																	style="width: 200px; height: 150px;">
																	<img
																		src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
																		alt="" />
																</div>
																<div
																	class="fileinput-preview fileinput-exists thumbnail"
																	style="max-width: 200px; max-height: 150px;"></div>
																<div>
																	<span class="btn default btn-file"> <span
																		class="fileinput-new"> Resim Seç </span> <span
																		class="fileinput-exists"> Değiştir </span> <form:input
																			path="ehliyetImage" type="file" name="file" />
																	</span> <a href="#" class="btn default fileinput-exists"
																		data-dismiss="fileinput"> Vazgeç </a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div>
													<div class="col-md-9"></div>
													<div class="col-md-3">
														<div class="margin-top-10; margin-bottom-10">
															<button style="background-color: #2F9296; border: 0px; width: 115px;"
																type="submit" class="btn btn-primary btn-lg btn-block">DEVAM&nbsp;ET</button>
														</div>
													</div>
												</div>
											</form:form>
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
	<!-- END PAGE CONTENT -->
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
	<script src="<%=request.getContextPath()%>/resources/register.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/user-profile/changepassword.js"></script>
	<script src="<%=request.getContextPath()%>/resources/ajax.js"></script>
	<script src="<%=request.getContextPath()%>/resources/header.js"></script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

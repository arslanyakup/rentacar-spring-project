<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
	rel="stylesheet" type="text/css">

<link
	href="<%=request.getContextPath()%>/resources/css/simple-line-icons.min.css"
	rel="stylesheet" type="text/css">

<link href="<%=request.getContextPath()%>/resources/css/layout.css"
	rel="stylesheet">


<!-- BEGIN TOP BAR -->
<div class="pre-header">
	<div class="container">
		<div class="row">
			<!-- BEGIN TOP BAR LEFT PART -->
			<div class="col-md-6 col-sm-6 additional-shop-info">
				<ul class="list-unstyled list-inline"
					style="font-size: 14px;">
					<li><i class="fa fa-envelope-o"></i><span>arabalikkurumsal@gmail.com</span></li>
				</ul>
			</div>
			<!-- END TOP BAR LEFT PART -->
			<!-- BEGIN TOP BAR MENU -->
			<div class="col-md-6 col-sm-6 additional-nav">
				<ul class="list-unstyled list-inline pull-right" >
					<sec:authorize access="authenticated" var="authenticated" />
					<c:choose>
						<c:when test="${authenticated}">
							<sec:authentication var="role" property="name" />
							<!-- BEGIN USER LOGIN DROPDOWN -->
							<li class="dropdown dropdown-user dropdown-dark"
								style="font-size: 14px;">
								<span id="span1" style="background-color: #B40404;" class="badge badge-danger"> </span> 
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-close-others="true"> <img
									style="width: 30px; height: 30px;" alt="" class="img-circle"
									src="<%=request.getContextPath()%>/resources/resim/user-image/${pageContext.request.userPrincipal.name}.png">
									<span class="username username-hide-mobile">${pageContext.request.userPrincipal.name}</span>
									<input id="username" type="hidden" value="${pageContext.request.userPrincipal.name}"/>
							</a>
								<ul class="dropdown-menu dropdown-menu-default"
									style="background-color: #ffffff; border: 0;">
									<li><a
										href="<%=request.getContextPath()%>/user/profile/${pageContext.request.userPrincipal.name}">
											<i class="fa fa-user"></i>Profil&nbsp;&nbsp;&nbsp;
											<span id="span2" style="background-color: #B40404;" class="badge badge-danger"></span> 
									</a></li>
									<li><a id="logout1" href="#"><i class="fa fa-sign-out"></i>Çıkış
											Yap</a>
										<form id="form-logout1" action="<c:url value="/logout"/>"
											method="post">
											<sec:csrfInput />
										</form></li>
								</ul></li>
							<!-- END USER LOGIN DROPDOWN -->


						</c:when>
						<c:otherwise>
							<li style="font-size: 14px;"><a
								href="<%=request.getContextPath()%>/login">Giriş Yap</a></li>
							<li style="font-size: 14px;"><a
								href="<%=request.getContextPath()%>/user/register">Kaydol</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- END TOP BAR MENU -->
		</div>
	</div>
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div class="header">
	<div class="container">
		<c:url value="/" var="url"></c:url>
		<a class="site-logo" href="${url}"><img class="img-responsive"
			style="width: 120px;"
			src="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/img/logos/logoy.png"
			alt="Metronic FrontEnd"></a> <a href="javascript:void(0);"
			class="mobi-toggler"><i class="fa fa-bars"></i></a>

		<!-- BEGIN NAVIGATION -->
		<div class="header-navigation pull-right font-transform-inherit">
			<ul>
				<li><a href="<%=request.getContextPath()%>/">Anasayfa</a></li>
				<li><a href="<%=request.getContextPath()%>/kiralamakosullari">Kiralama Koşulları</a></li>
				<c:if test="${authenticated}">
					<li><a href="<%=request.getContextPath()%>/user/addcar">Kiraya
							Ver</a></li>
				</c:if>
				<li><a href="<%=request.getContextPath()%>/hakkimizda">Hakkımızda</a></li>
				<li><a href="<%=request.getContextPath()%>/iletisim">İletişim</a></li>
			</ul>
		</div>
		<!-- END NAVIGATION -->
	</div>
</div>
<!-- Header END -->
<script 
	src="<%=request.getContextPath()%>/resources/ajax.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/global.js"></script>
<script
	src="<%=request.getContextPath()%>/resources\themefolder1\assets\plugins\bootstrap-hover-dropdown\bootstrap-hover-dropdown.min.js"
	type="text/javascript"></script>


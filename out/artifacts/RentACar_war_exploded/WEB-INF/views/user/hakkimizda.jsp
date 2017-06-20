<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!-- Head BEGIN -->
<head>
    <title>Hakkımızda</title>
    <!-- Favicon -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="<%=request.getContextPath()%>/resources/themefolder1/assets/ico/apple-touch-icon-144-precomposed.png">
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
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">

    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-select/bootstrap-select.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
            rel="stylesheet">
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

                    <h1>Hakkımızda</h1>

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
<script src="<%=request.getContextPath()%>/resources/header.js"></script>

</body>
<!-- END BODY -->
</html>
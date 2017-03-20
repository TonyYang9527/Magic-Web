<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="sitemesh"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>QuickStart示例:<sitemesh:title />
</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="static/bootstrap/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="static/bootstrap/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="static/plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="static/plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="static/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet" href="static/plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="static/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<sitemesh:head />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- header -->
		<!-- <jsp:include page="/WEB-INF/layouts/header.jsp" /> -->
		<!-- left_app -->
		<!--<jsp:include page="/WEB-INF/layouts/left_app.jsp" />-->
		<div class="content-wrapper">
			<sitemesh:body />
		</div>
		<!-- footer -->
		<!--	<jsp:include page="/WEB-INF/layouts/footer.jsp" />-->
		<!-- Control Sidebar -->
		<!-- <jsp:include page="/WEB-INF/layouts/sidebar.jsp" />-->
	</div>
	<!-- jQuery 2.2.3 -->
	<script src="static/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="static/plugins/jQueryUI/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.6 -->
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script src="static/plugins/raphaeljs/raphael-min.js"></script>
	<script src="static/plugins/morris/morris.min.js"></script>
	<!-- Sparkline -->
	<script src="static/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="static/plugins/knob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script src="static/plugins/moment_js/moment.min.js"></script>
	<script src="static/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script src="static/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script src="static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script src="static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="static/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="static/dist/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="static/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="static/dist/js/demo.js"></script>
</body>
</html>
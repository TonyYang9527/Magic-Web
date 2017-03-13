<%@ page import="com.dcf.iqunxing.fx.passport.spring.LoginUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>AT - 自动化发布平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.4 -->
  <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- FontAwesome 4.3.0 -->
  <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <!-- Theme style -->
  <link href="static/dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link href="static/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

  <!-- DATA TABLES -->
  <link href="static/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />

  <!-- 日期选择器 -->
  <link href="static/plugins/timepicker-addon/jquery-ui-timepicker-addon.min.css" rel="stylesheet" type="text/css" />
  <link href="static/plugins/jQueryUI/css/Aristo/Aristo.css" rel="stylesheet" type="text/css" />

  <!-- 步骤流程图插件 -->
  <link href="static/plugins/ystep/ystep.css" rel="stylesheet" type="text/css" />

  <!-- tag多选插件 -->
  <link href="static/plugins/tag_handler/css/jquery.taghandler.css" rel="stylesheet" type="text/css" />


</head>
<body class="skin-blue fixed sidebar-mini">

<!-- jQuery 2.1.4 -->
<script src="static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="static/plugins/jQueryUI/jquery-ui.min.js" type="text/javascript"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script type="text/javascript">
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="static/plugins/moment_js/moment.min.js" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="static/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="static/plugins/fastclick/fastclick.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="static/dist/js/app.min.js" type="text/javascript"></script>

<!-- DataTable -->
<script src="static/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="static/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="static/plugins/datatables/fnReloadAjax.js" type="text/javascript"></script>

<!-- underscore模板引擎 -->
<script src="static/plugins/underscore/underscore-min.js" type="text/javascript"></script>

<!-- list快速检索组件 -->
<script src="static/plugins/list_js/list.min.js" type="text/javascript"></script>

<!-- jquery validation -->
<script src="static/plugins/validation/jquery.validate.min.js" type="text/javascript"></script>

<!-- 步骤流程图插件 -->
<script src="static/plugins/ystep/ystep.js" type="text/javascript"></script>

<!-- 日期选择器 -->
<script src="static/plugins/timepicker-addon/jquery-ui-timepicker-addon.min.js" type="text/javascript"></script>
<script src="static/plugins/timepicker-addon/i18n/jquery-ui-timepicker-zh-CN.js"></script>

<!-- jQuery.search扩展 -->
<script src="static/plugins/jQueryPlugin/jquery.search.js" type="text/javascript"></script>

<!-- tag多选插件 -->
<script src="static/plugins/tag_handler/jquery.taghandler.min.js" type="text/javascript"></script>

<!-- 帮助类 -->
<script src="static/dist/js/utility.js" type="text/javascript"></script>

<!--单点登录辅助js，定时刷新保证不掉线，防止ajax调用时sso验证无法跳转-->
<script src="http://passport.fx.dcfservice.com/static/js/smart-sso.js" type="text/javascript"></script>

<script>
  //定义模板引擎的全局变量
  _.templateSettings = {
    interpolate: /\<\@\=(.+?)\@\>/gim,
    evaluate: /\<\@(.+?)\@\>/gim,
    escape: /\<\@\-(.+?)\@\>/gim,
    variable: "rc"
  };

  $(document).ready(function () {
    //获取应用程序版本号
    $.get("/api/getVersion", function (data) {
      $("#appVersion").text(data);
    });
  })
</script>




<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>AT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">自动化发布平台 <small id="appVersion" class="label label-success" style="font-size:11px;font-weight: normal;padding:0px 5px;min-width:50px;display:inline-block"></small></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="/" class="sidebar-toggle">
        发布看板
      </a>
      <a id="menuRelease" href="/release" class="sidebar-toggle">
        应用发布
      </a>
      <span href="/release" class="sidebar-toggle header-notify">

      </span>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->

          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="static/dist/img/user2-160x160.jpg" class="user-image" alt="User Image" />
              <span class="hidden-xs"><%= LoginUtil.getUserName()%></span>
              <span class="caret"></span>
            </a>

            <ul class="dropdown-menu" role="menu">
              <li><a href="/passport/logout">退出登录</a></li>
            </ul>
          </li>

        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../inc/left_app.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar" id="appSideBar">

    <!-- search form -->
    <form action="#" class="sidebar-form" onsubmit="leftApp.submitSearch();return false;">
      <div class="input-group">
        <input type="text" name="q" class="form-control search" placeholder="Search..." />
              <span class="input-group-btn">
                <button name="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
      </div>
    </form>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu list user_list" id="app_list">
      <li class="header">Loading</li>
      <!--app列表，有underscore模板填充-->
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>

<%@ include file="../template/tpl_app.jsp" %>

<script>
  var leftApp = {
    initAppList:function(){
      var template = _.template($("script.template_app").html());
      $.get("app/getAllApps", function(apps) {
        //填充模板
        $("#app_list").html(template(apps));
        //设置List查询
        var options = {
          valueNames: [ 'app_id', 'app_name', 'app_module' ]
        };
        //初始化List组件，appSideBar为整体的id，另需要把查询输入框的class定义为search，列表ul的class定义为list，[ 'app_id', 'app_name', 'app_status' ]为查询依据元素的样式
        //即，在search input中输入关键字，List组件自动查找li中app_id，app_name，app_status包换关键字的li，并重新展示过滤后的ul列表
        var appList = new List('appSideBar', options);

        //选中当前app
        $("#app_"+$.search().get("appId")).addClass("active");

        //给顶部应用发布菜单赋值
        $("#menuRelease").attr("href","/release?appId=" + apps[0].appId);
      });
    },
    setAppInfo: function (containerId) {
      $.get("app/getApp?appId=" + $.search().get("appId"), function (result) {
        $("#" + containerId).html(result.appId + " - " + result.appNameCh);
      });
    },
    submitSearch:function(){
      var url =$('#app_list a:eq(0)').attr("href");
      if(url!=undefined){
        location.href = url;
      }
    }
  }

  leftApp.initAppList();

</script>
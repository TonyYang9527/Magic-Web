<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/template" class="template_app">
  <@ _.each( rc, function( app ){ @>
  <li id="app_<@- app.appId @>" class="treeview">
    <a href="/release?appId=<@- app.appId @>">

      <small class="app_id"><@- app.appId @></small><br>
      <small class="app_name"><@- app.appNameCh @></small>
      <small class="app_module" style="display:none"><@- app.module @></small><br>
    </a>
  </li>
  <@ }); @>
</script>

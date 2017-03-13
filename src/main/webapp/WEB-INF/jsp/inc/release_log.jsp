<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  .box-body.log{
    font-size:12px;
    font-weight: normal;
    height:395px;
    overflow-y: auto
  }
  .todo-list > li{
    padding: 8px;
  }
  .todo-list > li .text
  {font-weight: normal !important;}
</style>
<div class="row">
  <div class="box box-solid">
    <div class="box-header with-border">
      <h3 class="box-title">执行日志</h3>
    </div>
    <!-- /.box-header -->
    <div id="processLogContainer" class="box-body log">
      <ul id="processLog" class="todo-list">
      </ul>
    </div>
    <!-- /.box-body -->
  </div>
</div>

<div class="row">
  <% if(LoginUtil.hasPermission("clear_release")) {%>
    <div class="col-md-12">
      <button id="btnClearRelease" class="btn btn-default pull-right" title="重置本次发布的状态信息，重新合并Dev分支代码">清 理</button>
      <button id="btnForceEndRelease" class="btn btn-default pull-right" style="margin-right: 10px" title="强制结束本次发布">强制关闭</button>
    </div>
  <% } %>
</div>
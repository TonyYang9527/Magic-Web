<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="inc/header.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                应用发布单
                <small id="appInfo"></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- 发布统计 -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3 id="weekFat">0</h3>
                            <p>本周FAT发布</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3 id="weekProd">0</h3>
                            <p>本周生产发布</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3 id="monthProd">0</h3>
                            <p>本月生产发布</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3 id="sumProd">0</h3>
                            <p>生产发布总数</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div><!-- ./col -->
            </div><!-- /.row -->

            <!-- 发布单列表 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li id="tab_release_test" class="active"><a href="#tab_1" data-toggle="tab">测试发布</a></li>
                            <li id="tab_release_product"><a href="#tab_2" data-toggle="tab">生产发布</a></li>
                            <%--<li id="tab_release_nexus"><a href="#tab_3" data-toggle="tab">Nexus发布</a></li>--%>
                            <%if(LoginUtil.hasPermission("product_rollback")){%>
                                <li id="tab_release_rollback"><a href="#tab_4" data-toggle="tab">生产回滚</a></li>
                            <% }%>
                            <li class="pull-right">
                                <span id="btn_add" href="javascript:;" class="text-muted" style="padding:3px 3px 0px 0px;display: inline-block">
                                    <input id="btn_add_test" type="button" class="btn btn-primary btn-sm" value="新建测试发布">
                                    <input id="btn_add_product" type="button" class="btn btn-primary btn-sm" style="display: none" value="新建生产发布">
                                    <input id="btn_add_nexus" type="button" class="btn btn-primary btn-sm" style="display: none" value="新建Nexus发布">
                                    <input id="btn_add_rollback" type="button" class="btn btn-primary btn-sm" style="display: none" value="新建生产回滚">
                                </span>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <!--Tab-测试发布-->
                            <div class="tab-pane active" id="tab_1">
                                <table id="dt_test" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>发布单号</th>
                                        <th>模块</th>
                                        <th>目标环境</th>
                                        <th>发布日期</th>
                                        <th>发布人</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="dataTables_empty" colspan="7">Loading data from server</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="tab_2">
                                <table id="dt_product" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>发布单号</th>
                                        <th>模块</th>
                                        <th>类型</th>
                                        <th>版本号</th>
                                        <th>计划上线</th>
                                        <th>实际上线</th>
                                        <th>发布人</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="dataTables_empty" colspan="7">Loading data from server</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="tab_3">
                                <table id="dt_nexus" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>发布单号</th>
                                        <th>模块</th>
                                        <th>目标环境</th>
                                        <th>发布日期</th>
                                        <th>发布人</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="dataTables_empty" colspan="7">Loading data from server</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="tab_4">
                                <table id="dt_rollback" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>发布单号</th>
                                        <th>目标单号</th>
                                        <th>目标版本</th>
                                        <th>目标日期</th>
                                        <th>回滚日期</th>
                                        <th>操作人</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="dataTables_empty" colspan="7">Loading data from server</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->

<%@ include file="modal/modal_config.jsp" %>

<%@ include file="modal/modal_plan.jsp" %>

<%@ include file="modal/modal_rollback.jsp" %>

<%@ include file="inc/footer.jsp" %>

<script>

    var table_test,table_product,table_nexus,table_rollback;
    var arrUser=[],arrUserWithName = [];
    var global = {
        appId: $.search().get("appId"),
        currentReleaseType:0,               //当前的ReleaseType，会根据鼠标的点击Tab而改变
        limit:500,
        releaseType:{"test":0,"product":1,"nexus":2,"rollback":3},
        releaseStatus:{"prepare":0,"processing":1,"complete":2,"rollback":3,"forceEnd":4},
        planType:{"normal":0,"hotfix":1},
        isAppOwner:${model.appOwner}
    }

    //页面绑定事件
    var pageControl = {
        bindEvent:function(){
            //绑定统计tab切换事件
            $('#tab_release_test a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                pageControl.showAddButton("test");
                global.currentReleaseType = global.releaseType.test;
            });

            $('#tab_release_product a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                pageControl.showAddButton("product");
                global.currentReleaseType = global.releaseType.product;
            });
//            $('#tab_release_nexus a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//                pageControl.showAddButton("nexus");
//                global.currentReleaseType = global.releaseType.nexus;
//            });
            $('#tab_release_rollback a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                pageControl.showAddButton("rollback");
                global.currentReleaseType = global.releaseType.rollback;
            });

            //新建测试发布按钮
            $("#btn_add_test").on("click",function(e){
                utility.resetForm('form.form_validation_config');
                $("[name=mavenSkipTest],[name=mavenForceUpdate]").prop("checked","checked");
                pageData.setConfigModal(global.releaseType.test);
                $("#modal_config_submit").show();
                $("#modal_config").modal({backdrop: 'static', keyboard: false});
                //获取app对应module的名字，自动填充（这里回头要改成pom路径）
                $.get("/app/getApp?appId=" + global.appId, function (result) {
                    $("#modal_config [name=module]").val(result.module);
                });

                //默认HealthCheck超时时间
                $("[name=healthCheckTimeout]").val('600');
            });

            //新建生产发布单按钮
            $("#btn_add_product").on("click",function(e){
                utility.resetForm('form.form_validation_plan');
                tagHandler.reset("testPrincipal");
                $("#modal_plan_submit").show();
                $("#modal_plan").modal({backdrop: 'static', keyboard: false});
            })

            //新建Nexus发布按钮
//            $("#btn_add_nexus").on("click",function(e){
//                utility.resetForm('form.form_validation_config');
//                $("[name=mavenSkipTest],[name=mavenForceUpdate]").prop("checked","checked");
//                pageData.setConfigModal(global.releaseType.nexus);
//                $("#modal_config_submit").show();
//                $("#modal_config").modal({backdrop: 'static', keyboard: false});
//                //获取app对应module的名字，自动填充（这里回头要改成pom路径）
//                $.get("/app/getApp?appId=" + global.appId, function (result) {
//                    $("#modal_config [name=module]").val(result.module);
//                });
//            });

            //新建回滚按钮
            $("#btn_add_rollback").on("click",function(e){
                utility.resetForm('form.form_validation_rollback');
                $("#modal_rollback [name=rollbackReleaseNo]").prop('disabled', true);
                $("#modal_rollback [name=rollbackReleaseVersion]").prop('disabled', true);
                $("#modal_rollback [name=rollbackCompleteReleaseTime]").prop('disabled', true);

                $("#modal_rollback").modal({backdrop: 'static', keyboard: false});

                $.get("/rollback/getRollbackReleaseExtend?appId=" + global.appId, function (result) {
                    if(result.releaseId==null){
                        $("#modal_rollback [name=rollbackReleaseNo]").val("无可用的回滚目标单！");
                        $("#modal_rollback_submit").hide();
                    } else {
                        $("#modal_rollback [name=rollbackId]").val(result.rollbackId);
                        $("#modal_rollback [name=rollbackReleaseId]").val(result.releaseId);
                        $("#modal_rollback [name=rollbackReleaseNo]").val(result.releaseNo);
                        $("#modal_rollback [name=rollbackReleaseVersion]").val(result.releaseVersion);
                        $("#modal_rollback [name=rollbackCompleteReleaseTime]").val(moment(result.completeReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                        $("#modal_rollback_submit").show();
                    }
                });
            });

            //判断是否有新建hotfix发布的权限
            $("#planType").on("change",function(e){
                var hasPermission = false;
                <% if(LoginUtil.hasPermission("create_hotfix")){%>
                hasPermission = true;
                <%}%>
                if(hasPermission==false && $(this).val()==global.planType.hotfix){
                    alert("您没有权限新建Hotfix发布，请联系 黄杰 统一创建Hotfix发布单！");
                    $(this).val(global.planType.normal);
                }
            })

            //初始化日期控件
            $("#modal_plan [name=planReleaseTime]").datetimepicker({
                showSecond: true,
                timeFormat: 'HH:mm:ss'
            });

            //初始化用户数据（新建发布计划modal中填测试人员用到）
            $.get("/user/getAllUsers", function(users){
                arrUser = users;
                for(var i in users){
                    arrUserWithName.push(users[i].userId + " - " + users[i].userName);
                }
            });
        },          //绑定页面元素事件
        showAddButton:function(type){
            $("#btn_add input").hide();

            if(type=="test") {
                $("#btn_add_" + type).show();
            } else if(global.isAppOwner){
                //非测试环境，只有appOwner才能看到按钮
                $("#btn_add_" + type).show();
            }
        },   //根据Tab切换类型，显示相应的新建按钮
        checkFrozen:function(type){
            var frozenRelease = ${frozenRelease};
            var notifyMsg =  '${notifyMsg}';
            if(frozenRelease == true){
                $("#btn_add_product").remove();
            }
            if(notifyMsg!=""){
                $(".header-notify").html(notifyMsg).show();
            }
        }
    }

    var pageData = {
        loadTableTest:function(){
            table_test = $('#dt_test').dataTable({
                "paging": true,
                "searching":false,
                "ordering": false,
                "ajax": "/release/getTopReleases?appId=" + global.appId + "&limit=" + global.limit + "&releaseType=" + global.releaseType.test,
                "sAjaxDataProp": null,
                "info": true,
                "columns": [{
                    "data": "releaseNo"
                }, {
                    "data": "module"
                }, {
                    "data": "targetEnv"
                }, {
                    "data": "completeReleaseTime"
                }, {
                    "data": "createUserId"
                }, {
                    "data": "releaseStatus",
                    "width": "70px",
                    className: "text-center"
                }, {
                    data: null,
                    "width": "130px",
                    className: "text-center"
                }],
                "createdRow": function(row, data, index) {
                    if(data.completeReleaseTime != null){
                        $('td', row).eq(3).text(moment(data.completeReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }

                    if(data.releaseStatus != null){
                        switch (data.releaseStatus){
                            case global.releaseStatus.prepare :
                                $('td', row).eq(5).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.processing :
                                $('td', row).eq(5).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.complete :
                                $('td', row).eq(5).html("<span class='label label-success'>已完成</span>");
                                break;
                            case global.releaseStatus.rollback :
                                $('td', row).eq(5).html("<span class='label label-danger'>已回滚</span>");
                                break;
                            case global.releaseStatus.forceEnd :
                                $('td', row).eq(5).html("<span class='label label-gray'>已关闭</span>");
                                break;
                        }
                    }

                    var strHtml = String.format('<a href="javascript:;" onclick="pageData.editConfig({0},{1},{5})">发布配置</a> / <a href="/release_panel?appId={2}&releaseId={3}&releaseType={4}">发布面板</a>',data.configId,data.releaseType,global.appId, data.releaseId,data.releaseType,data.releaseStatus);
                    $('td', row).eq(6).html(strHtml);
                },
                "oLanguage": {
                    "sInfo": "第 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "",
                    "oPaginate": {
                        "sPrevious": " 上一页 ",
                        "sNext": " 下一页 "
                    }
                }
            });
        },      //加载FAT发布单列表
        loadTableProduct:function(){
            table_product = $('#dt_product').dataTable({
                "paging": true,
                "searching":false,
                "ordering": false,
                "ajax": "/release/getTopReleases?appId=" + global.appId + "&limit=" + global.limit + "&releaseType=" + global.releaseType.product,
                "sAjaxDataProp": null,
                "info": true,
                "columns": [{
                    "data": "releaseNo"
                }, {
                    "data": "module"
                }, {
                    "data": "planType"
                },{
                    "data": "releaseVersion"
                }, {
                    "data": "planReleaseTime"
                }, {
                    "data": "completeReleaseTime"
                }, {
                    "data": "createUserId"
                }, {
                    "data": "releaseStatus",
                    "width": "70px",
                    className: "text-center"
                }, {
                    data: null,
                    "width": "200px",
                    className: "text-center"
                }],
                "createdRow": function(row, data, index) {
                    if(data.planType != null){
                        $('td', row).eq(2).text(data.planType== 0 ? "常规发布":"紧急发布");
                    }
                    if(data.planReleaseTime != null){
                        $('td', row).eq(4).text(moment(data.planReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }
                    if(data.completeReleaseTime != null){
                        $('td', row).eq(5).text(moment(data.completeReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }

                    if(data.releaseStatus != null){
                        switch (data.releaseStatus){
                            case global.releaseStatus.prepare :
                                $('td', row).eq(7).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.processing :
                                $('td', row).eq(7).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.complete :
                                $('td', row).eq(7).html("<span class='label label-success'>已完成</span>");
                                break;
                            case global.releaseStatus.rollback :
                                $('td', row).eq(7).html("<span class='label label-danger'>已回滚</span>");
                                break;
                            case global.releaseStatus.forceEnd :
                                $('td', row).eq(7).html("<span class='label label-gray'>已关闭</span>");
                                break;
                        }
                    }

                    var strHtml = String.format('<a href="javascript:;" onclick="pageData.editPlan({0},{6})">发布计划</a> / <a href="javascript:;" onclick="pageData.editConfig({1},{2},{6},{7})">发布配置</a> / <a href="/release_panel?appId={3}&releaseId={4}&releaseType={5}">发布面板</a>',data.planId,data.configId,data.releaseType,global.appId, data.releaseId,data.releaseType,data.releaseStatus,data.planType);
                    $('td', row).eq(8).html(strHtml);

                },
                "oLanguage": {
                    "sInfo": "第 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "",
                    "oPaginate": {
                        "sPrevious": " 上一页 ",
                        "sNext": " 下一页 "
                    }
                }
            });
        },   //加载生产发布单列表
        loadTableNexus:function(){
            table_nexus = $('#dt_nexus').dataTable({
                "paging": true,
                "searching":false,
                "ordering": false,
                "ajax": "/release/getTopReleases?appId=" + global.appId + "&limit=" + global.limit + "&releaseType=" + global.releaseType.nexus,
                "sAjaxDataProp": null,
                "info": true,
                "columns": [{
                    "data": "releaseNo"
                }, {
                    "data": "module"
                },  {
                    "data": "targetEnv"
                },{
                    "data": "completeReleaseTime"
                }, {
                    "data": "createUserId"
                }, {
                    "data": "releaseStatus",
                    "width": "70px",
                    className: "text-center"
                }, {
                    data: null,
                    "width": "130px",
                    className: "text-center"
                }],
                "createdRow": function(row, data, index) {
                    if(data.completeReleaseTime != null){
                        $('td', row).eq(3).text(moment(data.completeReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }

                    if(data.releaseStatus != null){
                        switch (data.releaseStatus){
                            case global.releaseStatus.prepare :
                                $('td', row).eq(5).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.processing :
                                $('td', row).eq(5).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.complete :
                                $('td', row).eq(5).html("<span class='label label-success'>已完成</span>");
                                break;
                            case global.releaseStatus.rollback :
                                $('td', row).eq(5).html("<span class='label label-danger'>已回滚</span>");
                                break;
                            case global.releaseStatus.forceEnd :
                                $('td', row).eq(5).html("<span class='label label-gray'>已关闭</span>");
                                break;
                        }
                    }

                    var strHtml = String.format('<a href="javascript:;" onclick="pageData.editConfig({0},{1},{5})">发布配置</a> / <a href="/release_panel?appId={2}&releaseId={3}&releaseType={4}">发布面板</a>',data.configId,data.releaseType,global.appId, data.releaseId,data.releaseType,data.releaseStatus);
                    $('td', row).eq(6).html(strHtml);

                },
                "oLanguage": {
                    "sInfo": "第 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "",
                    "oPaginate": {
                        "sPrevious": " 上一页 ",
                        "sNext": " 下一页 "
                    }
                }
            });
        },     //加载Nexus发布列表
        loadTableRollback:function(){
            table_rollback = $('#dt_rollback').dataTable({
                "paging": true,
                "searching":false,
                "ordering": false,
                "ajax": "/release/getTopReleases?appId=" + global.appId + "&limit=" + global.limit + "&releaseType=" + global.releaseType.rollback,
                "sAjaxDataProp": null,
                "info": true,
                "columns": [{
                    "data": "releaseNo"
                }, {
                    "data": "rollbackReleaseNo"
                },  {
                    "data": "rollbackReleaseVersion"
                },{
                    "data": "rollbackCompleteReleaseTime"
                }, {
                    "data": "completeReleaseTime"
                }, {
                    "data": "createUserId"
                }, {
                    "data": "releaseStatus",
                    "width": "70px",
                    className: "text-center"
                }, {
                    data: null,
                    "width": "130px",
                    className: "text-center"
                }],
                "createdRow": function(row, data, index) {
                    if(data.rollbackCompleteReleaseTime != null){
                        $('td', row).eq(3).text(moment(data.rollbackCompleteReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }
                    if(data.completeReleaseTime != null){
                        $('td', row).eq(4).text(moment(data.completeReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                    }

                    if(data.releaseStatus != null){
                        switch (data.releaseStatus){
                            case global.releaseStatus.prepare :
                                $('td', row).eq(6).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.processing :
                                $('td', row).eq(6).html("<span class='label label-warning'>进行中</span>");
                                break;
                            case global.releaseStatus.complete :
                                $('td', row).eq(6).html("<span class='label label-success'>已完成</span>");
                                break;
                            case global.releaseStatus.rollback :
                                $('td', row).eq(6).html("<span class='label label-danger'>已回滚</span>");
                                break;
                            case global.releaseStatus.forceEnd :
                                $('td', row).eq(6).html("<span class='label label-gray'>已关闭</span>");
                                break;
                        }
                    }

                    var strHtml = String.format('<a href="javascript:;" onclick="pageData.editRollback({0},{1})">回滚配置</a> / <a href="/release_panel?appId={2}&releaseId={3}&releaseType={4}">发布面板</a>',data.rollbackId,data.releaseStatus,global.appId, data.releaseId,data.releaseType);
                    $('td', row).eq(7).html(strHtml);

                },
                "oLanguage": {
                    "sInfo": "第 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty": "",
                    "oPaginate": {
                        "sPrevious": " 上一页 ",
                        "sNext": " 下一页 "
                    }
                }
            });
        },  //加载回滚发布列表
        editConfig:function(configId,releaseType,releaseStatus,planType){
            $.get("/config/getConfig?configId=" + configId, function (result) {
                //初始化表单
                utility.resetForm('form.form_validation_config');
                //设置ConfigMoal样式
                pageData.setConfigModal(releaseType,planType,result.branch,result.targetEnv);

                $("#modal_config [name=configId]").val(result.configId);
                //$("#modal_config [name=targetEnv]").val(result.targetEnv);
                //$("#modal_config [name=branch]").val(result.branch);
                $("#modal_config [name=module]").val(result.module);
                $("#modal_config [name=healthCheckTimeout]").val(result.healthCheckTimeout);
                if(result.mavenSkipTest==1){
                    $("#modal_config [name=mavenSkipTest]").prop("checked", true);
                }
                if(result.mavenForceUpdate==1){
                    $("#modal_config [name=mavenForceUpdate]").prop("checked", true);
                }

                //已完成的单不能修改
                if(releaseStatus == global.releaseStatus.complete || releaseStatus == global.releaseStatus.rollback){
                    $("#modal_config_submit").hide();
                } else {
                    $("#modal_config_submit").show();
                }

                $("#modal_config").modal({backdrop: 'static', keyboard: false});
            });
        },  //编辑发布配置（测试、生产、Nexus通用）
        editPlan:function(planId,releaseStatus){

            $.get("/plan/getPlan?planId=" + planId, function (result) {
                utility.resetForm('form.form_validation_plan');
                $("#modal_plan [name=planId]").val(result.planId);
                $("#modal_plan [name=planType]").val(result.planType);
                $("#modal_plan [name=releaseVersion]").val(result.releaseVersion);
                $("#modal_plan [name=planReleaseTime]").val(moment(result.planReleaseTime).format("YYYY-MM-DD HH:mm:ss"));

                //设置测试人员
                tagHandler.setTags("testPrincipal",result.testPrincipal);

                //勾选发布原因
                var arrReason = result.releaseReason.split(',');
                $.each(arrReason, function (i, val) {
                    if(val!="") {
                        $("[name=releaseReason][value=" + val + "]").prop("checked", true);
                    }
                })

                $("#modal_plan [name=releaseContent]").val(result.releaseContent);
                $("#modal_plan [name=dbScript]").val(result.dbScript);
                $("#modal_plan [name=remark]").val(result.remark);

                //已完成的单不能修改
                if(releaseStatus == global.releaseStatus.complete || releaseStatus == global.releaseStatus.rollback){
                    $("#modal_plan_submit").hide();
                } else {
                    $("#modal_plan_submit").show();
                }
                $("#modal_plan").modal({backdrop: 'static', keyboard: false});
            });
        },          //编辑发布计划
        editRollback:function(rollbackId,releaseStatus){
            $.get("/rollback/getRollback?rollbackId=" + rollbackId, function (result) {
                //初始化表单
                utility.resetForm('form.form_validation_rollback');

                $("#modal_rollback [name=rollbackReleaseNo]").prop('disabled', true);
                $("#modal_rollback [name=rollbackReleaseVersion]").prop('disabled', true);
                $("#modal_rollback [name=rollbackCompleteReleaseTime]").prop('disabled', true);

                $("#modal_rollback [name=rollbackId]").val(result.rollbackId);
                $("#modal_rollback [name=rollbackReleaseId]").val(result.rollbackReleaseId);
                $("#modal_rollback [name=rollbackReleaseNo]").val(result.rollbackReleaseNo);
                $("#modal_rollback [name=rollbackReleaseVersion]").val(result.rollbackReleaseVersion);
                $("#modal_rollback [name=rollbackCompleteReleaseTime]").val(moment(result.rollbackCompleteReleaseTime).format("YYYY-MM-DD HH:mm:ss"));
                $("#modal_rollback [name=rollbackReason]").val(result.rollbackReason);

                //已完成的单不能修改
                if(releaseStatus == global.releaseStatus.complete){
                    $("#modal_rollback_submit").hide();
                } else {
                    $("#modal_rollback_submit").show();
                }

                $("#modal_rollback").modal({backdrop: 'static', keyboard: false});
            });
        },  //编辑回滚计划
        setConfigModal:function(releaseType,planType,resultBranch,resultTargetEnv){
            //参数
            //releaseType：发布类型（生产，测试，nexus）
            //planType：计划类型（常规发布，紧急发布）
            //resultBranch：发布目标分支
            //resultTargetEnv：发布目标环境
            //debugger;
            var $targetEnv = $("form.form_validation_config [name=targetEnv]").empty();
            var $branch = $("form.form_validation_config [name=branch]").empty();
            if(releaseType == global.releaseType.test){
                //插入目标环境，测试发布的目标环境动态从cmdb上获取
                $.get("/config/getFatTargetEnvs?appId=" + global.appId, function (result) {
                    $.each(result,function(i,val){
                        $targetEnv.append("<option>" + val + "</option>");
                    });
                    //编辑时，如果目标环境在CMDB被删掉，这里要额外加入，保证历史数据存在
                    if($.inArray(resultTargetEnv,result)==-1 && resultTargetEnv!=undefined){
                        $targetEnv.append("<option>" + resultTargetEnv + "</option>");
                    }
                    if(resultTargetEnv!=null && resultTargetEnv!="" && resultTargetEnv!=undefined){
                        $targetEnv.val(resultTargetEnv);
                    }
                });

                //测试发布分支固定为dev和release
                $branch.append("<option>dev</option><option>release</option>");
                $branch.val(resultBranch);

            } else if(releaseType == global.releaseType.product){
                //生产发布目标环境固定为UAT
                $targetEnv.append("<option selected='selected'>UAT</option>");
                if(planType==global.planType.normal){
                    //常规发布分支固定用dev
                    $branch.append("<option selected='selected'>dev</option>");
                    $branch.val(resultBranch);
                } else if(planType==global.planType.hotfix){
                    //能进入这个else的，只有编辑，没有新建，生产的发布配置是后台随发布计划生成的
                    //hotfix的分支要从gitlab上动态获取
                    $.get("/config/getHotFixBranches?appId=" + global.appId, function (result) {
                        $.each(result, function (i, val) {
                            $branch.append("<option>" + val + "</option>");
                        });
                        //有可能hotfix分支在gitlab上过期被删掉了，要额外加入
                        if($.inArray(resultBranch,result)==-1){
                            $branch.append("<option>" + resultBranch + "</option>");
                        }
                        if(resultBranch!=null && resultBranch!=""){
                            $branch.val(resultBranch);
                        }
                    });
                }

            } else if(releaseType == global.releaseType.nexus){
                $targetEnv.append("<option selected='selected'>Nexus</option>");
                $branch.append("<option>dev</option><option>release</option>");
                $branch.val(resultBranch);
            }
        },             //设置发布配置Model的内容（测试、生产、Nexus展示界面略有不同）
        loadReleaseMetrics:function(){
            $.get("app/releaseMetrics?appId=" + global.appId, function(metrics){
                if(metrics){
                    $("#weekFat").text(metrics.weekFat);
                    $("#weekProd").text(metrics.weekProd);
                    $("#monthProd").text(metrics.monthProd);
                    $("#sumProd").text(metrics.sumProd);
                }
            });
        },                    //加载顶部发布统计
        setProductReleaseEnabled:function(){
            return;
            $.get("app/addReleaseEnable?appId=" + global.appId, function(ret){
                if(!ret){
                    $("#btn_add_product").attr('disabled', true).addClass("disabled");
                }else{
                    $("#btn_add_product").removeAttrs('disabled');
                }
            });
        }               //设置生产发布按钮是否有效（业务规定如果存在未完成的生产发布单，不能再新建）
    }

    var tagHandler = {
        setTags:function(inputId, userIds){
            var selectedUsers=[];
            var selectedUserIds = userIds.split(',');
            for(var i in selectedUserIds){
                var userId=selectedUserIds[i];
                for(var j in arrUser){
                    var user = arrUser[j];
                    if(user.userId==userId){
                        selectedUsers.push(user.userId + " - " + user.userName);
                        break;
                    }
                }
            }
            $("#"+inputId).tagHandler({
                assignedTags: selectedUsers,
                availableTags:arrUserWithName,
                autocomplete: true
            });
        },
        getTags:function(inputId){
            var arrUser = $("#"+inputId).tagHandler("getTags");
            for(var i in arrUser){
                arrUser[i] = arrUser[i].split(' ')[0];
            }
            return arrUser.join(',');
        },
        reset:function(inputId){
            $("#"+inputId).tagHandler({
                assignedTags: [],
                availableTags:arrUserWithName,
                autocomplete: true
            })
        }
    }

    $(document).ready(function(){

        leftApp.setAppInfo("appInfo");
        pageControl.bindEvent();

        pageData.loadReleaseMetrics();
        pageData.setProductReleaseEnabled()       //暂时去掉
        pageData.loadTableTest();
        pageData.loadTableProduct();
        //pageData.loadTableNexus();
        pageData.loadTableRollback();

        pageControl.checkFrozen();

        //验证并添加发布配置
        $('.form_validation_config').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function (element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function (element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function (error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                targetEnv: {required: true},
                branch:{required: true}
            },
            messages:{
                targetEnv:"请选择目标环境！",
                branch:"请选择发布分支"
            },
            submitHandler: function () {
                //添加
                $.ajax({
                    type: "POST",
                    url: "/config/saveConfig",
                    data: $('form.form_validation_config').serialize() + "&appId="+global.appId+"&releaseType=" +global.currentReleaseType,
                    success: function (msg) {
                        $("#modal_config").modal('hide');
                        if(global.currentReleaseType == global.releaseType.test){
                            table_test.fnReloadAjax();
                        } else if(global.currentReleaseType ==  global.releaseType.nexus){
                            table_nexus.fnReloadAjax();
                        }
                    },
                    error: function () {
                        alert("failure");
                    }
                });
            }
        });

        //验证并添加发布计划
        $('.form_validation_plan').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function (element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function (element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function (error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                planReleaseTime: {required: true},
                testPrincipal: {required: true},
                releaseVersion: {required: true},
                releaseReason: {required: true},
                releaseContent: {required: true}
            },
            messages:{
                planReleaseTime:"请填写计划上线时间！",
                testPrincipal:"请填写测试负责人",
                releaseVersion:"请填写版本号",
                releaseReason:"请选择发布原因",
                releaseContent:"请填写发布内容"
            },
            submitHandler: function () {

                //添加
                $.ajax({
                    type: "POST",
                    url: "/plan/savePlan",
                    data: $('form.form_validation_plan').serialize()+"&testPrincipal="+ tagHandler.getTags("testPrincipal") + "&appId=" + global.appId,
                    success: function (msg) {
                        $("#modal_plan").modal('hide');
                        table_product.fnReloadAjax();
                    },
                    error: function () {
                        alert("failure");
                    }
                });
            }
        });

        //验证并添加回滚配置
        $('.form_validation_rollback').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function (element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function (element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function (error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                rollbackReason: {required: true}
            },
            messages:{
                rollbackReason:"请填写回滚原因！"
            },
            submitHandler: function () {
                $("#modal_rollback [name=rollbackReleaseNo]").prop('disabled', false);
                $("#modal_rollback [name=rollbackReleaseVersion]").prop('disabled', false);
                $("#modal_rollback [name=rollbackCompleteReleaseTime]").prop('disabled', false);
                //添加
                $.ajax({
                    type: "POST",
                    url: "rollback/saveRollback",
                    data: $('form.form_validation_rollback').serialize() + "&appId="+global.appId+"&releaseType=" +global.currentReleaseType,
                    success: function (msg) {
                        $("#modal_rollback").modal('hide');
                        table_rollback.fnReloadAjax();
                    },
                    error: function () {
                        alert("failure");
                    }
                });
            }
        });
    })

</script>
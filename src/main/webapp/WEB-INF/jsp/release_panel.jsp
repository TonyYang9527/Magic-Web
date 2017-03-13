<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="inc/header.jsp" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            发布面板
            <small id="appInfo"></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Release Panel</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="margin-right: 10px">
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-solid">
                            <div class="box-body">
                                <div id="ystep" class="ystep"></div>
                            </div>
                            <!-- /.box-body -->
                        </div>

                    </div>

                </div>
                <div class="row">

                    <div class="col-md-12">
                        <%@ include file="inc/release_progress.jsp" %>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10" id="release_button">
                    </div>
                    <div class="col-md-2"><a id="btnBack" type="button" class="btn btn-default pull-right">返 回</a></div>
                </div>

            </div>
            <div class="col-md-4">
                <%@ include file="inc/release_log.jsp" %>
            </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="modal/modal_config.jsp" %>

<%@ include file="modal/modal_plan.jsp" %>

<%@ include file="inc/footer.jsp" %>

<%@ include file="template/tpl_release_button.jsp" %>

<script>

    var timer_loadCurrentStep;      //定时器-获取步骤信息
    var timer_loadMoreLog;           //定时器-加载更多日志
    var timer_loadTargetServer;     //定时器-加载发布机器信息
    var global = {
        appId: $.search().get("appId"),                        //应用Id
        releaseType:{"test":0,"product":1,"nexus":2,"rollback":3},      //发布类型枚举
        stepType:{"manual":0,"auto":1,"complete":2},          //步骤类型
        logLevel:{"debug":0,"info":1,"warn":2,"error":3},    //日志类型
        targetStatus:{"created":0,"deploying":1,"deploySuccess":2,"deployFailure":3,"deprecated":4}
    }
    var release = {
        releaseId: $.search().get("releaseId"),              //发布单Id
        releaseType:$.search().get("releaseType"),          //发布类型
        currentStepId: 0,                                     //当前步骤Id
        lastProcessLogId:0,                                  //最后加载的日志Id，用于增量加载日志判断
        //初始化进度条
        initProcessBar:function(releaseType){
            if(releaseType==global.releaseType.test){
                $("#ystep").loadStep({
                    size: "large",
                    color: "blue",
                    steps: [{
                        title: "FAT发布",
                        content: "准备发布FAT"
                    },{
                        title: "发布完成",
                        content: "发布成功，本次发布完成"
                    }]
                });
            } else if (releaseType==global.releaseType.product){
                $("#ystep").loadStep({
                    size: "large",
                    color: "blue",
                    steps: [{
                        title: "UAT发布",
                        content: "准备发布UAT"
                    }, {
                        title: "UAT测试",
                        content: "UAT测试进行中"
                    }, {
                        title: "堡垒发布",
                        content: "等待发布堡垒机"
                    }, {
                        title: "堡垒测试",
                        content: "堡垒机测试中"
                    }, {
                        title: "生产推送",
                        content: "正在进行生产机器推送"
                    }, {
                        title: "发布完成",
                        content: "发布成功，本次发布完成"
                    }]
                });
            } else if(releaseType==global.releaseType.nexus){
                $("#ystep").loadStep({
                    size: "large",
                    color: "blue",
                    steps: [{
                        title: "Neuxs发布",
                        content: "准备发布Nexus"
                    },{
                        title: "发布完成",
                        content: "发布成功，本次发布完成"
                    }]
                });
            } else if(releaseType==global.releaseType.rollback){
                $("#ystep").loadStep({
                    size: "large",
                    color: "blue",
                    steps: [{
                        title: "生产回滚",
                        content: "准备进行生产回滚"
                    },{
                        title: "回滚完成",
                        content: "回滚成功，本次回滚完成"
                    }]
                });
            }

        },
        //设置进度条
        setProcessBar:function(releaseType,currentStepId){
            var ystep = $("#ystep");
            if(releaseType==global.releaseType.test){
                if(currentStepId>=105){
                    ystep.setStep(2);
                } else if(currentStepId>=101){
                    ystep.setStep(1);
                }
            } else if(releaseType==global.releaseType.product){
                if(currentStepId>=18){
                    ystep.setStep(3);
                }else if(currentStepId>=17){
                    ystep.setStep(1);
                }else if(currentStepId>=16){
                    ystep.setStep(6);
                }else if(currentStepId>=16){
                    ystep.setStep(6);
                } else if(currentStepId>=11){
                    ystep.setStep(5);
                } else if(currentStepId>=8){
                    ystep.setStep(4);
                } else if(currentStepId>=6){
                    ystep.setStep(3);
                } else if(currentStepId>=3){
                    ystep.setStep(2);
                } else if(currentStepId>=1){
                    ystep.setStep(1);
                }
            } else if(releaseType==global.releaseType.nexus){
                if(currentStepId>=204){
                    ystep.setStep(2);
                } else if(currentStepId>=201){
                    ystep.setStep(1);
                }
            } else if(releaseType==global.releaseType.rollback){
                if(currentStepId>=304){
                    ystep.setStep(2);
                } else if(currentStepId>=301){
                    ystep.setStep(1);
                }
            }
        },
        //加载当前步骤信息
        loadCurrentStep: function () {
            $.get("release/getCurrentStep?releaseId="+release.releaseId, function (currentStep) {
                if (currentStep.currentStepType == global.stepType.manual && currentStep.currentStepId!=release.currentStepId) {
                    //如果是人工节点，且当前步骤有变化，加载按钮
                    var template = _.template($("script.template_release_button").html());
                    $("#release_button").html(template(currentStep.nextSteps));                    //加载模板
                    release.setProcessBar(release.releaseType, currentStep.currentStepId);     //设置上方进度条
                    release.hideLoading();                                                          //隐藏loading效果
                }else if(currentStep.currentStepType == global.stepType.complete ){
                    //发布完成，不再刷新步骤、日志和机器信息
                    clearInterval(timer_loadCurrentStep);
                    //停5秒再结束刷新，以防还有日志没有获取到就结束了
                    setTimeout(function(){
                        clearInterval(timer_loadMoreLog);
                        clearInterval(timer_loadTargetServer);
                    },5000);

                    $("#release_button").html("");                                                 //清空按钮
                    release.setProcessBar(release.releaseType,currentStep.currentStepId);       //设置进度条
                    release.hideLoading();                                                           //隐藏loading效果
                    $("#btnClearRelease").hide();                                                  //隐藏清空按钮
                    $("#btnForceEndRelease").hide();                                               //隐藏强制关闭按钮
                }else if(currentStep.currentStepType == global.stepType.auto ){
                    //处理中，显示loading状态（这里主要是考虑一进来就是自动步骤处理中，需要触发下loading效果）
                    release.showLoading();
                    release.setProcessBar(release.releaseType,currentStep.currentStepId);       //设置进度条
                    $("#release_button input").prop("disabled", "disabled");
                }

                //设置全局当前步骤Id（以便和下次步骤Id对比）
                release.currentStepId = currentStep.currentStepId;
            });
        },
        //转交下一步
        turnNext: function (conditionId) {
            release.showLoading();
            $("#release_button input").prop("disabled", "disabled");
            var url = String.format("release/turnNext?releaseId={0}&currentStepId={1}&conditionId={2}", release.releaseId, release.currentStepId, conditionId);
            $.get(url, function (result) {
                if(result!=true){
                    alert("流程调度失败，请联系框架团队排查原因！");
                }
            })
        },
        //拼接log的html（私有）
        buildLogHtml:function(log){
            var strHtml = '';
            if(log.logLevel == global.logLevel.error){
                strHtml = '<li><span class="text text-red">' + log.content + '</span>';
            } else {
                strHtml='<li><span class="text">' + log.content + '</span>';
            }
            if(log.url!=null && log.url !=""){
                strHtml += '<a target="_blank" href="' + log.url + '"><small class="label label-warning pull-right">详情</small></a>'
            }
            strHtml += "</li>";

            return strHtml;
        },
        //加载处理日志
        loadProcessLog:function(){
            var url = "release/getProcessLogs?releaseId=" + release.releaseId;
            $.get(url, function (result) {
                var strHtml = "";
                $(result).each(function(index,log){
                    strHtml += release.buildLogHtml(log);
                    if(index==result.length-1){
                        release.lastProcessLogId = log.processLogId;
                    }
                })
                //加入日志html
                $("#processLog").html(strHtml);

                //滚动到底部
                release.scrollToEnd();

                //启动刷新
                timer_loadMoreLog = setInterval(release.loadMoreLog,1000);
                //setTimeout(release.loadMoreLog,1000);
            })
        },
        //加载更多日志（按最后日志id增量加载）
        loadMoreLog:function(){
            var url = "release/getProcessLogsByLastId?releaseId=" + release.releaseId + "&lastProcessLogId=" + release.lastProcessLogId;
            $.get(url, function (result) {
                var strHtml = "";
                $(result).each(function(index,log){
                    strHtml += release.buildLogHtml(log);
                    if(index==result.length-1){
                        release.lastProcessLogId = log.processLogId;
                    }
                })

                //加入日志html
                if(strHtml!=""){
                    //加入新日志
                    $("#processLog").append(strHtml);

                    //滚动到底部
                    release.scrollToEnd();
                }

                //启动刷新
                //setTimeout(release.loadMoreLog,1000);
            })
        },
        //日志面板的滚动条到底部
        scrollToEnd:function(){
            var $logContainer =  $("#processLogContainer")
            var scrollTop = $logContainer[0].scrollHeight;
            $logContainer.scrollTop(scrollTop);
        },
        //显示/隐藏Loading
        showLoading:function(){
            $("#loading").show();
        },
        hideLoading:function(){
            $("#loading").hide();
        },
        buildTargetContent:function(target){
            var content = "";
            if(target.targetStatus == global.targetStatus.created || target.targetStatus == global.targetStatus.deprecated){
                content = "等待发布";
            } else if(target.targetStatus == global.targetStatus.deploying){
                content = "发布中";
            } else if(target.targetStatus == global.targetStatus.deployFailure){
                content = "发布失败";
            } else if (target.targetStatus == global.targetStatus.deploySuccess){
                content = "发布成功";
            }
            return content;
        },
        buildTargetServerHtml:function(target){
            var strHtml="";
            var content = release.buildTargetContent(target);
            strHtml=String.format('<li id="target_{3}" data-toggle="popover" data-title="{0}" data-content="{1}" class="targetStatus_{2}"></li>',target.serverIp,content,target.targetStatus,target.targetId);
            return strHtml;
        },
        loadTargetServers: function () {
            var url = "release/getTargetServers?releaseId=" + release.releaseId;
            $.get(url, function (result) {
                var strHtml = "";
                $(result).each(function (index, target) {
                    //如果已存在就更新状态（防止popover闪烁）
                    var $t = $("#target_" + target.targetId);
                    if ($t.size() > 0) {
                        var content =  release.buildTargetContent(target);
                        $t.removeClass()
                                .addClass("targetStatus_" + target.targetStatus)
                                .attr("data-content",content);
                    } else {
                        strHtml += release.buildTargetServerHtml(target);
                    }
                })
                //加入target Html（这里要用hppend，防止popover闪烁）
                $("#targetServers").append(strHtml);

                //初始化tagHandler
                var opt = {
                    animation: true
                    , placement: 'top'
                    , trigger: 'hover'
                    , delay: 0
                }
                $('#targetServers li[data-toggle="popover"]').popover(opt);
            })
        },
        clearRelease:function(){
            if(confirm("清理发布单后将重新从Dev分支合并代码，您确定吗？")==true) {
                var url = "release/clearRelease?releaseId=" + release.releaseId;
                $.get(url, function (result) {
                    if (result.success == true) {
                        alert("发布单清理成功！");
                        location.reload();
                    } else {
                        alert("发布单清理失败，详情请查看Dashcam日志！\r\n" + result.errMsg);
                    }
                });
            }
        },
        forceEndRelease:function(){
            if(confirm("强制关闭后本发布单不可再继续发布，您确定吗？")==true) {
                var url = "release/forceEndRelease?releaseId=" + release.releaseId;
                $.get(url, function (result) {
                    if (result.success == true) {
                        alert("发布单关闭成功！");
                        location.href = "/release?appId=" + global.appId;
                    } else {
                        alert("发布单关闭失败，详情请查看Dashcam日志！\r\n" + result.errMsg);
                    }
                });
            }
        }
    }

    $(document).ready(function () {
        //设置顶部应用信息（left_app.jsp中的函数）
        leftApp.setAppInfo("appInfo");
        //设置进度条
        release.initProcessBar(release.releaseType);
        //加载当前步骤
        release.loadCurrentStep();
        //加载Server信息
        release.loadTargetServers();
        //加载历史日志（更多日志会在方法里面开刷）
        release.loadProcessLog();

        //开刷发布机器信息
        timer_loadTargetServer = setInterval(release.loadTargetServers,3000);

        //开刷步骤信息
        timer_loadCurrentStep = setInterval(release.loadCurrentStep, 3000);

        //返回按钮
        $("#btnBack").attr("href","/release?appId=" + global.appId);
        //清理按钮
        $("#btnClearRelease").on("click",release.clearRelease);
        //强制关闭按钮
        $("#btnForceEndRelease").on("click",release.forceEndRelease);
    })


</script>
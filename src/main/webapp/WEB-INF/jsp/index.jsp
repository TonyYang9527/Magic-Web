<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="inc/header.jsp" %>
<!-- fullCalendar 2.2.5-->
<link href="static/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
<link href="static/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" type="text/css" media="print" />
<style>
    .fc-time{
        display: none;
    }
    #tip{
        position: absolute;
        font-size: 14px;
        width: auto;
        max-width: 400px;
        text-align: left;
        padding: 8px 12px;
        border: #87CEEB solid 7px;
        border-radius: 5px;
        background: #00BFFF;
        z-index: 1000;);
    }
    #tip ul{
        margin: 0;
        padding: 0;
    }
    #tip ul li{
        font-family:'Microsoft YaHei', 微软雅黑, 'Microsoft JhengHei', 宋体;
        list-style: none;
    }
    .fc-content{
        cursor:pointer;
    }
</style>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">

    <h1>
        发布看板
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Calendar</li>
    </ol>

  </section>

  <!-- Main content -->
  <section class="content" style="font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;">
    <div class="row">
      <div class="col-md-9 no-padding-right">
        <div class="box box-primary">
          <div class="box-body no-padding">
            <!-- THE CALENDAR -->
            <div id="calendar"></div>
          </div><!-- /.box-body -->
        </div><!-- /. box -->
      </div><!-- /.col -->
        <div class="col-md-3">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h4 class="box-title">发布状态</h4>
                </div>
                <div class="box-body">
                    <div id="external-events">
                        <div class="external-event bg-green">发布完成</div>
                        <div class="external-event bg-blue">发布延期</div>
                        <div class="external-event bg-yellow">发布中</div>
                        <div class="external-event bg-red">发布回滚</div>
                        <div class="external-event bg-gray-active">强制关闭</div>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /. box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
  </section><!-- /.content -->
</div>

<script src="static/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="static/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
<!-- Page specific script -->
<script type="text/javascript">
  $(function () {
      $.get("/app/releaseSummaries" ,function(data){
          var events = [];
          if(data){
              data.forEach(function(summary, index){
                  var event = {title: summary.appId +" "+ summary.appName, start: new Date(summary.startTime)};
                  //已完成
                  if(summary.endTime != null){
                      event['end'] = new Date(summary.endTime);
                      if (event.end.getDate() > event.start.getDate() ||
                              event.end.getMonth() > event.start.getMonth() ||
                              event.end.getFullYear() > event.start.getFullYear()) { //延期了

                          //blue，complete but delay
                          event['backgroundColor'] = "#0073B7"
                          event['borderColor'] = "#0073B7";
                      } else {
                          //green，complete
                          event['backgroundColor'] = "#00A65A"
                          event['borderColor'] = "#00A65A";
                      }
                  } else {
                      //yellow，processing
                      event['backgroundColor'] = "#F39C12"
                      event['borderColor'] = "#F39C12";
                  }
                  //其他状态
                  if (summary.release_status == 3) {
                      //red，rollback
                      //event.className = "bg-red";
                      event['backgroundColor'] = "#DD4B39"
                      event['borderColor'] = "#DD4B39";
                  } else if(summary.release_status == 4){
                      //gray-active，forceend
                      event['backgroundColor'] = "#b5bbc8"
                      event['borderColor'] = "#b5bbc8";
                  }
                  event['appName']= summary.appName;
                  event['owner'] = summary.owner;
                  //event['backup'] = summary.backup;
                  event['tester'] = summary.tester;
                  event['appId'] = summary.appId;
                  event['release_Id'] = summary.release_Id;
                  event['release_type'] = summary.release_type;
                  event['releaseContent'] = summary.releaseContent;
                  events.push(event);
              });
              $('#calendar').fullCalendar({
                  header: {
                      left: 'prev,next',
                      center: 'title'
                  },
                  buttonText: {
                      month: 'month'
                  },
                  //Random default events
                  events: events,
                  eventMouseover: function(event, jsEvent, view){
                      showDetail(event, jsEvent);
                  },
                  eventMouseout: function(event, jsEvent, view){
                      $('#tip').remove();
                  },
                  //eventClick: function(calEvent, jsEvent, view) {
                      //window.location.href = '/release_panel?appId=' + calEvent.appId + "&releaseId=" + calEvent.release_Id + "&releaseType=" + calEvent.release_type;
                  //},
                  editable: false,
                  droppable: false
              });
          }
      });

      function showDetail(event, e){
          var releaseType = event.release_type==1?"常规发布":"紧急发布";
          var releaseContent = event.releaseContent.replace(/\r\n/g,"<br/>");
          if(releaseContent.search("<br/>")> 0){
              releaseContent = "<br/>" + releaseContent;
          }
          var eInfo = '<div id="tip"><ul>';
          eInfo += '<li class="postmessage">应用名称：' + event.appName + '<br/> </li>';
          eInfo += '<li class="postmessage">发布类型：' + releaseType + '<br/> </li>';
          eInfo += '<li class="postmessage">主负责人：' + event.owner + '<br/> </li>';
          eInfo += '<li class="postmessage">测试人员：' + event.tester + '<br/> </li>';
          eInfo += '<li class="postmessage">发布内容：' + releaseContent + '<br/> </li>';
          eInfo += '</ul></div>';
          $(eInfo).appendTo($('body'));
          $('#tip').css({"opacity":"0.2", "display":"none", "left":(e.pageX + 20) + "px", "top":(e.pageY + 10) + "px"}).fadeTo(600, 0.9);
          $('.fc-event-inner').mousemove(function(e){
              $('#tip').css({'top': (e.pageY + 10), 'left': (e.pageX + 20)});
          });
      }
  });
</script>

<%@ include file="inc/footer.jsp" %>

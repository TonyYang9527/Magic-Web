<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .box-body.progress ul{
        padding: 0px;
    }
    .box-body.progress li{
        display:inline-block;
        width: 25px;
        height: 25px;
        list-style: none;
        margin-right:4px;
        border-radius: 2px;
    }

    @keyframes blink{
        0%{opacity: 1;}
        50%{opacity: 1;}
        50.01%{opacity: 0;} /* 注意这里定义50.01%立刻透明度为０，可以设置闪烁效果 */
        100%{opacity: 0;}
    }

    /* 添加兼容性前缀 */

    @-webkit-keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 1; }
        50.01% { opacity: 0; }
        100% { opacity: 0; }
    }

    @-moz-keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 1; }
        50.01% { opacity: 0; }
        100% { opacity: 0; }
    }

    @-ms-keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 1; }
        50.01% { opacity: 0; }
        100% { opacity: 0; }
    }

    @-o-keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 1; }
        50.01% { opacity: 0; }
        100% { opacity: 0; }
    }

    /*Created*/
    .box-body.progress li.targetStatus_0{
        border: solid 1px #ccc;
        background-color: #ddd;

    }

    /*Deploying*/
    .box-body.progress li.targetStatus_1{
        border: solid 1px #E1C718;
        background-color: #F7DA15;

        /* 闪烁 */
        animation: blink .75s linear infinite;
        /* 其它浏览器兼容性前缀 */
        -webkit-animation: blink .75s linear infinite;
        -moz-animation: blink .75s linear infinite;
        -ms-animation: blink .75s linear infinite;
        -o-animation: blink .75s linear infinite;
        color: #dd4814;
    }

    /*DeploySuccess*/
    .box-body.progress li.targetStatus_2{
        border: solid 1px #16B037;
        background-color: #07CB31;
    }

    /*DeployFailure*/
    .box-body.progress li.targetStatus_3{
        border: solid 1px #E50000;
        background-color: red;
    }

    /*Deprecated*/
    .box-body.progress li.targetStatus_3{
        border: solid 1px #ccc;
        background-color: #ddd;
    }

</style>

<div class="box box-solid">
    <div class="box-header with-border">
        <h3 class="box-title">Release Progress Monitor</h3>
        <div class="box-tools pull-right">
            <span id="loading" style="display: none;">
                <span class="label" style="padding:0px;"><img src="/static/dist/img/loading.gif"></span>
                <button class="btn btn-box-tool">系统执行中...</button>
            </span>
        </div>
    </div><!-- /.box-header -->
    <div class="box-body progress" style="height: 260px;background: white">

        <ul id="targetServers">
        </ul>
    </div><!-- /.box-body -->
</div>
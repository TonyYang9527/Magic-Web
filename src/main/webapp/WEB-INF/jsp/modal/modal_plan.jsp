<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modal_plan">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">发布计划</h4>
      </div>

      <form class="form-horizontal form_validation_plan">
        <div class="modal-body" style="height:400px;position: relative;overflow-y: auto;width: auto;">
          <!--发布类型-->
          <div class="form-group">
            <label class="col-lg-3 control-label">发布类型</label>
            <div class="col-lg-8">
              <input type="hidden" name="planId">
              <select class="form-control" name="planType" id="planType">
                <option value="0">常规发布</option>
                <option value="1">紧急发布</option>
              </select>
            </div>
          </div>
          <!--计划发布时间-->
          <div class="form-group">
            <label class="col-lg-3 control-label">计划上线时间</label>
            <div class="col-lg-8">
                <input class="form-control" type="text" name="planReleaseTime">
            </div>
          </div>
          <!--测试负责人-->
          <div class="form-group">
            <label class="col-lg-3 control-label">测试负责人</label>
            <div class="col-lg-8">
              <ul id="testPrincipal"></ul>
            </div>
          </div>
          <!--版本号-->
          <div class="form-group">
            <label class="col-lg-3 control-label">版本号</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="releaseVersion">
            </div>
          </div>
          <!--发布原因-->
          <div class="form-group">
            <label class="col-lg-3 control-label">发布原因</label>
            <div class="col-lg-8">
              <label class="checkbox-inline">
                <input type="checkbox" name="releaseReason" value="1">常规更新
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" name="releaseReason" value="2">新功能上线
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" name="releaseReason" value="3">Bug修复
              </label>
            </div>
          </div>
          <!--发布内容-->
          <div class="form-group">
            <label class="col-lg-3 control-label">发布内容</label>
            <div class="col-lg-8">
              <textarea class="form-control" name="releaseContent" rows="6"></textarea>
            </div>
          </div>
          <!--DB脚本-->
          <div class="form-group">
            <label class="col-lg-3 control-label">DB脚本</label>
            <div class="col-lg-8">
              <textarea class="form-control" name="dbScript" rows="6"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label">备注</label>
            <div class="col-lg-8">
              <textarea class="form-control" name="remark" rows="6"></textarea>
            </div>
          </div>
        </div>

        <div class="modal-footer">
          <button id="modal_plan_submit" type="submit" class="btn btn-primary">保 存</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

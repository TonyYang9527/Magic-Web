<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modal_config">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">发布配置</h4>
      </div>

      <form class="form-horizontal form_validation_config">
        <div class="modal-body">
          <div class="form-group">
            <label class="col-lg-3 control-label">目标环境</label>
            <div class="col-lg-8">
              <input type="hidden" name="configId">
              <select class="form-control" name="targetEnv">

              </select>
            </div>
          </div>


          <div class="form-group">
            <label class="col-lg-3 control-label">Branch</label>
            <div class="col-lg-8">
              <select class="form-control" name="branch">
                <option>dev</option>
                <option>release</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Module</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="module" disabled>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">HC Timeout</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="healthCheckTimeout">
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label">Maven</label>
            <div class="col-lg-8">
              <label class="checkbox-inline">
                <input type="checkbox" name="mavenSkipTest">跳过测试
              </label>
              <label class="checkbox-inline">
                <input type="checkbox" name="mavenForceUpdate">强制更新
              </label>
            </div>
          </div>
        </div>

        <div class="modal-footer">
          <input id="modal_config_submit" type="submit" class="btn btn-primary" value="保 存" />
          <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
        </div>
      </form>
    </div>
  </div>
</div>

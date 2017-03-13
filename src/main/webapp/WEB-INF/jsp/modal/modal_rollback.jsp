<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modal_rollback">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">生产回滚</h4>
            </div>

            <form class="form-horizontal form_validation_rollback">
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-lg-3 control-label">目标单号</label>
                        <div class="col-lg-8">
                            <input type="hidden" name="rollbackId">
                            <input type="hidden" name="rollbackReleaseId">
                            <input class="form-control" type="text" name="rollbackReleaseNo" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">目标版本</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="rollbackReleaseVersion" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">目标日期</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="rollbackCompleteReleaseTime" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">回滚原因</label>
                        <div class="col-lg-8">
                            <textarea class="form-control" name="rollbackReason" rows="6"></textarea>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button id="modal_rollback_submit" type="submit" class="btn btn-primary">保 存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

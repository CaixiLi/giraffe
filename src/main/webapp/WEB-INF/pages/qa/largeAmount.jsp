<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>百万选择王</title>
</head>
<body>
<%--<c:if test="${empty sessionScope.login.menu.get('system_user')}">--%>
<%--<jsp:forward page="/index" />--%>
<%--</c:if>--%>
<script src="/metronic/theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/js/qa/largeAmount.js"></script>
<div class="container">
    <!-- BEGIN PAGE BREADCRUMBS -->
    <ul class="page-breadcrumb breadcrumb">
        <li>
            <a href="/index">Home</a>
            <i class="fa fa-circle"></i>
        </li>
        <li>
            <a href="#">百万选择王</a>
            <i class="fa fa-circle"></i>
        </li>
        <li>
            <a href="#">大额提现</a>
            <i class="fa fa-circle"></i>
        </li>
        <li>
            <span>Datatables</span>
        </li>
    </ul>
    <!-- END PAGE BREADCRUMBS -->
    <!-- BEGIN PAGE CONTENT INNER -->
    <div class="page-content-inner">
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet light ">
                    <div class="portlet-title">
                        <div class="caption font-dark">
                            <i class="fa fa-check-square-o"></i>
                            <span class="caption-subject bold uppercase">大额提现查询</span>
                        </div>

                    </div>
                    <div class="portlet-body">
                        <form role="form"
                              action="/qa/largeAmount" method="post">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <input type="text" class="form-control" name="businessNo"
                                               placeholder="提现ID" id="businessNo"
                                               value="${queryCondition.businessNo}"></div>
                                    <div class="col-md-1">
                                        <input type="text" class="form-control" name="momoid"
                                               placeholder="陌陌号" id="momoid"
                                               value="${queryCondition.momoid}"></div>
                                    <div class="col-md-3">
                                        <input class="form-control form-control-inline input-medium date-picker"
                                               id="startDate" name="startDate" type="text"
                                               data-date-format="yyyy-mm-dd" placeholder="开始时间"
                                               value="${queryCondition.startDate}"/>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control form-control-inline input-medium date-picker"
                                               id="endDate" name="endDate" type="text"
                                               data-date-format="yyyy-mm-dd" placeholder="结束时间"
                                               value="${queryCondition.endDate}">
                                    </div>
                                    <div class="col-md-2">
                                        <select id="auditStatus" name="auditStatus"
                                                class="form-control input-small input-inline">
                                            <option value="">--全部--</option>
                                            <option value="0"
                                                    <c:if test="${queryCondition.auditStatus eq 0}">selected</c:if>>
                                                等待审核
                                            </option>
                                            <option value="1"
                                                    <c:if test="${queryCondition.auditStatus eq 1}">selected</c:if>>
                                                审核通过
                                            </option>
                                            <option value="2"
                                                    <c:if test="${queryCondition.auditStatus eq 2}">selected</c:if>>
                                                审核拒绝
                                            </option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn blue">查询</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption font-dark">
                                <i class="fa fa-check-square-o"></i>
                                <span class="caption-subject bold uppercase">大额提现列表</span>
                            </div>
                            <div class="tools"></div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover"
                                   id="page-table">
                                <thead>
                                <tr>
                                    <th>提现ID</th>
                                    <th>陌陌号</th>
                                    <th>昵称</th>
                                    <th>提现金额</th>
                                    <th>活动场次</th>
                                    <th>创建时间</th>
                                    <th>实名信息</th>
                                    <th>账户信息</th>
                                    <th>账户类型</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>
            </div>
        </div>

        <div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title">审核操作</h4>
                    </div>

                    <div class="form-group form-md-radios has-success">
                        <label class="col-md-3 control-label">审核</label>
                        <div class="col-md-9">
                            <div class="md-radio-list">
                                <input type="hidden" id="audit_id"/>
                                <div class="md-radio">
                                    <input type="radio" id="checkbox1_6" name="radio211" value="1"
                                           class="md-radiobtn">
                                    <label for="checkbox1_6">
                                        <span></span>
                                        <span class="check"></span>
                                        <span class="box"></span>通过</label>
                                </div>
                                <div class="md-radio">
                                    <input type="radio" id="checkbox1_611" name="radio211" value="2"
                                           class="md-radiobtn" checked="">
                                    <label for="checkbox1_611">
                                        <span></span>
                                        <span class="check"></span>
                                        <span class="box"></span>拒绝</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="message">备注</label>
                            <textarea class="form-control" id="message" rows="3"
                                      placeholder="备注"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn dark btn-outline" data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn green" data-dismiss="modal" id="audit">
                                审核
                            </button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
        <div class="modal fade bs-modal-lg" id="large" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true"></button>
                        <h4 class="modal-title">日志详情</h4>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover">
                            <caption>审核日志</caption>
                            <thead>
                            <tr>
                                <th>操作时间</th>
                                <th>操作人</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                            <tbody id="auditLog">
                            </tbody>
                        </table>
                    </div>

                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover">
                            <caption>提现日志</caption>
                            <thead>
                            <tr>
                                <th>打款时间</th>
                                <th>打款状态</th>
                                <th>原因</th>
                            </tr>
                            </thead>
                            <tbody id="transferLog">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </div>
</body>
</html>

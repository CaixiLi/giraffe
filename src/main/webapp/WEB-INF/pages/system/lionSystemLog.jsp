<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作日志</title>
</head>
<body>
<c:if test="${empty sessionScope.login.menu.get('system_log')}">
	<jsp:forward page="/index" />
</c:if>
	<script src="/js/system/lionSystemLog.js"></script>
	<div class="page-head">
		<!-- BEGIN PAGE TITLE -->
		<div class="page-title">
			<h1>
				LION 管理 <small>操作日志</small>
			</h1>
		</div>
		<!-- END PAGE TITLE -->
		<!-- BEGIN PAGE TOOLBAR -->
		<div class="page-toolbar"></div>
		<!-- END PAGE TOOLBAR -->
	</div>
	<!-- END PAGE HEAD -->
	<!-- BEGIN PAGE BREADCRUMB -->
	<ul class="page-breadcrumb breadcrumb">
		<li><a href="/index">Home</a> <i class="fa fa-circle"></i></li>
		<li><a href="#">Lion管理</a> <i class="fa fa-circle"></i></li>
		<li><a href="/system/lionSystemLog">操作日志</a></li>
	</ul>
	<!-- END PAGE BREADCRUMB -->
	<!-- END PAGE HEADER-->

	<div class="row ">
		<div class="col-md-12">
			<!-- BEGIN SAMPLE FORM PORTLET-->
			<div class="portlet box red-intense">
				<div class="portlet-title">
					<div class="caption">操作日志查询</div>
					<div class="tools">
						<a href="#portlet-config" data-toggle="modal" class="config">
						</a>
					</div>
				</div>
				<div class="portlet-body">
					<form class="form-inline" role="form"
						action="/system/lionSystemLog" method="post">
						<label>陌陌号</label>
						<div class="form-group">
							<input name="emmomoid" type="text" class="form-control"
								id="id_momoid" value="${emmomoid}">
						</div>
						<label>功能</label>
						<div class="form-group">
							<select class="form-control" id="country_list"
								name="menuKey">
								<option value="">--全部--</option>
								<c:forEach items="${menuList}" var="menu">
									<c:if test="${menu.menuKey==menuKey}">
										<option value="${menu.menuKey}"  selected="selected">${menu.menuName}</option>
									</c:if>
									<c:if test="${menu.menuKey !=menuKey}">
										<option value="${menu.menuKey}">${menu.menuName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<label>日期</label>
						<div class="form-group">
							<input name="startTime" id="id_startTime"
								class="form-control form-control-inline input-medium date form_datetime"
								type="text" value="${startTime}"
								data-date-format="yyyy-mm-dd hh:ii:ss" />
						</div>
						至
						<div class="form-group">
							<input name="endTime" id="id_endTime"
								class="form-control form-control-inline input-medium date form_datetime"
								type="text" value="${endTime}"
								data-date-format="yyyy-mm-dd hh:ii:ss" />
						</div>
						<button type="submit" class="btn btn-default">查询</button>
					</form>
				</div>
			</div>
			<!-- END SAMPLE FORM PORTLET-->
		</div>
	</div>

	<!-- BEGIN PAGE CONTENT-->
	<div class="portlet box red-intense">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-user"></i>操作日志
			</div>

		</div>
		<div class="portlet-body">
			<table class="table table-striped table-bordered table-hover"
				id="page-table">
				<thead>
					<tr>
						<th>操作人陌陌号</th>
						<th>操作人</th>
						<th>一级功能</th>
						<th>二级功能</th>
						<th>具体操作</th>
						<th>IP</th>
						<th>操作时间</th>
					</tr>
				</thead>
				<tbody>
					<%-- <c:forEach items="${list}" var="log">
						<tr>
							<td>${log.momoid}</td>
							<td>${log.cnName}</td>
							<td>${log.firstName}</td>
							<td>${log.menuName}</td>
							<td>${log.content}</td>
							<td>${log.ip}</td>
							<td>${log.createTime}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
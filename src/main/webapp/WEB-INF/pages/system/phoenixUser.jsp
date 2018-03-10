<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
<%--<c:if test="${empty sessionScope.login.menu.get('system_user')}">--%>
	<%--<jsp:forward page="/index" />--%>
<%--</c:if>--%>
<div class="container">
	<!-- BEGIN PAGE BREADCRUMBS -->
	<ul class="page-breadcrumb breadcrumb">
		<li>
			<a href="/index">Home</a>
			<i class="fa fa-circle"></i>
		</li>
		<li>
			<a href="#">系统管理</a>
			<i class="fa fa-circle"></i>
		</li>
		<li>
			<a href="#">用户列表</a>
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
							<i class="fa fa-user"></i>
							<span class="caption-subject bold uppercase">用户列表</span>
						</div>
						<div class="tools"> </div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_1">
							<thead>
							<tr>
								<th>陌陌号</th>
								<th>姓名</th>
								<th>英文名称</th>
								<th>角色</th>
								<th>所在部门</th>
								<th>创建时间</th>
								<th>最后登录时间</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="user">
								<tr>
									<td>${user.momoid}</td>
									<td>${user.cnName}</td>
									<td>${user.enName}</td>
									<td>${user.roleName}</td>
									<td>${user.department}</td>
									<td>${user.createTime}</td>
									<td>${user.lastLoginTime}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END EXAMPLE TABLE PORTLET-->
			</div>
		</div>
	</div>
	<!-- END PAGE CONTENT INNER -->
</div>
</body>
</html>
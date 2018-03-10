<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>角色列表</title>
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
			<a href="#">角色列表</a>
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
							<span class="caption-subject bold uppercase">角色列表</span>
						</div>
						<div class="tools"> </div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover" id="sample_1">
							<thead>
							<tr>
								<th>角色名称</th>
								<th>角色描述</th>
								<th>一级功能</th>
								<th>二级功能</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="role">
								<tr>
									<td>${role.roleName}</td>
									<td>${role.roleDesc}</td>
									<td>${role.firstMenu}</td>
									<td>${role.secondMenu}</td>
									<td>${role.createTime}</td>
									<td>
										<a href="#" onclick="menuCongif('${role.roleId}')"  title="权限配置"><i class="icon fa fa-cogs"></i></a>
									</td>
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
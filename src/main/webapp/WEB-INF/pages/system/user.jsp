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
        <li>
            <span><a class="btn purple btn-outline sbold" data-toggle="modal" href="#large"> 添加 </a></span>
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
                                <th>ID</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                                <th>修改</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.sex}</td>
                                    <td>${user.age}</td>
                                    <td>${user.createTime}</td>
                                    <td>${user.updateTime}</td>
                                    <td><span><a class="btn purple btn-outline sbold" data-toggle="modal" href="#update"> 修改 </a></span></td>
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

<div class="modal fade" id="large" tabindex="-1" role="large" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">添加用户</h4>
            </div>
                <form action="/system/saveUser" METHOD="post"  >
            <div class="modal-body">
                    姓名：<input type="text"  name="name"/>
                    性别：<input type="text"  name="sex"/>
                    年龄：<input type="text"  name="age"/>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
                <button type="submit" class="btn green">Save changes</button>
            </div>
                </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="update" tabindex="-1" role="update" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">更新用户</h4>
            </div>
            <form action="/system/updateUser" METHOD="post"  >
                <div class="modal-body">
                    姓名：<input type="text"  name="name" value=""/>
                    性别：<input type="text"  name="sex" value=""/>
                    年龄：<input type="text"  name="age" value=""/>
                    id：<input type="text"  name="id" value="" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn green">Save changes</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
</html>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>小李庄农贸管理系统</title>

</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>摊位管理<small>水费缴纳历史</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li>摊位管理</li>
        <li class="active">水费缴纳历史</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <div class="box-search container">
                    <div><h1 style="font-size: 24px; text-align: center;">${stallName}-水费缴纳历史</h1></div>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>租赁人</th>
                            <th>上月抄见</th>
                            <th>本月抄见</th>
                            <th>用水量</th>
                            <th>单价</th>
                            <th>实收水费</th>
                            <th>季度</th>
                            <th>抄表时间</th>
                            <th>缴纳时间</th>
                            <th class="center">操作</th>
                        </tr>
                    <c:forEach items="${histories}" var="history" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td>${history.renterName}</td>
                            <td>${history.firstRecord}</td>
                            <td>${history.lastRecord}</td>
                            <td>${history.lastRecord-history.firstRecord}</td>
                            <td>¥${history.price}元</td>
                            <td>¥${history.totalPrice}元</td>
                            <td>${1 == history.quarter ? '第一季度' : (2 == history.quarter ? '第二季度' : (3 == history.quarter ? '第三季度' : '第四季度'))}</td>
                            <td>${history.recordDate}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${history.created}"/></td>
                            <td class="operation-part center">
                                <a title="打印" href="stall/printWaterpayment/${history.id}"><span class="glyphicon glyphicon-print"></span></a>
                                <a title="下载" href="stall/downloadWaterpayment/${history.id}"><span class="glyphicon glyphicon-download-alt"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <c:set var="url" value="renter/list" />
                <c:set var="condition" value="${condition}" />
                <%@ include file="../layout/pagination.jsp"%>
            </div>
        </div>
    </div>
</section>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
<html>
<head>
	<title>链接表</title>
	<%@ include file="../../include/head.jsp"%>
	<link href="${ctxStatic}/custom/css/amazeui.select.css" type="text/css" rel="stylesheet" charset="UTF-8" />
	<style type="text/css">
		.tpl-content-wrapper{margin-left:0}
		.row-content{padding: 0;}
	</style>
</head>
<body>
<script src="${ctxStatic}/assets/js/theme.js"></script>
<div class="am-g tpl-g">
	<!-- 内容区域 -->
	<div class="tpl-content-wrapper">
		<div class="row-content am-cf">
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="widget-head am-cf">
							<div class="widget-title am-fl">链接管理</div>
						</div>
						<div class="widget-body am-fr">
							<div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
								<div class="am-btn-toolbar">
									<div class="am-btn-group am-btn-group-xs">
									<shiro:hasPermission name="cms:link:create"><button type="button" class="am-btn am-btn-default am-btn-success"
												onclick="openModel(false,'${ctx}/cms/link/create?categoryId=${page.entity.categoryId}')"><span class="am-icon-plus"></span> 新增
										</button></shiro:hasPermission>
									</div>
								</div>
							</div>
							<div class="am-u-sm-12 am-u-md-9 am-u-lg-9">
								<form id="searchForm" action="${ctx}/cms/link/list?categoryId=${page.entity.categoryId}" method="post">
									<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
									<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
									<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
										<div class="tagsinput">
											<c:if test="${not empty page.key}"><span class="tags"><input type="hidden" name="key" value="${page.key}" />标题=${page.key} <a href="javascript:;" onclick="$(this).parent().remove()">x</a></span></c:if>
                                                <span class="am-select am-input-group-sm">
                                                     <input type="text" class="am-select-input" autocomplete="off" style="border: none;"
															placeholder="标题" am-data='[{"field":"key","desc":"标题","type":"string"}]'>
                                                    <ul class="am-select-ul"></ul>
                                                </span>
										</div>
                                        <span class="am-input-group-btn">
                                            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="submit" onclick="initSearchForm()"></button>
                                        </span>
									</div>
								</form>
							</div>
							<div class="am-u-sm-12">
								<table id="contentTable" class="am-table am-table-compact am-table-striped tpl-table-black">
									<thead>
									<tr>
										<th>链接标题</th>
										<th>链接地址</th>
										<th>更新时间</th>
										<th>备注信息</th>
										<th>操作</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${page.list}" var="link">
										<tr>
											<td>${link.title}</td>
											<td>${link.href}</td>
											<td><fmt:formatDate value="${link.updateDate}"
																pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>${link.remarks}</td>
											<td>
												<shiro:hasPermission name="cms:link:update"><a href="javascript:;" onclick="openModel('修改链接','${ctx}/cms/link/update?id=${link.id}')" title="编辑"><span class="am-icon-pencil"></span></a></shiro:hasPermission>
												<shiro:hasPermission name="cms:link:delete"><a href="${ctx}/cms/link/delete?id=${link.id}&pageNo=${page.pageNo}&pageSize=${page.pageSize}"
													onclick="return confirm('确认要删除该条数据吗？', this.href)" title="删除"><span class="am-text-danger am-icon-trash-o"></span></a></shiro:hasPermission>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="am-u-lg-12 am-cf">
								<%@ include file="../../utils/pagination.jsp" %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../include/bottom.jsp"%>
<script type="text/javascript" src="${ctxStatic}/custom/js/amazeui.select.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = '${msg}';
		if(msg!=''){
			showMsg(msg);
		}
	});
</script>
</body>
</html>

<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "pim");%>
<%pageContext.setAttribute("currentMenu", "favorite");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'pimFavoriteGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_content': '${param.filter_LIKES_content}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'pimFavoriteGridForm',
	exportUrl: 'pim-favorite-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});
    </script>
  </head>

  <body>
    <%@include file="/header/pim3.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/pim3.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="col-md-10" style="padding-top:65px;">

<div class="panel panel-default">
  <div class="panel-heading">
    查询
	<div class="pull-right ctrl">
	  <a class="btn btn-default btn-xs"><i id="pimFavoriteSearchIcon" class="glyphicon glyphicon-chevron-up"></i></a>
    </div>
  </div>
  <div class="panel-body">
    <form name="pimFavoriteForm" method="post" action="pim-favorite-list.do" class="form-inline">
	  <label for="pimFavorite_name">名称:</label>
	  <input type="text" id="pimFavorite_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}" class="form-control">
	  <button class="btn btn-default a-search" onclick="document.pimFavoriteForm.submit()">查询</button>&nbsp;
    </form>
  </div>
</div>

      <div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <button class="btn btn-default a-insert" onclick="location.href='pim-favorite-input.do'">新建</button>
		  <button class="btn btn-default a-remove" onclick="table.removeAll()">删除</button>
		  <button class="btn btn-default a-export" onclick="table.exportExcel()">导出</button>
		</div>

		<div class="pull-right">
		  每页显示
		  <select class="m-page-size form-control" style="display:inline;width:auto;">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
        </div>

	    <div class="clearfix"></div>
	  </div>
	  
<form id="pimFavoriteGridForm" name="pimFavoriteGridForm" method='post' action="pim-favorite-remove.do" class="m-form-blank">
      <div class="panel panel-default">
        <div class="panel-heading">
		  列表
		</div>
  <table id="pimFavoriteGrid" class="table table-hover">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th>标题</th>
        <th>网址</th>
        <th>时间</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
        <td>
		  ${item.title}
		</td>
        <td>
		  ${item.content}
		  <a href="${item.content}" target="_blank"><i class="glyphicon glyphicon-link"></i></a>
		</td>
        <td><fmt:formatDate value="${item.createTime}" type="both"/></td>
        <td>
          <a href="pim-favorite-input.do?id=${item.id}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
      </div>
</form>

	  <div>
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
		</div>

		<div class="btn-group m-pagination pull-right">
		  <button class="btn btn-default">&lt;</button>
		  <button class="btn btn-default">1</button>
		  <button class="btn btn-default">&gt;</button>
		</div>

	    <div class="clearfix"></div>
      </div>

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>

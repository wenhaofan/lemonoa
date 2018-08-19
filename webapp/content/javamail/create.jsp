<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "javamail");%>
<%pageContext.setAttribute("currentMenu", "javamail");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>邮件</title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'orgGrid',
    pageNo: '${page.pageNo}',
    pageSize: '${page.pageSize}',
    totalCount: '${page.totalCount}',
    resultSize: '${page.resultSize}',
    pageCount: '${page.pageCount}',
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: '${page.asc}',
    params: {
        'filter_LIKES_orgname': '${param.filter_LIKES_orgname}',
        'filter_EQI_status': '${param.filter_EQI_status}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'orgGridForm',
	exportUrl: 'group-base-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');

	$('.full-height').height($(window).height() - 150);
	
	var editor = CKEDITOR.replace('message_content');
});
    </script>

  </head>

  <body>
    <%@include file="/header/javamail.jsp"%>

    <div class="row-fluid">
	<%@include file="/menu/javamail.jsp"%>



<div class="panel-group col-md-3" id="accordion2" role="tablist" aria-multiselectable="true" style="padding-top:65px;">

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="collapse-header-javamail" data-toggle="collapse" data-parent="#accordion" href="#collapse-body-javamail" aria-expanded="true" aria-controls="collapse-body-javamail">
      <h4 class="panel-title">
	    <i class="glyphicon glyphicon-list"></i>
        邮件
      </h4>
    </div>
    <div id="collapse-body-javamail" class="panel-collapse collapse ${currentMenu == 'javamail' ? 'in' : ''}" role="tabpanel" aria-labelledby="collapse-header-javamail">
      <div class="panel-body full-height">
<c:forEach var="item" items="${javamailMessages}">
		    <blockquote>
			  <p>
			    <a href="${tenantPrefix}/javamail/index.do?id=${item.id}"><c:out value="${item.sender}"/></a>
				<br>
			    <a href="${tenantPrefix}/javamail/index.do?id=${item.id}">${item.subject}</a>
			  </p>
			  <footer>
			    &nbsp;
              </footer>
			</blockquote>
</c:forEach>      </div>
    </div>
  </div>

</div>






<div class="panel-group col-md-7" id="accordion3" role="tablist" aria-multiselectable="true" style="padding-top:65px;">

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="collapse-header-javamail" data-toggle="collapse" data-parent="#accordion" href="#collapse-body-javamail" aria-expanded="true" aria-controls="collapse-body-javamail">
      <h4 class="panel-title" style="display:inline-block;">
	    <i class="glyphicon glyphicon-list"></i>
        新邮件
      </h4>
      disk/disk-select
      <button style="padding: 4px;"  type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#diskModel">选择附件</button>
    </div>
    <div id="collapse-body-javamail" class="panel-collapse collapse ${currentMenu == 'javamail' ? 'in' : ''}" role="tabpanel" aria-labelledby="collapse-header-javamail">
      <div class="panel-body full-height">

    <form class="form-horizontal" action="send.do" method="post">
	<div class="form-group">
	    <div class="input-group">
	      <div class="input-group-addon" id="files-select" style="text-align:left;">选中附件：</div>
	     
	    </div>
	</div>
	<div class="form-group">
	    <div class="input-group">
	      <div class="input-group-addon">收件人：</div>
	      <input type="text" class="form-control" placeholder="" name="receiver">
	    </div>
	</div>

<div class="form-group">
    <div class="input-group">
      <div class="input-group-addon">主题：</div>
      <input type="text" class="form-control" placeholder="" name="subject">
    </div>
</div>

<div class="form-group">
<textarea id="message_content" name="content"></textarea>
</div>

<div class="form-group">
<button class="btn btn-default">发送</button>
</div>

	</form>


	  
	  </div>

    </div>
  </div>

</div>

	</div>

  </body>

<style>
iframe{
border: 0px solid red !important;}
</style>

<!-- Modal -->
<div class="modal fade" id="diskModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
       	<iframe id="selectDisk" width="550" height="500" src="http://127.0.0.1:8080/lemon/disk/disk-select.do"></iframe>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="getSelectInfo()">确定</button>
        <button type="button" class="btn btn-primary" >关闭</button>
      </div>
    </div>
  </div>

<script type="text/javascript">
function getSelectInfo(){
	var childWindow = $("#selectDisk")[0].contentWindow; //表示获取了嵌入在iframe中的子页面的window对象。  []将JQuery对象转成DOM对象，用DOM对象的contentWindow获取子页面window对象。
	console.log();  //调用子
	
	$.each(childWindow.getSelect(),function(index,item){
		var fileOptionHtml="<span style='color:red;'>"+item.name+"</span><input type='hidden' value='"+item.id+"' name='fileId' >";
		var deleteObj="<span style='color:red;dispay:inline-block;margin-left:1rem;' onclick=\"delectFile(this)\">X</span>"
		$("#files-select").append($(fileOptionHtml));
		$("#files-select").append($(deleteObj));
	})
	return false;
}

function delectFile(curr){
	$(curr).prev().remove();
	$(curr).prev().remove();
	$(curr).remove();
}
</script>
</html>

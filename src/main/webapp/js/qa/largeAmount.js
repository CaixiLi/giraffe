$(function () {
    $('#page-table').DataTable({
//		 "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
                                   "iDisplayLength": 10,
                                   "aLengthMenu": [5, 10, 25, 50, 100, 300, 500, 1000],
                                   "bSort": false,
                                   "autoWidth": true,
                                   "aaSorting": [[2, "desc"]],
//         "oTableTools": {
//             "aButtons": [
//                 "copy","xls"
//             ],
//             "sSwfPath": "/metronic/theme/assets/swf/copy_csv_xls_pdf.swf"
//         },
                                   "language": {
//             "search": "",
                                       "sProcessing": "正在加载中......",
                                       "sLengthMenu": "每页显示 _MENU_ 条记录",
                                       "sZeroRecords": "对不起，查询不到相关数据！",
                                       "sEmptyTable": "表中无数据存在！",
                                       "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                                       "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                                       "oPaginate": {
                                           "sFirst": "首页",
                                           "sPrevious": "上一页",
                                           "sNext": "下一页",
                                           "sLast": "末页"
                                       }
                                   },
                                   "bProcessing": true,
                                   "bServerSide": true,
                                   "bDestroy": true,
                                   "bSortCellsTop": true,
                                   "sAjaxSource": '/qa/largeAmountPage?businessNo=' + $(
                                       '#businessNo').val() + "&momoid=" + $('#momoid').val()
                                                  + "&startDate=" + $('#startDate').val()
                                                  + "&endDate=" + $('#endDate').val()+"&auditStatus="+$("select[name='auditStatus'] option:selected").val(),
                                   "columns": [
                                       {"data": "businessNo"},
                                       {"data": "momoid"},
                                       {"data": "momoid"},//名称
                                       {"data": "money"},
                                       {"data": "activityTime"},
                                       {"data": "createTime"},
                                       {"data": "realMessage"},
                                       {"data": "accountMessage"},
                                       {"data": "accountType"},
                                       {"data": "statusStr"},
                                       {"data": "operationStr"}
                                   ],
                                   "fnServerData": function (sSource, aoData, fnCallback) {
                                       $.ajax({
                                                  "type": 'post',
                                                  "url": sSource,
                                                  "dataType": "json",
                                                  "data": {
                                                      aoData: JSON.stringify(aoData)
                                                  },
                                                  "success": function (resp) {
                                                      fnCallback(resp);
                                                  }
                                              });

                                   }
                               });

    $("#audit").click(function () {
        var id = $("#audit_id").val();
        var status = $("input[name='radio211']:checked").val();
        var messsage = $("#message").val();
        $.ajax({
           type: 'POST',
           url: '/qa/audit',
           data: {
               "id":id,
               "status":status,
               "message":messsage
           },
           success: function () {
               window.location.reload();
           }
        });
    });
});

function auditClick(idValue) {
    console.log(idValue)
    $("#audit_id").val(idValue)
}
function logClick(bussinesNo){
    $.ajax({
       type: 'POST',
       url: '/qa/getAuditLogs',
       data: {
           "bussinesNo":bussinesNo,
       },
       success: function (res) {
           $("#auditLog").empty();
           $("#transferLog").empty();
           console.log(res);
           var jsonObj = res.data;
           for(var i=0;i<jsonObj.length;i++){
                var $opt_tr=$("<tr></tr>");
                var $td_operateTime=$("<td>"+jsonObj[i].createTime+"</td>");
                var $td_operater=$("<td>"+jsonObj[i].checkName+"</td>");
                var $td_message=$("<td>"+jsonObj[i].description+"</td>");
                $opt_tr.append($td_operateTime);
                $opt_tr.append($td_operater);
                $opt_tr.append($td_message);
                $("#auditLog").append($opt_tr);

                var $transger_tr=$("<tr></tr>");
                var $td_transgerTime=$("<td>"+jsonObj[i].updateTime+"</td>");
                var $td_transgerStatus=$("<td>"+jsonObj[i].statusStr+"</td>");
                var $td_transgerMsg=$("<td>"+jsonObj[i].resultMsg+"</td>");
                $transger_tr.append($td_transgerTime);
                $transger_tr.append($td_transgerStatus);
                $transger_tr.append($td_transgerMsg);
                $("#transferLog").append($transger_tr);
           }
       }
    });
}




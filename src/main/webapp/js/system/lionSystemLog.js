$(function() {
	 $('#page-table').DataTable( {
//		 "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
		 "iDisplayLength": 10,
         "aLengthMenu":[5,10,25,50,100,300,500,1000],
         "bSort" : false,
         "autoWidth": true,
         "aaSorting" : [ [ 2, "desc" ] ],
//         "oTableTools": {
//             "aButtons": [
//                 "copy","xls"
//             ],
//             "sSwfPath": "/metronic/theme/assets/swf/copy_csv_xls_pdf.swf"
//         },
         "language": {
//             "search": "",
             "sProcessing" : "正在加载中......",
 			"sLengthMenu" : "每页显示 _MENU_ 条记录",
 			"sZeroRecords" : "对不起，查询不到相关数据！",
 			"sEmptyTable" : "表中无数据存在！",
 			"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
 			"sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
 			"oPaginate" : {
 				"sFirst" : "首页",
 				"sPrevious" : "上一页",
 				"sNext" : "下一页",
 				"sLast" : "末页"
 			}
 		},
 			"bProcessing" : true,
 			"bServerSide" : true,
 			"bDestroy": true,  
            "bSortCellsTop": true,
            "sAjaxSource": '/system/lionSystemLogPage?emmomoid='+$("#id_momoid").val()+'&menuKey='+$("#country_list").val()+'&startTime='+$("#id_startTime").val()+'&endTime='+$("#id_endTime").val(),
	        "columns": [
                		{ "data": "momoid" },
	        			{ "data": "momoid" },
	                    { "data": "cnName" },
	                    { "data": "firstName" },
	                    { "data": "menuName" },
	                    { "data": "content" },
	                    { "data": "ip" },
	                    { "data": "time" }
	        ],
	        "fnServerData" : function(sSource, aoData, fnCallback) {  
                $.ajax({  
                    "type" : 'post',  
                    "url" : sSource,  
                    "dataType" : "json",
                    "data" : {  
                        aoData : JSON.stringify(aoData)  
                    },  
                    "success" : function(resp) {  
                        fnCallback(resp);  
                    }  
                });  
      
            }  
	    } );
} );

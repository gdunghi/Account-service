<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css" />
 
<script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="title pull-left">ผู้ใช้งาน</h1>
             <div class="z-btn-add btn-group pull-right" style="margin: 10px 0 20px;">
              <button type="button" data-toggle="modal" data-target="#myModal" style="background-color:  #2BBA6F;" class="btn btn-lg z-btn-lg z-btn-green height43" >
              	<i class="icon ion-android-add"></i> เพิ่มลูกค้า/คู่ค้าใหม่
              </button>
              <button type="button" style="background-color:  #1E9C5A;" class="btn btn-lg z-btn-lg z-btn-green btn-icon dropdown-toggle height43" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="caret"></span>
                  <span class="sr-only">Toggle Dropdown</span>
              </button>
              <ul class="dropdown-menu sub-nav">
                  <li><a href="javascript:openAddContact();">เพิ่มผู้ใช้งานใหม่</a></li>
                  <li><a href="javascript:openImportContact();">นำเข้าไฟล์ (Excel)</a></li>
              </ul>
          </div> 
        </div>
       
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                   User list
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="user-table">
                        <thead>
                            <tr>
                                <th>User name</th>
                                <th>Full name</th> 
                                <th>Email</th>
                                <th>Enable</th>
                                <th>Last active</th>
                            </tr>
                        </thead>
                        
                       </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>       
</div>
<!-- /#page-wrapper -->


<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">   
     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title">User</h4>
       </div>
       	<form action="${contextPath}/user/save" id="saveUser"  method="POST" >
	       <div class="modal-body">
	       		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		         <input type="text" class="form-control adduser"  name="userName" id="userName" placeholder="User name" />
		         <input type="text" class="form-control adduser" name="password" id="password" placeholder="Password" />
		         <input type="text" class="form-control adduser" name="fname" id="fname" placeholder="First name" />
				 <input type="text" class="form-control adduser" name="lname" id="lname" placeholder="Last name" />  
				 <input type="text" class="form-control adduser" name="email" id="email" placeholder="Email" /> 
			
	       </div>
	       <div class="modal-footer">
	       		<button type="button" class="btn btn-primary" id ="btn-save">Save</button>
	       		<button type="button" class="btn btn-primary" id ="refesh">Save</button>
	         	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	       </div>
        </form>
     </div>     
   </div>
 </div>
 
 <script type="text/javascript">
<!--

//-->

//Plug-in to fetch page data 
jQuery.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
{
	return {
		"iStart":         oSettings._iDisplayStart,
		"iEnd":           oSettings.fnDisplayEnd(),
		"iLength":        oSettings._iDisplayLength,
		"iTotal":         oSettings.fnRecordsTotal(),
		"iFilteredTotal": oSettings.fnRecordsDisplay(),
		"iPage":          oSettings._iDisplayLength === -1 ?
			0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
		"iTotalPages":    oSettings._iDisplayLength === -1 ?
			0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	};
};

$(document).ready(function() {
	initTable(); 
});

 

function initTable (){
   $("#user-table").dataTable( {
	    "bProcessing": true,
	    "bServerSide": true,
	    "sort": "position",
	    //bStateSave variable you can use to save state on client cookies: set value "true" 
	    "bStateSave": false,
	    //Default: Page display length
	    "iDisplayLength": 10,
	    //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
	    "iDisplayStart": 0,
	    "fnDrawCallback": function () {
	        //Get page numer on client. Please note: number start from 0 So
	        //for the first page you will see 0 second page 1 third page 2...
	        //Un-comment below alert to see page number
	    	//alert("Current page number: "+this.fnPagingInfo().iPage);    
	    },         
	    "sAjaxSource": "${contextPath}/user-rest/list",
	    "aoColumns": [
	        { "mData": "userName" },
	        { "mData": "fullName" },
	        { "mData": "email" },
	        { "mData": "enabled" },
	        { "mData": "lastActiveDate" } 
	         
	    ]
	} );
}
$("#refesh").click(function(event) { 
	 $("#user-table").DataTable().ajax.reload();

}); 

$("#btn-save").click(function(event) { 
	var data = {}
	data["${_csrf.parameterName}"] = "${_csrf.token}";
	data["userName"] = $("#userName").val();
	data["password"] = $("#password").val();
	data["fname"] = $("#fname").val();
	data["lname"] = $("#lname").val();
	data["email"] = $("#email").val(); 

	$("#btn-save").prop("disabled", true); 
	$.ajax({
             type: "POST",
             contentType: "application/json",
             url: "${contextPath}/user-rest/save",
             data: JSON.stringify(data),
             dataType: 'json',
             timeout: 600000,
             success: function (data) {
                 $("#btn-update").prop("disabled", false);
                 document.getElementById("saveUser").reset();
                 $('#myModal').modal('toggle');
                 $("#user-table").DataTable().ajax.reload();
             },
             error: function (e) {
                 $("#btn-save").prop("disabled", false);
                 alert(data); 
             }
	}); 
});
 
 
</script>


 

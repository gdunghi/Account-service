<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="title pull-left">ผู้ใช้งาน</h1>
             <div class="z-btn-add btn-group pull-right" style="margin: 10px 0 20px;">
              <button type="button" style="background-color:  #2BBA6F;" class="btn btn-lg z-btn-lg z-btn-green height43" onclick="openAddContact();"><i class="icon ion-android-add"></i> เพิ่มลูกค้า/คู่ค้าใหม่</button>
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
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>User name</th>
                                <th>Full name</th> 
                                <th>Email</th>
                                <th>Enable</th>
                                <th>Last active</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${userList}" var="item">
								<tr>									 
									<td>${item.userName}</td>
									<td>${item.fullName}</td>
									<td>${item.email}</td>
									<td>${item.enabled}</td>
									<td>${item.lastActiveDate}</td>
								</tr>
							</c:forEach> 
                            </tbody>
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

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html> 
<html>
<head>
<title><tiles:getAsString name="title" /></title> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 

    <!-- Bootstrap Core CSS -->
    <link href="<spring:url value="../vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<spring:url value="../vendor/metisMenu/metisMenu.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<spring:url value="../dist/css/sb-admin-2.css"/>"  rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<spring:url value="../vendor/morrisjs/morris.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<spring:url value="../vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
     <!-- jQuery -->
    <script src="<spring:url value="../vendor/jquery/jquery.min.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<spring:url value="../vendor/bootstrap/js/bootstrap.min.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<spring:url value="../vendor/metisMenu/metisMenu.min.js"/>"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<spring:url value="../vendor/raphael/raphael.min.js"/>"></script>
    <script src="<spring:url value="../vendor/morrisjs/morris.min.js"/>"></script>
    <script src="<spring:url value="../data/morris-data.js"/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<spring:url value="../dist/js/sb-admin-2.js"/>"></script>
    <script >
       
       
      
      $(function(){
           function onSubmitLogOut(){
            $("#loutOutForm").submit()
        }
        $('#logoutSubmit').click(onSubmitLogOut);
       
    });

    </script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
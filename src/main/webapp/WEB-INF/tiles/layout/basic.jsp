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



	<spring:url value="${contextPath}/vendor/bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
    <link href="${bootstrapCss}" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <spring:url value="${contextPath}/vendor/metisMenu/metisMenu.min.css" var="metisMenuCss"/>
    <link href="${metisMenuCss}" rel="stylesheet"/> 

    <!-- Custom CSS -->
    <spring:url value="${contextPath}/dist/css/sb-admin-2.css" var="adminCss"/>
    <link href="${adminCss}" rel="stylesheet"/> 
   

    <!-- Morris Charts CSS --> 
     <spring:url value="${contextPath}/vendor/morrisjs/morris.css" var="morrisCss"/>
    <link href="${morrisCss}" rel="stylesheet"/> 

    <!-- Custom Fonts -->
    
    <spring:url value="${contextPath}/vendor/font-awesome/css/font-awesome.min.css" var="awesomeCss"/>
    <link href="${awesomeCss}" rel="stylesheet"/> 

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
     <!-- jQuery --> 
    <spring:url value="${contextPath}/vendor/jquery/jquery.min.js" var="jqueryJs"/>
    <script src="${jqueryJs}" ></script>

    <!-- Bootstrap Core JavaScript --> 
    <spring:url value="${contextPath}/vendor/bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
    <script src="${bootstrapJs}" ></script>

    <!-- Metis Menu Plugin JavaScript --> 
    <spring:url value="${contextPath}/vendor/metisMenu/metisMenu.min.js" var="metisMenuJs"/>
    <script src="${metisMenuJs}" ></script>
    
    <!-- Morris Charts JavaScript 
    <script src="<spring:url value="..${contextPath}/vendor/raphael/raphael.min.js"/>"></script>
    <script src="<spring:url value="..${contextPath}/vendor/morrisjs/morris.min.js"/>"></script>
    <script src="<spring:url value="..${contextPath}/data/morris-data.js"/>"></script>
-->
    <!-- Custom Theme JavaScript --> 
    <spring:url value="${contextPath}/dist/js/sb-admin-2.js" var="adminJs"/>
    <script src="${adminJs}" ></script>
    
    
    <script type="text/javascript"> 
       
       
      
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
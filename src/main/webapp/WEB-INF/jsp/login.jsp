<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
	  <link href="<c:url value="css/login.css" />" rel="stylesheet"	type="text/css">
<title>Login</title>
</head>
<body class="security-app">

	  <div class="wrapper">
				<form class="form-signin" action="/login" method="post">      
				<h2 class="form-signin-heading">Please login</h2>
				<input type="text" class="form-control" name="username" placeholder="username" required="" autofocus="" />
				<input type="password" class="form-control" name="password" placeholder="Password" required=""/>     
				<c:if test="${param.error ne null}">
				<div class="alert-danger">Invalid username and password.</div>
				</c:if>
				<c:if test="${param.logout ne null}">
					<div class="alert-normal">You have been logged out.</div>
				</c:if>
                <button class="btn btn-lg btn-primary btn-block" type="submit">           Sign in</button>
				<input type="hidden" name="${_csrf.parameterName}"			value="${_csrf.token}" />
                </form>
		</div>
  

</body>
</html>
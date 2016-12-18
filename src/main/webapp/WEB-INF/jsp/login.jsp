<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  	  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>	
	  <style type="text/css">	  	
	  	body {
			  background: #eee !important;
			}

			.wrapper {
			  margin-top: 80px;
			  margin-bottom: 80px;
			}

			.form-signin {
			  max-width: 380px;
			  padding: 15px 35px 45px;
			  margin: 0 auto;
			  background-color: #fff;
			  border: 1px solid rgba(0, 0, 0, 0.1);
			}
			.form-signin .form-signin-heading,
			.form-signin .checkbox {
			  margin-bottom: 30px;
			}
			.form-signin .checkbox {
			  font-weight: normal;
			}
			.form-signin .form-control {
			  position: relative;
			  font-size: 16px;
			  height: auto;
			  padding: 10px;
			  -webkit-box-sizing: border-box;
			  -moz-box-sizing: border-box;
			  box-sizing: border-box;
			}
			.form-signin .form-control:focus {
			  z-index: 2;
			}
			.form-signin input[type="text"] {
			  margin-bottom: -1px;
			  border-bottom-left-radius: 0;
			  border-bottom-right-radius: 0;
			}
			.form-signin input[type="password"] {
			  margin-bottom: 20px;
			  border-top-left-radius: 0;
			  border-top-right-radius: 0;
			}

	  </style>

<title>Login</title>
</head>
<body class="security-app">

	  <div class="wrapper">
				<form class="form-signin" action="/login" method="post">      
				<h2 class="form-signin-heading">Please login</h2>
				<input type="text" class="form-control" name="username" placeholder="username" value="admin" required="" autofocus="" />
				<input type="password" class="form-control" name="password" placeholder="Password" required="" value="123456"/>     
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="full-height">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.js"></script>
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.js"></script>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style>
.view {
	background:
		url("https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?cs=srgb&dl=background-brick-wall-bricks-259915.jpg&fm=jpg")
		no-repeat center center;
	background-size: cover;
}
main {
	background-color: black;
}
</style>
<title>Insert title here</title>
</head>
<sec:authentication var="user" property="principal" scope="session"/>
<body>
<!--Main Navigation-->

<header>

	<nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar indigo">
        <a class="navbar-brand" href="/"><strong>Site</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            <sec:authorize access="isAnonymous()">
                <li class="nav-item active">
                    <a class="nav-link" href="/login/login">Login<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/memberJoin">Join</a>
                </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="/bbs/list">List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/logOut">Logout</a>
                </li>
                </sec:authorize>
            </ul>
        </div>
    </nav>
    <div class="view intro-2">
	<div class="full-bg-img">
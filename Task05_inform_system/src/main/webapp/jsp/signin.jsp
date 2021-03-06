<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${param.language == 'en'}">
    <fmt:setLocale value="en" scope="session"/>
</c:if>
<c:if test="${param.language == 'ru'}">
    <fmt:setLocale value="ru" scope="session"/>
</c:if>
<c:if test="${param.language == 'de'}">
    <fmt:setLocale value="de" scope="session"/>
</c:if>
<fmt:bundle basename="signin_page">
<c:url var="home" value="/home"/>
<c:url var="signup" value="/signup"/>
<c:url var="signin" value="/signin"/>
<c:url var="contact" value="/contact"/>


<c:set var="url">${pageContext.request.requestURL}</c:set>
<c:set var="ctx"
       value="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}"/>


<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${ctx}/css/sign_in.css"
          type="text/css"/>
    <link rel="icon"
          href="https://cdn1.savepice.ru/uploads/2019/4/17/5ae5758165638c1db1af157878d0e2a9-full.png"
          type="image/jpg">

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
          rel="stylesheet" id="bootstrap-css">
    <title>
        Free ride
    </title>

    <style>
        .back-img {
            background: url(${ctx}/img/main_page_background.jpg) no-repeat; background-size: 100%; -moz-background-size: 100%; /* Firefox 3.6+ */
            -webkit-background-size: 100%; /* Safari 3.1+ и Chrome 4.0+ */
            -o-background-size: 100%;
        }
    </style>
</head>

<body class="back-img">


<div class="container" style="margin-top: 55px;">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall"
                 style="background-color: rgba(247,247,247, 1)">
                <h1 class="text-center login-title" style="font-size: 23px"><fmt:message key="header"/></h1>
                <img style="margin-top: 20px;" class="profile-img"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                     alt="">
                <form class="form-signin" method="post"
                      action="${home}">
                    <input type="hidden" name="command" value="signin"/>
                    <input name="email" type="email" class="form-control"
                           placeholder="Email" required autofocus>
                    <input name="pass" type="password" class="form-control"
                           placeholder="<fmt:message key="password"/>" required>
                    <c:if test="${not empty incorrect_data}">
                        <h5 style="color: red; text-align: center">${incorrect_data}
                            <br>If you have any questions, please,
                            <a href="${contact}" style="color: red; text-decoration: underline">contact</a> us.</h5>
                    </c:if>
                    <c:if test="${not empty info}">
                        <h5 style="color: rgb(73, 160, 181); text-align: center">${info}
                            <br>If you have any questions, please,
                            <a href="${contact}" style="color: rgb(73, 160, 181); text-decoration: underline">contact</a> us.</h5>
                    </c:if>
                    <c:if test="${not empty blackList}">
                        <h5 style="color: red; text-align: center">${blackList}
                            <br>If you have any questions, please,
                            <a href="${contact}" style="color: red; text-decoration: underline">contact</a> us.</h5>
                    </c:if>
                    <c:if test="${not empty signedUp}">
                        <h5 style="color: green; text-align: center">${signedUp}</h5>
                    </c:if>
                    <button class="btn btn-lg btn-primary btn-block"
                            type="submit">
                        <fmt:message key="signin"/>
                    </button>
                    <a href="${signup}" class="text-center new-account"><fmt:message key="create_acc"/> </a>
                    <a href="${home}" class="text-center new-account" style="position: absolute; margin-left: 30%;"><fmt:message key="home"/></a>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</body>
</html>
</fmt:bundle>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:if test="${param.language == 'en'}">
    <fmt:setLocale value="en" scope="session"/>
</c:if>
<c:if test="${param.language == 'ru'}">
    <fmt:setLocale value="ru" scope="session"/>
</c:if>
<c:if test="${param.language == 'de'}">
    <fmt:setLocale value="de" scope="session"/>
</c:if>
<fmt:bundle basename="index_page">
    <c:url value="/home" var="home"/>
    <c:url value="/cars" var="cars"/>
    <c:url value="/contact" var="contact"/>
    <c:url value="/orders" var="orders"/>
    <c:url value="/my_orders" var="user_orders"/>
    <c:url value="/users" var="users"/>

    <c:url value="/signin" var="signin"/>
    <c:url value="/signup" var="signup"/>
    <c:url value="/profile" var="profile"/>

    <c:set var="user" value="${sessionScope.user}"/>

    <c:set var="url">${pageContext.request.requestURL}</c:set>
    <c:set var="ctx"
           value="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}"/>


    <html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon"
              href="${ctx}/img/wheel.png"
              type="image/jpg">
        <link rel="stylesheet" href="${ctx}/css/index.css"
              type="text/css"/>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">

        <link href="https://fonts.googleapis.com/css?family=Roboto:700"
              rel="stylesheet">

        <title>
            Free ride
        </title>
        <style>
            .a01 {
                color: rgb(251, 251, 251);
            }

            .a01:hover {
                color: rgb(52, 57, 62);
            }

            .back-img {
                background: url(${ctx}/img/main_page_background.jpg) no-repeat;
                background-size: 100%;
                -moz-background-size: 100%; /* Firefox 3.6+ */
                -webkit-background-size: 100%; /* Safari 3.1+ и Chrome 4.0+ */
                -o-background-size: 100%;
            }
        </style>

    </head>

    <body class="back-img">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
        <div class="container">
            <a class="navbar-brand" href="${home}"
               style="font-family: 'Roboto', sans-serif; font-size: 23px">FreeRide</a>
            <button class="navbar-toggler" type="button"
                    data-toggle="collapse"
                    data-target="#navbarResponsive"
                    aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="${home}"><fmt:message
                                key="home"/>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${cars}"><fmt:message
                                key="cars"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contact}"><fmt:message
                                key="contact"/></a>
                    </li>
                    <c:if test="${not empty user && user.role.value()==2}">
                        <li class="nav-item">
                            <a class="nav-link" href="${orders}"><fmt:message
                                    key="orders"/></a>
                        </li>
                    </c:if>
                    <c:if test="${not empty user && user.role.value()==3}">
                        <li class="nav-item">
                            <a class="nav-link" href="${users}"><fmt:message
                                    key="users"/></a>
                        </li>
                    </c:if>

                    <c:choose>
                        <c:when test="${user==null}">
                            <li class="nav-item">
                                <input value="<fmt:message
                                key="signin"/>" type="button"
                                       onclick="window.location='${signin}'"
                                       class="btn btn-success navbar-btn btn-circle"
                                       style="margin-left: 12px;">
                            </li>
                            <li class="nav-item"><input value="<fmt:message
                                key="signup"/>"
                                                        type="button"
                                                        onclick="window.location='${signup}'"
                                                        class="btn btn-success navbar-btn btn-circle"
                                                        style="margin-left: 12px;">
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <div class="btn-group dropup">
                                    <input type="button"
                                           value="${user.userData.FName}"
                                           class="btn btn-info dropdown-toggle"
                                           data-toggle="dropdown"
                                           aria-haspopup="true"
                                           aria-expanded="false"
                                           style="margin-left: 12px;"/>
                                    <div class="dropdown-menu"
                                         style="background-color: rgb(52,57,62);">
                                        <c:if test="${user.role.value() != 3}">
                                            <a class="dropdown-item a01"
                                               href="${profile}"><fmt:message
                                                    key="profile"/></a>
                                            <a class="dropdown-item a01"
                                               href="${user_orders}"><fmt:message
                                                    key="my_orders"/>
                                            </a>
                                            <div class="dropdown-divider"></div>
                                        </c:if>
                                        <form style="margin-bottom: 0px;"
                                              action="${signin}"
                                              method="post">
                                            <input type="hidden"
                                                   name="command"
                                                   value="signout"/>
                                            <input type="submit"
                                                   class="dropdown-item a01"
                                                   value="<fmt:message
                                key="logout"/>">
                                        </form>
                                    </div>
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <li style="margin-left: auto; margin-right: 0;">
                        <div class="btn-group dropup">
                            <input type="button"
                                   value="<fmt:message
                                key="language"/>"
                                   class="btn btn-secondary dropdown-toggle"
                                   data-toggle="dropdown"
                                   aria-haspopup="true"
                                   aria-expanded="false"
                                   style="margin-left: 12px;"/>
                            <div class="dropdown-menu"
                                 style="background-color: rgb(52,57,62);">
                                <form style="margin-bottom: 0px;" action="#">
                                    <input type="hidden" name="language"
                                           value="en">
                                    <input type="submit"
                                           class="dropdown-item a01"
                                           value="En">
                                </form>
                                <form style="margin-bottom: 0px;" action="#">
                                    <input type="hidden" name="language"
                                           value="ru">
                                    <input type="submit"
                                           class="dropdown-item a01"
                                           value="Ru">
                                </form>
                                <form style="margin-bottom: 0px;" action="#">
                                    <input type="hidden" name="language"
                                           value="de">
                                    <input type="submit"
                                           class="dropdown-item a01"
                                           value="De">
                                </form>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <section style="margin-top: 60px; margin-right: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6"
                     style="background-color: rgba(10,13,14,0.4); color: white;">
                    <h1 class="mt-2" style="color: rgb(241,284,71)"><fmt:message key="main_ph"/> </h1>
                    <p style="font-size: 23px"><fmt:message key="st1"/> </p>
                </div>
            </div>
        </div>

        <div class="container" style="margin-top: 7px;">
            <div class="row">
                <div class="col-lg-6"
                     style="background-color: rgba(10,13,14,0.4); color: white;">
                    <p style="font-size: 23px"><fmt:message key="st2"/></p>
                    <br>
                    <a href="${cars}"
                       class="butt"><fmt:message key="book_online"/></a>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    </body>
    </html>
</fmt:bundle>
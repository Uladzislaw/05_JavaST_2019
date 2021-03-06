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
<fmt:bundle basename="signup_page">
<c:url value="/home" var="home"/>
<c:url value="/signin" var="signin"/>
<c:url value="/contact" var="contact"/>

<c:set var="url">${pageContext.request.requestURL}</c:set>
<c:set var="ctx" value="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://cdn1.savepice.ru/uploads/2019/4/17/5ae5758165638c1db1af157878d0e2a9-full.png"
          type="image/jpg">
    <link rel="stylesheet" href="${ctx}/css/signup.css"
          type="text/css"/>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


    <title>
        Free ride
    </title>

</head>

<body>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <header class="card-header">
                    <a href="${signin}" class="float-right btn btn-outline-primary mt-1"><fmt:message key="signin"/></a>
                    <h4 class="card-title mt-2"><fmt:message key="signup"/></h4>
                    <c:if test="${not empty incorrect_data}">
                        <h6 style="color: red; text-align: center">${incorrect_data}
                            <br>If you have any questions, please,
                            <a href="${contact}" style="color: red; text-decoration: underline">contact</a> us.</h6>
                    </c:if>
                </header>
                <article class="card-body">
                    <form method="post" action="${signin}">
                        <input type="hidden" name="command" value="signup"/>
                        <div class="form-row">
                            <div class="col form-group">
                                <label><fmt:message key="fname"/> </label>
                                <input name="fname" type="text" required class="form-control" placeholder="Aa...">
                            </div> <!-- form-group end.// -->
                            <div class="col form-group">
                                <label><fmt:message key="lname"/></label>
                                <input name="lname" type="text" required class="form-control" placeholder="Aa...">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->
                        <div class="form-row">
                            <div class="col form-group">
                                <label><fmt:message key="serienumber"/> </label>
                                <input name="ps_number" type="text" required class="form-control" placeholder="AAxxxxxxx">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->
                        <div class="form-row">
                            <div class="col form-group">
                                <label><fmt:message key="issue_date"/></label>
                                <input name="ps_issue" type="text" required class="form-control" placeholder="dd-mm-yyyy">
                            </div> <!-- form-group end.// -->
                            <div class="col form-group">
                                <label><fmt:message key="end_date"/></label>
                                <input name="ps_end" type="text" class="form-control" required placeholder="dd-mm-yyyy">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->
                        <div class="form-group">
                            <label><fmt:message key="idnumber"/></label>
                            <input name="ps_id" type="text" required class="form-control" placeholder="xxxxxxxAxxxAAx">
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <label><fmt:message key="email"/></label>
                            <input name="email" type="email" required class="form-control" placeholder="aaaa@post.aaa">
                            <small class="form-text text-muted"><fmt:message key="small"/></small>
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <label><fmt:message key="address"/></label>
                            <input name="address" type="text" required class="form-control" placeholder="City, Street N/H">
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <label><fmt:message key="password"/></label>
                            <input name="password" type="password" required class="form-control" placeholder="">
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> <fmt:message key="register"/>  </button>
                        </div> <!-- form-group// -->
                        <small class="text-muted"><fmt:message key="attention1"/> <br> <fmt:message key="attention2"/></small>
                    </form>
                </article> <!-- card-body end .// -->
                <div class="border-top card-body text-center"><fmt:message key="have_an_account"/> <a href="${signin}"><fmt:message key="signin"/></a></div>
            </div> <!-- card.// -->
        </div> <!-- col.//-->

    </div> <!-- row.//-->


</div>
<!--container end.//-->

<br><br>
<article class="bg-secondary mb-3">
    <div class="card-body text-center">
        <h3 class="text-white mt-3">FreeRide comp</h3>
        <p class="h5 text-white">Provide vehicle for you.</p>   <br>
        <p><a class="btn btn-warning" target="_blank" href="${home}"> FreeRide.com
            <i class="fa fa-window-restore "></i></a></p>
    </div>
    <br><br>
</article>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>
</fmt:bundle>

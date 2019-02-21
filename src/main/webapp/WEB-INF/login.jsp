<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body class="loginPage">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="box mt-3">
        <div class="container p-3">
            <h1><c:out value="${loginMessage}"/></h1>


            <form action="/login" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" name="username" class="form-control" type="text" pattern="[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" value="${stickyUser}" required autofocus>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                </div>
                <c:if test="${sessionScope.validAttempt == false}">
                    <jsp:include page="partials/messages.jsp"/>
                </c:if>
                <input type="submit" class="btn btn-primary btn-block" value="Log In">
            </form>
        </div>
    </div>
<jsp:include page="partials/foot.jsp"/>
</body>
</html>

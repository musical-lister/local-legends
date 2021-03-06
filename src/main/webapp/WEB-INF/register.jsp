<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <style>
        input:focus:required:invalid {border-color: red;}
        input:required:valid {background-color: white; color: black;}
    </style>
</head>
<body class="registerPage">
    <jsp:include page="partials/navbar.jsp" />
    <div class="box mt-3">
    <div class="container mb-3">
        <h1>Register Now!</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control inputBackground" type="text" pattern="[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+).{5,10}*$" title="Must contain at least 6 to 20 characters" value="${stickyUser}" required autofocus>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control inputBackground" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Enter a valid email" value="${stickyEmail}" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control inputBackground" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control inputBackground" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
            </div>
                <c:if test="${sessionScope.inputHasErrors ==true}">
            <jsp:include page="partials/messages.jsp"/>
                </c:if>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    </div>
<jsp:include page="partials/foot.jsp"/>
</body>
</html>

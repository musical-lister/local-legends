<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Ad Page" />
    </jsp:include>
</head>
<body class="adPage">
<jsp:include page="../partials/navbar.jsp" />
<div class="box">
    <div class="text-center mt-3">
        <h1>${adTitle}</h1>
        <p>${adDescription}</p>
        <p>${sessionScope.user.username}</p>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/foot.jsp"/>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container">
        <h4>Here are your posts!</h4>
        <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <a href="/ads/show?id=${ad.id}"><h2>${ad.title}</h2></a>

            <p>${ad.description}</p>
            <button onclick="window.location.href = 'ads/edit'">Edit</button>
        </div>
        </c:forEach>
    </div>

    <button class="btn-secondary" onclick="window.location.href = '/ads/create';">Create Ad</button>
<jsp:include page="partials/foot.jsp"/>
</body>
</html>

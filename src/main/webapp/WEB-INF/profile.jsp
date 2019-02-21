<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body class="profilePage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="mt-3 box">
    <div class="container mt-3">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container">
        <h4>Here are your posts!</h4>
        <c:forEach var="ad" items="${ads}">
            <div style="width: 18rem;" class="m-2 d-inline-block">
                <div class="card-body">
                    <h5 class="card-title">${ad.title}</h5>
                    <p class="card-text">${ad.description}</p>
                    <button class="btn btn-danger" onclick="window.location.href = 'ads/delete?AdID=${ad.id}'">Delete</button>
                </div>
            </div>
        </c:forEach>
        <button class="btn btn-primary m-3" onclick="window.location.href = '/ads/create';">Create Ad</button>
    </div>
</div>
<jsp:include page="partials/foot.jsp"/>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body class="adsPage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="mt-3 box">
    <div class="container">
        <h1 class="mt-2">${searchMessage}</h1>

        <c:forEach var="ad" items="${ads}">
            <div style="width: 18rem;" class="m-2 d-inline-block">
                <div class="card-body">
                    <a class="card-title" href="/ads/show?id=${ad.id}"><h2>${ad.title}</h2></a>
                    <p class="card-text">${ad.description}</p>
                    <button class="btn btn-danger" onclick="window.location.href = 'ads/delete?AdID=${ad.id}'">Delete</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="/WEB-INF/partials/foot.jsp"/>
</body>
</html>

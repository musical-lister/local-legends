<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link href="../css/main.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <div class="container">
        <h4>Here are your posts!</h4>
        <div class="card-group">
            <c:forEach var="ad" items="${ads}">
                <div class="card bg-light">
                    <div class="card-header">
                        <a  href="/ads/show?id=${ad.id}"><h2>${ad.title}</h2></a>
                        <button class="btn btn-danger float-right" data-toggle="modal" data-target="#exampleModal">Delete</button>
                    </div>
                    <div class="card-body">
                        <p>${ad.description}</p>
                    </div>
                </div>
                <!--trigger-->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Delete Ad</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete this ad? ${ad.title}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <button type="button" class="btn btn-danger" onclick=" window.location.href = 'ads/delete?AdID=${ad.id}'">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <button class="btn-secondary " onclick="window.location.href = '/ads/create';">Create Ad</button>
<jsp:include page="partials/foot.jsp"/>
</body>
</html>

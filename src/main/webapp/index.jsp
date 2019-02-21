<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body class="landingPage">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="box mt-3">
            <div class="container text-center">
            <h1 class="localLegends">Welcome to Local Legends</h1>
            <h5 style="color: #FCC624;">Musical Adlister</h5>
            </div>
        </div>
    <jsp:include page="/WEB-INF/partials/foot.jsp"/>
</body>
</html>

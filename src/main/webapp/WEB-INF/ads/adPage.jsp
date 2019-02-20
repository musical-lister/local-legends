<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Ad Page" />
    </jsp:include>
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />
<c:forEach var = "ad" items="${ads}">
        <c:set var = "adID" value="${ad.id}"/>
        <c:if test="${fn:endsWith(pageContext.request.requestURI, adID)}">
                <h1>its working!!!</h1>
                <p>ad id: ${ad.id}</p>
        </c:if>
</c:forEach>
<jsp:include page="/WEB-INF/partials/foot.jsp"/>
</body>
</html>

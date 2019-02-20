<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>${param.title}</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<body>
<div class="alert alert-danger m-1">

    <%--login error message--%>
    <c:out value="${errorMessageLogin}"/>



    <%--register error messages--%>
    <c:out value="${errorMessageUsername}"/>
    <%--<c:if test="${sessionScope.errorMessageUsername}" >--%>
        <%--<br><br>--%>
    <%--</c:if>--%>
    <c:out value="${errorMessageEmail}"/>
    <%--<c:if test="${sessionScope.errorMessageEmail}" >--%>
        <%--<br><br>--%>
    <%--</c:if>--%>
    <c:out value="${errorMessagePassword}"/>



</div>
<br>
</body>

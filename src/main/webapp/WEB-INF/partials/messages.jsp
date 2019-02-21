<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>${param.title}</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<body>
<div class="alert alert-danger m-1">

    <%--login error message--%>
    <c:if test="${validAttempt==false}">
        <c:out value="${errorMessageLogin}"/>
    </c:if>


    <%--register error messages--%>
    <c:if test="${inputHasErrors==true}">
        <c:out value="${errorMessageUsername}"/>
        <br>
    </c:if>
    <c:if test="${inputHasErrors==true}" >
        <br>
        <c:out value="${errorMessageEmail}"/>
        <br>
    </c:if>
    <c:if test="${inputHasErrors==true}" >
        <br>
        <c:out value="${errorMessagePassword}"/>
        <br>
    </c:if>



</div>
<br>
</body>

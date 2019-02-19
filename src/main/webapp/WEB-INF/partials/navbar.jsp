<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/ads">Local Legends</a>
                </div>

                <form action="/ads" class="form-inline md-form mr-auto">
                    <input class="form-control mr-sm-2" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                    <button class="btn btn-rounded my-0" type="submit">View Ads!</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">Local Legends</a>
                </div>

                <form action="/ads" class="form-inline md-form mr-auto">
                    <input class="form-control" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                    <button class="btn btn-rounded my-0" type="submit">View Ads!</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/login">Login</a></li>
                    <li><a href="/register">Register</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</nav>



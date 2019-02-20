<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:choose>
            <c:when test="${sessionScope.user != null}">
<<<<<<< HEAD
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="/ads">Local Legends</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav navbar-right">
                            <li class="nav-item">
                                <a class="nav-link" href="/profile">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/logout">Logout</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Categories
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="/venue">Venue</a>
                                    <a class="dropdown-item" href="/music">Music</a>
                                </div>
                            </li>
                        </ul>

                        <form action="/ads" class="form-inline">
                            <input class="form-control" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                        </form>
                    </div>
                </nav>
            </c:when>
            <c:otherwise>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="/ads">Local Legends</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav navbar-right">
                            <li class="nav-item">
                                <a class="nav-link" href="/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/register">Register</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Categories
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="/venue">Venue</a>
                                    <a class="dropdown-item" href="/music">Music</a>
                                </div>
                            </li>
                        </ul>
                        <form action="/ads" class="form-inline">
                            <input class="form-control" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                        </form>
                    </div>
                </nav>
=======
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
>>>>>>> master
            </c:otherwise>
        </c:choose>




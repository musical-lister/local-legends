<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:choose>
            <c:when test="${sessionScope.user != null}">

                <nav class="navbar navbar-expand-lg navbar-dark" style="background: #271919;">
                    <a class="navbar-brand" href="/ads">Local Legends</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/profile">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/logout">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/settings">Settings</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Categories
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Venue</a>
                                    <a class="dropdown-item" href="#">Music</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                        </ul>
                        <form action="/ads" class="form-inline my-2 my-lg-0">
                            <input class="form-control" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </c:when>
            <c:otherwise>
                <nav class="navbar navbar-expand-lg navbar-dark" style="background: #271919;">
                    <a class="navbar-brand" href="/ads">Local Legends</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/register">Register</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Categories
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Venue</a>
                                    <a class="dropdown-item" href="#">Music</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                        </ul>
                        <form action="/ads" class="form-inline my-2 my-lg-0">
                            <input class="form-control" name="search" id="search" type="text" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
<<<<<<< HEAD

=======
>>>>>>> master
            </c:otherwise>
        </c:choose>




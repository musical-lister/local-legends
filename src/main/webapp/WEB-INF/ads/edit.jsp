<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Create a new Ad" />
        </jsp:include>
    </head>
    <body class="createPage">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="box">
    <div class="container mt-3">
            <h1>Create a new Ad</h1>
            <form action="/ads/edit" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text" required></textarea>
                </div>
                <input type="submit" class="btn btn-block btn-primary">
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/foot.jsp"/>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Add Article</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <jsp:include page="menu.jsp"/>
</div>
<div>
    <jsp:include page="side_nav.jsp"/>
</div>
<div>
    <jsp:include page="side_nav_right.jsp"/>
</div>
<div class="">
    <table align="center">

        <form method="post" action="AddArticleServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">Add Article</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Title</label></td>
                <td><input type="text" class="form-control" placeholder="Add Your Title" required autofocus
                           name="title"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">URL</label></td>
                <td><input type="text" class="form-control" placeholder="Add Your URL" required name="url"></td>
            </tr>

            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Author</label></td>
                <td><input type="text" class="form-control" placeholder="Add Author" required name="author"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Category &nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Select Category" required name="category"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Sub-Category&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Select Sub-Category" required
                           name="subcategory"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Tags</label></td>
                <td><input type="text" class="form-control" placeholder="Tags" required name="tags"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button class="btn btn-primary" type="submit">Add</button>
                    &nbsp;
                    <button class="btn btn-primary" type="reset">Reset</button>
                </td>
                &nbsp;&nbsp;&nbsp;
            </tr>

        </form>

    </table>
</div>
</body>
</html>

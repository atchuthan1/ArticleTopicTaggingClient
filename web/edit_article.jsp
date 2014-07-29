<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Edit User Role</title>
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

        <%
            Object value = null;
            value = request.getAttribute("value");

            JSONArray jsonArray = new JSONArray(value.toString());
            // for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = new JSONObject(jsonArray.get(0).toString());%>

        <form method="POST" action="UpdateArticleServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">Edit Article</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">Article ID&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" required name="article_id"
                           readonly value= <%=jsonObject.get("article_id").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">E-Mail&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" required name="email"
                           readonly value= <%=jsonObject.get("email").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">Title&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" name="title"
                           value= <%=jsonObject.get("title").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">URL&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" name="url"
                           value= <%=jsonObject.get("url").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">Author&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" name="author"
                           value= <%=jsonObject.get("author").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">Sub Category&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" required
                           name="sub_category_id" value= <%=jsonObject.get("sub_category_id").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td><label class="control-label">Tags&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" name="tags"
                           value= <%=jsonObject.get("tags").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>


            <tr>
                <td></td>
                <td>
                    <button class="btn btn-primary" type="submit">Update</button>
                    &nbsp;
                    <button class="btn btn-primary" type="submit">Delete</button>
                </td>
                &nbsp;&nbsp;&nbsp;
            </tr>

        </form>


    </table>
</div>
</body>
</html>
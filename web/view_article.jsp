<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | View Articles</title>
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

        <form method="GET" action="ViewArticleServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">View Articles</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <button class="btn btn-primary" type="submit">View</button>
                    &nbsp;</td>
                &nbsp;&nbsp;&nbsp;
            </tr>
        </form>
    </table>
</div>
</form>
<%
    Object value = null;
    value = request.getAttribute("value");
    if (value != null) {
%>
<br><br>

<table align="center" border="1" cellspacing="3">

    <tr>
        <td>Article ID</td>
        <td>E-Mail</td>
        <td>Title</td>
        <td>URL</td>
        <td>Author</td>
        <td>Sub Category</td>
        <td>Tags</td>
        <td align="center" colspan="2">Action</td>
    </tr>
    <% JSONArray jsonArray = new JSONArray(value.toString());
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = new JSONObject(jsonArray.get(i).toString());%>
    <tr>
        <td><%=jsonObject.get("article_id").toString()%>
        </td>
        <td><%=jsonObject.get("email").toString() %>
        </td>
        <td><%=jsonObject.get("title").toString()%>
        </td>
        <td><%=jsonObject.get("url").toString() %>
        </td>
        <td><%=jsonObject.get("author").toString()%>
        </td>
        <td><%=jsonObject.get("sub_category_id").toString() %>
        </td>
        <td><%=jsonObject.get("tags").toString() %>
        </td>

        <td><a href="/UpdateArticleServlet?key=<%=jsonObject.get("article_id").toString()%>">Edit</a></td>
        <td><a href="/UpdateArticleServlet?key2=<%=jsonObject.get("article_id").toString()%>">Delete</a></td>
    </tr>
    <%}%>
</table>
</div>
<% } %>
</body>
</html>

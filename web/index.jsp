<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>


<div class="">
    <table align="center">
        <div class="jumbotron">
            <form method="post" action="LoginServlet">
                <tr>
                    <td>
                        <%
                            if ("signInSuccess".equals(request.getAttribute("signIn"))) {
                        %>
                        <div class="alert alert-success" role="alert">
                            <h4>Signup successfully <%=request.getAttribute("firstName")%>
                            </h4>
                        </div>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td><h3 class="form-signin-heading">Login</h3></td>
                </tr>
                <tr>
                    <td><input type="email" name="email" class="form-control" placeholder="Email address" required
                               autofocus></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><input type="password" name="password" class="form-control" placeholder="Password" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label>Don't have an account<a href="signup.jsp">&nbsp;Signup</a></label></td>
                </tr>
            </form>
        </div>
    </table>
</div>
</body>
</html>

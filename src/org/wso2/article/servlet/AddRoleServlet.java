package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.HttpURLConnection;

public class AddRoleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        HttpSession session = request.getSession();

        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        RestRequest restRequest = new RestRequest();
        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();

        String sendbody = "{ \"role\": \"" + role + "\" }";
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "POST", encodedAuthorization, "application/json", sendbody);

        System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
        response.sendRedirect("add_role.jsp");

    }
}
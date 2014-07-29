package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.HttpURLConnection;


public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String roleIdUser = getServletContext().getInitParameter("roleIdUser");
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String tags = request.getParameter("tags");
        String date_of_birth = request.getParameter("date_of_birth");

        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        RestRequest restRequest = new RestRequest();

        String sendbody = "{\n" +
                "       \"email\": \"" + email + "\",\n" +
                "       \"password\": \"" + password + "\",\n" +
                "       \"first_name\": \"" + first_name + "\",\n" +
                "       \"last_name\": \"" + last_name + "\",\n" +
                "       \"tags\": \"" + tags + "\",\n" +
                "       \"role_id\": \"" + roleIdUser + "\",\n" +
                "       \"date_of_birth\": \"" + date_of_birth + "\"\n" +
                "   }\"}";
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "POST", "application/json", sendbody);
        System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());

        request.setAttribute("signIn", "signInSuccess");
        request.setAttribute("firstName", first_name);
        request.getRequestDispatcher("index.jsp").forward(request, response);


    }

}



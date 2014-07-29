package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.HttpURLConnection;


public class AddArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String url = request.getParameter("url");
        String author = request.getParameter("author");
        String sub_category_id = request.getParameter("subcategory");
        String tags = request.getParameter("tags");
        Object useremail = session.getAttribute("email");
        String email = useremail.toString();
        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        RestRequest restRequest = new RestRequest();

        if(session.getAttribute("encodedAuthorization").equals(null)){
            response.sendRedirect("index.jsp");
        }


        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();

        String sendbody = "{\n" +
                "       \"email\": \"" + email + "\",\n" +
                "       \"title\": \"" + title + "\",\n" +
                "       \"url\": \"" + url + "\",\n" +
                "       \"author\": \"" + author + "\",\n" +
                "       \"sub_category_id\": \"" + sub_category_id + "\",\n" +
                "       \"tags\": \"" + tags + "\"\n" +
                "   }\"}";
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "POST", encodedAuthorization, "application/json", sendbody);
        System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
        response.sendRedirect("view_article.jsp");

    }
}

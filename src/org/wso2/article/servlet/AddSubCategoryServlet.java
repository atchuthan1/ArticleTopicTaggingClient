package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;


/**
 * Created by nilash on 7/27/14.
 */
public class AddSubCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cat = request.getParameter("cat");
        String subcat = request.getParameter("subcat");


        String endpointUrlb = "http://localhost:8080/Tagger/";//getServletConfig().getInitParameter("endpointUrl");
        String endpointUrl = endpointUrlb + "addSubCategory";
        System.out.println("===============" + endpointUrlb + "========");
        RestRequest restRequest = new RestRequest();
        String encodedAuthorization = restRequest.encodedAuthorization("nilash", "1234");
        System.out.println("===============" + encodedAuthorization + "========");
        String sendbody = " {\n" +
                "\"category_id\":" + cat + ",\n" +
                "       \"category_name\": \"" + subcat + "\"\n" +
                "  \n" +
                "       }";
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "POST", encodedAuthorization, "application/json", sendbody);
        System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());


    }
}

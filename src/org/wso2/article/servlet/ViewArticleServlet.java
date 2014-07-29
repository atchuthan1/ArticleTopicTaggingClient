package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

public class ViewArticleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//                String id = request.getParameter("id");
//                if (id.isEmpty()) {
//                    try {
//
//                        URL url = new URL("http://127.0.0.1:8282/Tagger/getArticle");
//                        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//                        conn.setRequestMethod("GET");
//                        BASE64Encoder enc = new sun.misc.BASE64Encoder();
//                        String user = "thenu@mail.com";
//                        String password = "password";
//                        String userpassword = user + ":" + password;
//                        String encodedAuthorization = enc.encode(userpassword.getBytes());
//                        conn.setRequestProperty("Authorization", "Basic " +
//                                encodedAuthorization);
//                        conn.setDoOutput(true);
//
//
//                        BufferedReader br = new BufferedReader(new InputStreamReader(
//                                (conn.getInputStream())));
//
//                        Object output;
//                        System.out.println("Output from Server .... \n");
//                        while ((output = br.readLine()) != null) {
//
//                            System.out.println(output);
//                            //   List<String> categories = get("Role.role.role_id");
//                            //  System.out.println(output.trim());
//                            //  RequestDispatcher dispatcher = request.getRequestDispatcher("view_role.jsp");
//                            //  dispatcher.forward(request,response);
//
//
//                            request.setAttribute("value", output);
//                            request.getRequestDispatcher("view_article.jsp").forward(request, response);
//
//                        }
//
//                        conn.disconnect();
//
//                    } catch (MalformedURLException e) {
//
//                        e.printStackTrace();
//
//                    } catch (IOException e) {
//
//                        e.printStackTrace();
//
//                    }
//                } else {
//
//                    try {
//
//                        URL url = new URL("http://127.0.0.1:8282/Tagger/getUser/" + id);
//                        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//                        conn.setRequestMethod("GET");
//                        BASE64Encoder enc = new sun.misc.BASE64Encoder();
//                        String user = "thenu@mail.com";
//                        String password = "password";
//                        String userpassword = user + ":" + password;
//                        String encodedAuthorization = enc.encode(userpassword.getBytes());
//                        conn.setRequestProperty("Authorization", "Basic " +
//                                encodedAuthorization);
//                        conn.setDoOutput(true);
//
//
//                        BufferedReader br = new BufferedReader(new InputStreamReader(
//                                (conn.getInputStream())));
//
//                        Object output;
//                        System.out.println("Output from Server .... \n");
//                        while ((output = br.readLine()) != null) {
//
//                            System.out.println(output);
//                            //   List<String> categories = get("Role.role.role_id");
//                            //  System.out.println(output.trim());
//                            //  RequestDispatcher dispatcher = request.getRequestDispatcher("view_role.jsp");
//                            //  dispatcher.forward(request,response);
//
//
//                            request.setAttribute("value", output);
//                            request.getRequestDispatcher("view_user.jsp").forward(request, response);
//
//                        }
//
//                        conn.disconnect();
//
//                    } catch (MalformedURLException e) {
//
//                        e.printStackTrace();
//
//                    } catch (IOException e) {
//
//                        e.printStackTrace();
//
//                    }
//                }
//            }

        HttpSession session = request.getSession();
        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        RestRequest restRequest = new RestRequest();

        //todo this code only for check Authorization
        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();

        if (session.getAttribute("encodedAuthorization").toString().equals(null)) {
            response.sendRedirect("index.jsp");
        }

        //todo final system authorization
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "GET", encodedAuthorization);
        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

        String output = br.readLine();
        request.setAttribute("value", output);
        request.getRequestDispatcher("view_article.jsp").forward(request, response);
    }
}




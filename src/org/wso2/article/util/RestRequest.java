package org.wso2.article.util;

import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by atchuthan on 7/25/14.
 */
public class RestRequest {
    HttpURLConnection conn;

    public HttpURLConnection sendJsonRestRequest(String endpointUrl, String httpMethode, String encodedAuthorization) throws IOException {
        return this.sendJsonRestRequest(endpointUrl, httpMethode, encodedAuthorization, null, null);
    }

    public HttpURLConnection sendJsonRestRequest(String endpointUrl, String httpMethode, String contentType, String inputBody) throws IOException {
        return this.sendJsonRestRequest(endpointUrl, httpMethode, null, contentType, inputBody);
    }


    public HttpURLConnection sendJsonRestRequest(String endpointUrl, String httpMethode, String encodedAuthorization, String contentType, String inputBody) throws IOException {
        //Http Connection
        URL url = new URL(endpointUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(httpMethode);
        System.out.println(encodedAuthorization);
        if (encodedAuthorization != null) {
            conn.setRequestProperty("Authorization", "Basic " + encodedAuthorization);
        }

        if (contentType != null) {
            conn.setRequestProperty("Content-Type", contentType);
        }
        conn.setDoOutput(true);

        //http Body
        if (inputBody != null) {
            OutputStream os = conn.getOutputStream();
            os.write(inputBody.getBytes());
            os.flush();
        }
        return conn;
    }

    public String encodedAuthorization(String username, String password) {
        BASE64Encoder enc = new sun.misc.BASE64Encoder();
        String userpassword = username + ":" + password;
        return enc.encode(userpassword.getBytes());
    }
}

package com.example.GCE_Stands;

import ExcelService.StandGenerator;
import Models.Stand;
import com.google.gson.JsonObject;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;


@WebServlet(name = "UploadServlet", value = "/UploadServlet")
public class UploadServlet extends HttpServlet {
    List<String> admins = new ArrayList<String>(
            Arrays.asList("matiasvedeler@gmail.com","andersjohan97@gmail.com","etkarhemit@gmail.com","evensenchristian@gmail.com",
                    "evensleire97@gmail.com","frede.berdal@gmail.com","maggu898@gmail.com","nichlasloneberg@gmail.com","simon.kobbenes@gmail.com"));

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("standsAdded") != null) {
            request.setAttribute("responseMsg", "Stands successfully added");
        } else if(request.getParameter("standAdded") != null){
            request.setAttribute("responseMsg", "Stand successfully added");
        }

         request.getRequestDispatcher("WEB-INF/AdminPage.jsp").forward(request, response);



}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String standName = request.getParameter("standName");

    String lokalt =  "http://localhost:8080/stands/addStand";

    String api = "http://data1.hib.no:9090/expo2021_api_3/create-stand";

        System.out.println(standName);

    //TODO
        if(standName != null){

            URL url = new URL(api);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");

            conn.setRequestProperty("Content-Type", "application/json; utf-8");

            conn.setRequestProperty("Accept", "application/json");

            conn.setDoOutput(true);

            Random random = new Random();

            String randomId = standName.substring(0,2).toUpperCase().replaceAll("\\s+","")+random.nextInt(100);

            JsonObject innerObject = new JsonObject();
            innerObject.addProperty("id",randomId);
            innerObject.addProperty("name",standName);

            String jsonInputString = innerObject.toString();//"{ email : " + email +"," +"value :"+ absRating + "}";

            try(OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            System.out.println(conn.getResponseCode());

        } else  {

            StandGenerator standGenerator = new StandGenerator();

            DiskFileItemFactory factory = new DiskFileItemFactory();

            ServletFileUpload upload = new ServletFileUpload(factory);

            FileItemIterator iter = upload.getItemIterator(request);

            System.out.println(iter.hasNext());
            if (iter.hasNext()) {
                FileItemStream item = iter.next();
                if (item.getName().contains(".xlsx")) {
                    InputStream stream = item.openStream();
                    standGenerator.generateStands(stream);
                }
                response.sendRedirect("UploadServlet?standsAdded");
            }
                  return;
        }


            
    }
}

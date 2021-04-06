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
import java.util.Random;


@WebServlet(name = "UploadServlet", value = "/UploadServlet")
public class UploadServlet extends HttpServlet {
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

    String lokal =  "http://localhost:8080/stands/addStand";

    String api = "http://data1.hib.no:9090/expo2021_prosjekt13/create-stand";


    //TODO
        if(standName != null){

            URL url = new URL(api);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");

            conn.setRequestProperty("Content-Type", "application/json; utf-8");

            conn.setRequestProperty("Accept", "application/json");

            conn.setDoOutput(true);

            Random random = new Random(100);

            String randomId = standName.substring(0,2)+random.nextInt();

            JsonObject innerObject = new JsonObject();
            innerObject.addProperty("id",randomId);
            innerObject.addProperty("name",standName);

            String jsonInputString = innerObject.toString();//"{ email : " + email +"," +"value :"+ absRating + "}";

            try(OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }
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

import Models.Stand;
import Wrappers.StandWrapper;
import com.google.gson.Gson;
import com.google.zxing.NotFoundException;
import com.google.zxing.WriterException;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class Main {
    public static void main(String[] args)
            throws WriterException, IOException,
            NotFoundException {
        System.out.println("Æ Å Ø");

        URL url = new URL("http://localhost:8080/stands/getStands");

        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

        conn.setRequestMethod("GET");

        conn.connect();

        int responsecode = conn.getResponseCode();

        if(responsecode != 200)
            throw new RuntimeException("HttpResponseCode: " +responsecode);
        else {
            String inline = "";
            Scanner sc = new Scanner(url.openStream());
            while (sc.hasNext()) {
                inline += sc.nextLine();
            }
            // System.out.println(inline);
            sc.close();

            StandWrapper standWrapper = new Gson().fromJson(inline, StandWrapper.class);
            for (Stand stand : standWrapper.getListOfStands()) {
                System.out.println(stand.toString());
            }
            System.out.println("Æ Å Ø");
        }
    }
}

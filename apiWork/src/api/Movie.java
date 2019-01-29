package api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Movie {

    public String searchMovie(String keyword) {
        
       String clientId = "Fjl5Cup2oMyXksW3Tq60";
        String clientSecret = "5u3qKNMOwH";
        
        StringBuffer response = new StringBuffer();
        
        try {
           
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text; 
            
            URL url = new URL(apiURL);
            
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            int responseCode = con.getResponseCode();
            
            BufferedReader br;
            
            if(responseCode==200) { 
               
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                
            } else {  
               
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                
            }
            
            String inputLine;
            
            while ((inputLine = br.readLine()) != null) {
               
                response.append(inputLine);
                
            }
            
            br.close();
            
            System.out.println(response.toString());
            
        } catch (Exception e) {
           
            System.out.println(e);
            
        }
        
        return response.toString();
    }
}
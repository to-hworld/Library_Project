package devTmpStore;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import org.springframework.web.bind.annotation.GetMapping;


public class BookUpdate {
	
	@GetMapping(path = "")
	public void bookUpdate() throws UnsupportedEncodingException, MalformedURLException, IOException {
		
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/6270000/dgsmartlib/bestBookList");
        urlBuilder.append("?" + "serviceKey" + "=" + "");
        urlBuilder.append("&" + "pageNo" + "=" + "1");
        urlBuilder.append("&" + "numOfRows" + "=" + "10");
        urlBuilder.append("&" + "code" + "=" + "AB35");
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		
		
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException, MalformedURLException, IOException {
//		
//		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/6270000/dgsmartlib/bestBookList");
//        urlBuilder.append("?" + "serviceKey" + "=" + "");
//        urlBuilder.append("&" + "pageNo" + "=" + "1");
//        urlBuilder.append("&" + "numOfRows" + "=" + "10");
//        urlBuilder.append("&" + "code" + "=" + "AG40");
//        URL url = new URL(urlBuilder.toString());
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.setRequestProperty("Accept", "application/json");
//        System.out.println("성공여부 Response code: " + conn.getResponseCode());
//        BufferedReader rd;
//        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        } else {
//            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//        }
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = rd.readLine()) != null) {
//            sb.append(line);
//        }
//        rd.close();
//        conn.disconnect();
//        
//        Gson gson = new GsonBuilder().setPrettyPrinting().create();
//        JsonElement jsonElement = JsonParser.parseString(sb.toString());
//        String prettyJsonOutput = gson.toJson(jsonElement);
//        
//        System.out.println(prettyJsonOutput);
		
		StringBuilder sb = new StringBuilder();
		BufferedReader r=new BufferedReader(new FileReader("src/main/resources/booklist.json"));
      String line;
      for (int i = 0; i < 10; i++) {
    	  line = r.readLine();
    	  sb.append(line);
	}
     
      r.close();
      
      System.out.println(sb);
      
				
		
	}

}

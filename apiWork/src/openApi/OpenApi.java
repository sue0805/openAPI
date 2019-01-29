package openApi;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApi 
{
	
	public static void main(String[] args)
	{
		OpenApi api = new OpenApi();
		api.getInfo("");
	}
	public String getInfo(String keyword)
	{
		BufferedReader br = null;
		String result = "";
		try
		{
			String urlstr = "http://api.saramin.co.kr/job-search?keywords="+keyword;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			while((line = br.readLine()) != null)
			{
				result = result + line + "\n";
			}
			
			System.out.println(result);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return result;
	}
}

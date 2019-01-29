package api;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.Document.Type;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.LanguageServiceSettings;
import com.google.cloud.language.v1.Sentiment;

public class QuickstartSample {
	public static void main(String[] args) {
		 String jsonPath = "WebContent/WEB-INF/service.json";
		
		 LanguageServiceSettings languageServiceSettings = null;
		 LanguageServiceClient language = null;
		 
		try {
			languageServiceSettings = LanguageServiceSettings.newBuilder()
				.setCredentialsProvider(FixedCredentialsProvider.create(GoogleCredentials.fromStream(new FileInputStream(jsonPath))))
				.build();
			language = LanguageServiceClient.create(languageServiceSettings);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  String text = "공부하기 싫다.";
	      Document doc = Document.newBuilder()
	          .setContent(text).setType(Type.PLAIN_TEXT).build();

	      // Detects the sentiment of the text
	      Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();

	      System.out.printf("Text: %s%n", text);
	      System.out.printf("Sentiment: %s, %s%n", sentiment.getScore(), sentiment.getMagnitude());
	      
	      float score = sentiment.getScore();
	      float magnitude = sentiment.getMagnitude();
	      
	      String emotion = "";
	      
	      if(score <= -0.5) emotion = "아주 나쁨";
	      else if(score <= -0.1) emotion = "나쁨";
	      else if(score <= 0.2) emotion = "그냥 그래";
	      else if(score <= 0.5) emotion = "좋아";
	      else emotion = "아주 좋아";
	      
	      System.out.println(emotion);
	}
}
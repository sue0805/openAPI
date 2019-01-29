package api;

import java.io.FileInputStream;
import java.io.IOException;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.language.v1.Document;
import com.google.cloud.language.v1.LanguageServiceClient;
import com.google.cloud.language.v1.LanguageServiceSettings;
import com.google.cloud.language.v1.Sentiment;
import com.google.cloud.language.v1.Document.Type;

public class Emotion {
	
	public static int getEmotion(String text) {
		// 구글 서비스 계정 키 파일 경로 복사 하셔서 각자 넣으시면 됩니다.
		final String JSONPATH = "C:\\project\\jspProject\\apiWork\\WebContent\\WEB-INF\\service.json";
		
		int emotion = 0;

		LanguageServiceSettings languageServiceSettings = null;
		LanguageServiceClient language = null;

		try {
			languageServiceSettings = LanguageServiceSettings.newBuilder().setCredentialsProvider(
					FixedCredentialsProvider.create(GoogleCredentials.fromStream(new FileInputStream(JSONPATH))))
					.build();
			language = LanguageServiceClient.create(languageServiceSettings);
			
			Document doc = Document.newBuilder()
			          .setContent(text).setType(Type.PLAIN_TEXT).build();

			// Detects the sentiment of the text
			Sentiment sentiment = language.analyzeSentiment(doc).getDocumentSentiment();
			
			System.out.printf("Text: %s%n", text);
			System.out.printf("Sentiment: %s, %s%n", sentiment.getScore(), sentiment.getMagnitude());
			  
			float score = sentiment.getScore();
			  
			if(score <= -0.5) emotion = 0;
			else if(score <= -0.1) emotion = 1;
			else if(score <= 0.41) emotion = 2;
			else if(score <= 0.6) emotion = 3;
			else emotion = 4;
			  
			System.out.println(emotion);
			
		} catch (IOException e) { 
			e.printStackTrace();
		} finally {
			language.close();
		}
		
		return emotion;
	}
}

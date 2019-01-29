package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.Emotion;

public class EmotionHandler implements CommandHandler {
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String text = request.getParameter("say");
		
		Emotion emo = new Emotion();
		
		int emotion = emo.getEmotion(text);
		
		request.setAttribute("emotion", emotion);
		
		return "/WEB-INF/view/emotion.jsp";
		
	}

}

package openApi;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class JobSearch {
	
	public static void main(String[] args) {
		JobSearch j = new JobSearch();
		System.out.println("=======================");
		System.out.println(j.getList("Java"));
	}
	
	public List<Job> getList(String keyword) {
		List<Job> list = new ArrayList<>();
		try {
			//DOM Document 객체 생성하기 위한 메서드
			DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
			//DOM 파서로부터 입력받은 파일을 파싱하도록 요청
			DocumentBuilder parser = f.newDocumentBuilder();
			//XML 파일 지정
			String url = "http://api.saramin.co.kr/job-search?keywords="+keyword;
			Document xmlDoc = null;
//DOM 파서로부터 입력받은 파일을 파싱하도록 요청
			xmlDoc = parser.parse(url);
//루트 엘리먼트 접근
			Element root = xmlDoc.getDocumentElement();
			System.out.println(root.getTagName()); // booklist
//하위 엘리먼트 접근
			NodeList n1 = root.getElementsByTagName("job");
			Node bookNode = n1.item(0);
			Element bookElement = (Element) bookNode;
//속성 접근
			String isbn = bookElement.getAttribute("name");
			System.out.println(isbn); // B001
//텍스트 (노드) 접근
			NodeList bookN1 = bookNode.getChildNodes();
//인덱스 사용시 주의할 것.
//엔터키에 해당하느 부분이 읽힐 수 있다.
//(위 방식 보다는, getElementsByTagName() 을 이용해 접근하는게 좋다.)
			Node titleNode = bookN1.item(1);
			Element titleElement = (Element) titleNode;
			System.out.println(titleElement.getTagName()); // title
			System.out.println(titleElement.getTextContent()); // 자바 기초
//전체 출력
//속성값 : isbn, kind
//엘리먼트 텍스트 값 : title, author, price
			System.out.println("------------------------------------------------------------------");
			for (int i = 0; i < n1.getLength(); i++) {
				Node bNode = n1.item(i);
				Element bElement = (Element) bNode;
//				String is = bElement.getAttribute("isbn");
//				String ki = bElement.getAttribute("kind");
				String title = bElement.getElementsByTagName("position").item(0).getTextContent();
				String name = bElement.getElementsByTagName("company").item(0).getTextContent();
				String link = bElement.getElementsByTagName("url").item(0).getTextContent();
				
				Job job = new Job(name, title, link);
				
				list.add(job);
				
				String str = String.format("%20s %10s %8s", title, name, link);
				System.out.println(str);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		System.out.println(list);
		
		return list;
	}
}
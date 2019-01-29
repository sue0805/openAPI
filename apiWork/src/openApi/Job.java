package openApi;

public class Job {
	private String name;
	private String title;
	private String link;
	
	public Job() {
		super();
	}

	public Job(String name, String title, String link) {
		super();
		this.name = name;
		this.title = title;
		this.link = link;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Job [name=" + name + ", title=" + title + ", link=" + link + "]";
	}
	
	
}

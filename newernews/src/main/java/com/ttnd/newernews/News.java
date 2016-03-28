package com.ttnd.newernews;

public class News {
	private String description;
    private String link;
    private String guid;
    private String pubdate;
    private String title;
    
    public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getGuid() {
		return guid;
	}
	public void setGuid(String guid) {
		this.guid = guid;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	@Override
	public String toString() {
		return "News [description=" + description + ", link=" + link + ", guid=" + guid + ", pubdate=" + pubdate
				+ ", title=" + title + "]";
	}
	

}

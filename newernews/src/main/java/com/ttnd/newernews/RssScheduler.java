package com.ttnd.newernews;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

import org.apache.felix.scr.annotations.*;
import org.apache.sling.jcr.api.SlingRepository;
import org.apache.sling.jcr.resource.JcrResourceUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component(immediate = true)
@Service(java.lang.Runnable.class)
@Property(name = "scheduler.period", longValue = 6000)
public class RssScheduler implements java.lang.Runnable {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Reference
	SlingRepository repository;

	public void run() {
		
		logger.info("News Scheduler");
		Map<String, String> newsMap = new HashMap<String, String>();
		newsMap.put("sports", "http://timesofindia.feedsportal.com/c/33039/f/533921/index.rss");
		newsMap.put("entertainment", "http://timesofindia.feedsportal.com/c/33039/f/533928/index.rss");
		newsMap.put("health", "http://dynamic.feedsportal.com/c/33039/f/533968/index.rss");
		newsMap.put("lifestyle", "http://timesofindia.feedsportal.com/c/33039/f/533929/index.rss");
		newsMap.put("education", "http://timesofindia.feedsportal.com/c/33039/f/533924/index.rss");

		for (String key : newsMap.keySet()) {
			try {
				List<News> newsList = newsGetter(newsMap.get(key));
				nodeCreate(newsList, key);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public List<News> newsGetter(String uri) throws Exception {
		int i = 0;
		List<News> newsList = new ArrayList<>();
		News news = null;
		URL url = new URL(uri);
		InputStream in = url.openStream();
		XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
		XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(in);
		while (xmlEventReader.hasNext()) {
			XMLEvent xmlEvent = xmlEventReader.nextEvent();
			if (xmlEvent.isStartElement()) {
				StartElement startElement = xmlEvent.asStartElement();
				if (startElement.getName().getLocalPart().equals("item")) {
					news = new News();
					i = 1;
				} else if (startElement.getName().getLocalPart().equals("title") && i == 1) {
					xmlEvent = xmlEventReader.nextEvent();
					news.setTitle(xmlEvent.asCharacters().getData());
				} else if (startElement.getName().getLocalPart().equals("description") && i == 1) {
					xmlEvent = xmlEventReader.nextEvent();
					if(xmlEvent.isCharacters()){
                 	   if(xmlEvent.asCharacters().getData().equals("<")){
                 		   int j=1;
                 		   while(j<=9){
                 			   xmlEvent=xmlEventReader.nextEvent();
                 			   j++;
                 		   }
                 	   }
                 		   news.setDescription(xmlEvent.asCharacters().getData());
                    }
				} else if (startElement.getName().getLocalPart().equals("link") && i == 1) {
					xmlEvent = xmlEventReader.nextEvent();
					news.setLink(xmlEvent.asCharacters().getData());
				} else if (startElement.getName().getLocalPart().equals("guid") && i == 1) {
					xmlEvent = xmlEventReader.nextEvent();
					news.setGuid(xmlEvent.asCharacters().getData());
				} else if (startElement.getName().getLocalPart().equals("pubDate") && i == 1) {
					xmlEvent = xmlEventReader.nextEvent();
					news.setPubdate(xmlEvent.asCharacters().getData());
				}
			}
			if (xmlEvent.isEndElement()) {
				EndElement endElement = xmlEvent.asEndElement();
				if (endElement.getName().getLocalPart().equals("item")) {
					newsList.add(news);
					i = 0;
				}
			}
		}
		return (newsList);

	}

	void nodeCreate(List<News> newsList, String newsType) throws RepositoryException {
		Iterator<News> newsIterator = newsList.iterator();
		
		Session session = repository.loginAdministrative(null);
		while (newsIterator.hasNext()) {
			News currentNews = newsIterator.next();
			String nodeName = currentNews.getTitle().replaceAll("[^a-zA-Z0-9\\s]","");
			Node newsNode = JcrResourceUtil.createPath("/content/newernews/" + newsType + "/" + nodeName,
					"", "nt:unstructured", session, true);				
			newsNode.setProperty("title", currentNews.getTitle());
			newsNode.setProperty("description", currentNews.getDescription());
			newsNode.setProperty("uuid", currentNews.getGuid());
			newsNode.setProperty("dateofpublish", currentNews.getPubdate());
			newsNode.setProperty("sling:resourceType", "news/show");
			session.save();
			logger.info("node created");

		}

	}


}


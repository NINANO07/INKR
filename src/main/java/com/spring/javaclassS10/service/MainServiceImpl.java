package com.spring.javaclassS10.service;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontFormatException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kennycason.kumo.CollisionMode;
import com.kennycason.kumo.WordCloud;
import com.kennycason.kumo.WordFrequency;
import com.kennycason.kumo.bg.PixelBoundryBackground;
import com.kennycason.kumo.font.KumoFont;
import com.kennycason.kumo.font.scale.LinearFontScalar;
import com.kennycason.kumo.nlp.FrequencyAnalyzer;
import com.kennycason.kumo.nlp.tokenizer.WhiteSpaceWordTokenizer;
import com.kennycason.kumo.palette.ColorPalette;

@Service
public class MainServiceImpl implements MainService {
	public List<HashMap<String, Object>> getCrwalingEvent() throws IOException {
		
		Connection conn = Jsoup.connect("https://www.globalinterpark.com/en");
		Document document = conn.get();
			
		Elements dailyBest = document.select("div.sc-f3a34356-2.fOuuKO > a");
		
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		
		
		HashMap<String, Object> map = null;
		
		for(Element m : dailyBest) {
			map = new HashMap<String, Object>();
			String title = m.select("div:nth-child(2) > div:nth-child(1)").text();
			String img = m.select("div:nth-child(1) > img").attr("src");
			String period = m.select("div:nth-child(2) > div:nth-child(2)").text();
			String space = m.select("div:nth-child(2) > div:nth-child(3)").text();
			
			map.put("title", title);
			map.put("img", img);
			map.put("period", period);
			map.put("space", space);
			vos.add(map);

		}

		return vos;
	}
	
	public List<HashMap<String, Object>> getCrwalingMusic() throws IOException {
		
		Connection conn = Jsoup.connect("https://www.melon.com/chart/day/index.htm");
		Document document = conn.get();
		
		Elements list50 = document.select("#lst50");
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> map = null;
		
		
		int cnt =0;
		for(Element l : list50) {
			map = new HashMap<String, Object>();
			String title = l.select("td:nth-child(6) > div > div > div.ellipsis.rank01 > span > a").text();
			String img = l.select("td:nth-child(4) > div > a > img").attr("src");
			img = img.substring(0, img.indexOf("/melon/resize/"));
			String artist = l.select("td:nth-child(6) > div > div > div.ellipsis.rank02 > a").text();

			map.put("title", title);
			map.put("img", img);
			map.put("artist", artist);
			vos.add(map);
			cnt++;
			if(cnt >=10) break;

		}

		
		return vos;
	}
	
	public List<HashMap<String, Object>> getCrwalingNews() throws IOException {
		
		Connection conn = Jsoup.connect("https://en.yna.co.kr/mostviewed/index");
		Document document = conn.get();
		
		Elements mostViewed = document.select("div.most-rank > div > ul > li");
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> map = null;
		
		for(Element m : mostViewed) {
			map = new HashMap<String, Object>();
			String title = m.select("article > div > h2").text();
			String img = m.select("article > figure > img").attr("src");
			String tag = m.select("article > div > span.tag").text();
			
			map.put("title", title);
			map.put("img", img);
			map.put("tag", tag);
			vos.add(map);
		}

		return vos;
	}
	
	public List<HashMap<String, Object>> getCrwalingNetflix() throws IOException {
		
		Connection conn = Jsoup.connect("https://www.netflix.com/tudum/top10/south-korea/tv");
		Document document = conn.get();
		
		Elements top10 = document.selectXpath("//*[@id=\"weekly-lists\"]/div/div[2]/div[2]/div/ul/button");
		
		HashMap<String, Object> map = null;
		
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();	
		
		for(Element t : top10) {
			map = new HashMap<String, Object>();
			String img = t.selectXpath("div[3]/div[2]/picture/img").attr("src");
			String title = t.selectXpath("div[3]/div[1]/div[2]/div/p/b").text();
			map.put("title", title);
			map.put("img", img);
			vos.add(map);
		}
		
		return vos;
	}
	
	public List<HashMap<String, Object>> getCrwalingMovie() throws IOException {
		
		Connection conn = Jsoup.connect("http://www.koreanfilm.or.kr/eng/news/boxOffice_Daily.jsp?mode=BOXOFFICE_DAILY");
		Document document = conn.get();
		
		HashMap<String, Object> map = null;

		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		for(int i=1; i <= 10; i++) {
			map = new HashMap<String, Object>();
			String title = document.selectXpath("//*[@id=\"listTable_0_"+i+"\"]/tr/td[3]/p[1]").text();
			String img = document.selectXpath("//*[@id='listTable_0_"+i+"']/tr/td[2]/img").attr("src");
			if(img.length() == 0) {
				img = document.selectXpath("//*[@id='listTable_0_"+i+"']/tr/td[2]/a/img").attr("src");
			}
			img = img.substring(img.indexOf("http://kobis.or.kr"), img.indexOf("&w"));
			img = img.replace("x192", "x289");
			if(title.toLowerCase().trim().equals("escape")) img ="https://kobis.or.kr/common/mast/movie/2024/07/thumb_x289/thn_e7d6eec007b84ed381a4f54d7b33147a.jpg";
			
			String country = document.selectXpath("//*[@id=\"listTable_0_"+i+"\"]/tr/td[3]/p[2]").text();
	
			map.put("title", title);
			map.put("img", img);
			map.put("country", country);
			vos.add(map);
		}
		
		return vos;
	}
				
	public void setWords() throws IOException {
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		
		Connection conn = Jsoup.connect("https://www.koreanculture.org/korea-information-culture-and-the-arts");
		Document document = conn.get();
		String cultureNews = document.select("p").text();

		String str ="";
		int j = 0;
		str += cultureNews+"\n";
		
		
		vos= getCrwalingNews();
		j=10;
		for(HashMap<String, Object> vo : vos) {
			for(int i = 0; i<j ;i++) {
				str += vo.get("title")+"\n";
	    	}
	    	j--;
		}
		
	    vos = getCrwalingEvent();
	    j=5;
	    for(HashMap<String, Object> vo : vos) { 
	    	
	    	for(int i = 0; i<j ;i++) {
	    		String subTitle = vo.get("title").toString();
		    	subTitle = subTitle.replace("〈", "");
		    	subTitle = subTitle.replace("〉", "");
		    	str +=subTitle+"\n";
	    	}
	    	j--;
	    }

		vos= getCrwalingNetflix();
		j=10;
		for(HashMap<String, Object> vo : vos) {
			
	    	for(int i = 0; i<j ;i++) {
	    		String subTitle = vo.get("title").toString();
		    	if(subTitle.contains(":")) {
		    		subTitle=subTitle.substring(0, subTitle.indexOf(":"));
		    	}
		    	subTitle = subTitle.replace(" ", "_");
		    	str +=subTitle+"\n";
	    	}
	    	j--;
	    	
		}
		
		/*
		 * vos= getCrwalingMovie(); j=10; for(HashMap<String, Object> vo : vos) {
		 * 
		 * for(int i = 0; i<j ;i++) { String subTitle = vo.get("title").toString();
		 * subTitle = subTitle.replace(" ", "_"); str +=subTitle+"\n"; } j--;
		 * 
		 * }
		 */

		vos= getCrwalingMusic();
		j=10;
		for(HashMap<String, Object> vo : vos) {
	    	for(int i = 0; i<j ;i++) {
	    		String title = vo.get("title").toString();
	    		if(title.contains("feat")) {
	    			title = title.substring(0, title.indexOf("(feat")-1);
	    		}
	    		title = title.replace(" ", "_");
	    		str += vo.get("artist")+"\n";
				str += title+"\n";
	    	}
	    	j--;
		}

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/main/trendKeyword.txt");
		
		try (FileWriter writer = new FileWriter(realPath)) {
			writer.write(str);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public String wordCloud() throws IOException, FontFormatException {
		setWords();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/main/");
		List<String> stopWordList = new ArrayList<String>();
		
		try (BufferedReader br = new BufferedReader(new FileReader(realPath+"exc_words.txt"))){
			String stopWord;
			while ((stopWord = br.readLine()) != null) {
				stopWordList.add(stopWord);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		FrequencyAnalyzer frequencyAnalyzer = new FrequencyAnalyzer();
		frequencyAnalyzer.setWordFrequenciesToReturn(1000);
		frequencyAnalyzer.setMinWordLength(2);
		frequencyAnalyzer.setWordTokenizer(new WhiteSpaceWordTokenizer());
		frequencyAnalyzer.setStopWords(stopWordList);
		
		
		List<WordFrequency> WordFrequencies = frequencyAnalyzer.load(realPath+"trendKeyword.txt");
		
		Dimension dimension  = new Dimension(1591, 454); 
		WordCloud wordCloud = new WordCloud(dimension, CollisionMode.PIXEL_PERFECT);
		wordCloud.setPadding(2);
		
		wordCloud.setBackground(new PixelBoundryBackground(realPath+"kkk.png")); 
		wordCloud.setBackgroundColor(null);
		wordCloud.setColorPalette(new ColorPalette(new Color(0x957DAD), new Color(0x2C5F2D), new Color(0xB85042), new Color(0x735DA5), new Color(0x20948B), new Color(0x6AB187), new Color(0xFA6775), new Color(0xf525d2), new Color(0xFB6542), new Color(0xff0040), new Color(0x1995AD)));
		wordCloud.setFontScalar(new LinearFontScalar(10, 60));
		
		Font font = Font.createFont(Font.TRUETYPE_FONT, this.getClass().getClassLoader().getResourceAsStream("fonts/NanumGothic-Bold.ttf"));
		
		wordCloud.setKumoFont(new KumoFont(font));
		wordCloud.build(WordFrequencies);
		wordCloud.writeToFile(realPath+"trend.png");
		
		
		
		return "resources/data/main/trend.png";
	}
	
}

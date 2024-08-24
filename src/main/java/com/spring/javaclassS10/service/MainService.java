package com.spring.javaclassS10.service;

import java.awt.FontFormatException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public interface MainService {
	public List<HashMap<String, Object>> getCrwalingEvent() throws IOException;
	
	public List<HashMap<String, Object>> getCrwalingMusic() throws IOException;
	
	public List<HashMap<String, Object>> getCrwalingNews() throws IOException;
	
	public List<HashMap<String, Object>> getCrwalingNetflix() throws IOException;
	
	public List<HashMap<String, Object>> getCrwalingMovie() throws IOException;
	
	public void setWords() throws IOException;
	
	public String wordCloud() throws IOException, FontFormatException;
	
	

}

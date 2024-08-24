package com.spring.javaclassS10.controller;

import java.awt.FontFormatException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.spring.javaclassS10.service.MainService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MainService ms;
	
	@Autowired
	LocaleResolver localeResolver;
	
	@Autowired
	MessageSource messageSource;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 * @throws FontFormatException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(/*@RequestParam( value="lang", defaultValue = "en",  required = false) String lang*/ Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, FontFormatException {
		
		
//		String trendImg = ms.wordCloud();
//				
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		model.addAttribute("trendImg", trendImg );
//		model.addAttribute("locale", locale);
		
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="/", method = RequestMethod.POST)
	public List<HashMap<String, Object>> homePost(String chart) throws IOException {
		
		List<HashMap<String, Object>> vos = new ArrayList<HashMap<String,Object>>();
		
		
		if(chart.equals("news")) vos = ms.getCrwalingNews();
		else if(chart.equals("music")) vos = ms.getCrwalingMusic();
		else if(chart.equals("event")) vos = ms.getCrwalingEvent();
		else if(chart.equals("tvshow")) vos = ms.getCrwalingNetflix();
		else if(chart.equals("movie")) vos = ms.getCrwalingMovie();

		
		return vos;
	}
	
}

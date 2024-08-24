package com.spring.javaclassS10.common;

import java.awt.FontFormatException;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.javaclassS10.service.MainService;
import com.spring.javaclassS10.service.MeetupService;

@Component
public class JavaclassScheduler {
	
	@Autowired
	MainService mainService;
	
	@Autowired 
	MeetupService meetupService;
	
	//@Scheduled(cron = "0 0 0 * * *")
	public void wordCloudScheduler() {
		try {
			mainService.wordCloud();
		} catch (IOException | FontFormatException e) {
			e.printStackTrace();
		}
	}
	
	@Scheduled(cron = "0 0 0 * * *")
	public void meetUpExpired() {
		meetupService.updateMeetUpExpired();

	}
	
}

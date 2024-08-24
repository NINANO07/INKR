package com.spring.javaclassS10.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.dao.MeetupDAO;
import com.spring.javaclassS10.vo.EventListVO;
import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MeetupStatusVO;
import com.spring.javaclassS10.vo.MeetupVO;

@Service
public class MeetupServiceImpl implements MeetupService {
	@Autowired
	MeetupDAO meetupDAO;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaclassProvide javaclassProvide;

	@Override
	public List<EventListVO> getEventList(String pageNo, String language, String date, String searchStr) {
		
		List<EventListVO> eventVos = new ArrayList<EventListVO>();
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		String eventStartDate = now.format(dtf);
		
		if(!date.equals("")) {
			eventStartDate =date.replace("-", "");
		}
		
		String serviceKey = "jLQ3XPtJwZ6cVNYL8e7shSXcGtRhs%2Bl96IS5VpOfnB0LAwb79sluQZo%2FBMd3NU3faggS%2BNXACFtmTUWbepEGIQ%3D%3D";
		String apiUrlBase = "http://apis.data.go.kr/B551011/"+language+"Service1/searchFestival1?serviceKey=" + serviceKey + "&_type=json"
		        + "&MobileOS=ETC&MobileApp=AppTest&eventStartDate=" + eventStartDate;

		try {
		    String apiUrlCount = apiUrlBase + "&numOfRows=1";
		    URL urlCount = new URL(apiUrlCount);
		    BufferedReader brCount = new BufferedReader(new InputStreamReader(urlCount.openStream(),"UTF-8"));
		    StringBuffer sbCount = new StringBuffer();
		    String tempStr = null;

		    while((tempStr = brCount.readLine()) != null){
		        sbCount.append(tempStr);								
		    }
		    brCount.close();

		    ObjectMapper objectMapper = new ObjectMapper();
		    JsonNode rootCount = objectMapper.readTree(sbCount.toString());
		    int total = rootCount.path("response").path("body").path("totalCount").asInt();

		    String apiUrl = apiUrlBase + "&numOfRows=" + total;
		    URL url = new URL(apiUrl);
		    BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		    StringBuffer sb = new StringBuffer();

		    while((tempStr = br.readLine()) != null){
		        sb.append(tempStr);								
		    }
		    br.close();

		    SimpleDateFormat iF = new SimpleDateFormat("yyyyMMdd");
		    SimpleDateFormat oF = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);

		    JsonNode root = objectMapper.readTree(sb.toString());
		    JsonNode items = root.path("response").path("body").path("items").path("item");

		    if (items.isArray()) {
		        for (JsonNode item : items) {
		            EventListVO event = new EventListVO();
		            if(searchStr.equals("")) {
		            	event.setContentId(item.path("contentid").asText());
			            if((item.path("title").asText().contains("("))){
			            	event.setTitle(item.path("title").asText().substring(0,item.path("title").asText().indexOf("(")));
			            } else event.setTitle(item.path("title").asText());
			            event.setFirstImage(item.path("firstimage").asText());
			            event.setAddr(item.path("addr1").asText());
			            event.setEventStartDate(oF.format(iF.parse(item.path("eventstartdate").asText())));
			            event.setEventEndDate(oF.format(iF.parse(item.path("eventenddate").asText())));
			            event.setMapX(item.path("mapx").asText());
			            event.setMapY(item.path("mapy").asText());
			            if(!item.path("firstimage").asText().isEmpty()) eventVos.add(event);
			            else continue;
		            }
		            else {
		            	if(item.path("title").asText().toLowerCase().contains(searchStr.toLowerCase())) {
		            		event.setContentId(item.path("contentid").asText());
				            if((item.path("title").asText().contains("("))){
				            	event.setTitle(item.path("title").asText().substring(0,item.path("title").asText().indexOf("(")));
				            } else event.setTitle(item.path("title").asText());
				            event.setFirstImage(item.path("firstimage").asText());
				            event.setAddr(item.path("addr1").asText());
				            event.setEventStartDate(oF.format(iF.parse(item.path("eventstartdate").asText())));
				            event.setEventEndDate(oF.format(iF.parse(item.path("eventenddate").asText())));
				            event.setMapX(item.path("mapx").asText());
				            event.setMapY(item.path("mapy").asText());
				            if(!item.path("firstimage").asText().isEmpty()) eventVos.add(event);
				            else continue;
		            	} else continue;
		            }  
		        }
		    }
            
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return eventVos;
	}

	@Transactional
	@Override
	public void meetupCreate(MeetupVO vo) {
		meetupDAO.meetupCreate(vo);
		meetupDAO.setMeetupMember(vo.getIdx(),vo.getHost());
		meetupDAO.updateStatus(vo.getIdx(),"Meetup is created by "+vo.getHost(), false);
		meetupDAO.pointUpgrade(vo.getIdx(), vo.getHost(),100, "plus");
		memberService.pointUpdate(vo.getHost(), 100, "plus");
		int clubPoint = meetupDAO.getClubPoint(vo.getHost());
		javaclassProvide.update(vo.getHost(), clubPoint, "meetup");
		
	}

	@Override
	public MeetupVO getMeetup(String mapX, String mapY) {
		return meetupDAO.getMeetup(mapX, mapY);
	}

	@Override
	public List<MeetupVO> getAllMeetup(String member, String mid) {
		return meetupDAO.getAllMeetup(member, mid);
	}

	@Override
	public MeetupVO getMeetupList(int idx) {
		return meetupDAO.getMeetupList(idx);
	}

	@Override
	public MeetupMemberVO getMeetupMember(int idx, String mid) {
		return meetupDAO.getMeetupMember(idx, mid) ;
	}

	@Transactional
	@Override
	public void setMeetupMember(int idx, String mid) {
		meetupDAO.setMeetupMember(idx,mid);
		meetupDAO.updateStatus(idx,"Hi! "+ mid, false);
		meetupDAO.pointUpgrade(idx, mid, 50, "plus");
		memberService.pointUpdate(mid, 50, "plus");
		int clubPoint = meetupDAO.getClubPoint(mid);
		javaclassProvide.update(mid, clubPoint, "meetup");
	}

	@Override
	public List<MeetupMemberVO> getMeetupMemberAll(int idx) {
		
		return meetupDAO.getMeetupMemberAll(idx);
	}

	@Override
	public void setMeetupWaiting(int idx, String mid) {
		meetupDAO.setMeetupWaiting(idx, mid);
		
	}

	@Override
	public int getWaitingList(int idx, String mid) {
		return meetupDAO.getWaitingList(idx, mid);
	}

	@Override
	public List<MeetupStatusVO> getMeetupStatus(int idx) {
		return meetupDAO.getMeetupStatus(idx);
	}

	@Override
	public void updateStatus(int idx, String content, boolean notice) {
		meetupDAO.updateStatus(idx, content, true);	
	}

	@Override
	public void deleteNotice(int idx) {
		meetupDAO.deleteNotice(idx);
		
	}

	@Override
	public void cancelMeetup(int meetupIdx, String mid) {
		meetupDAO.cancelMeetup(meetupIdx, mid);
		meetupDAO.updateStatus(meetupIdx, "Bye! "+ mid , false);	
		memberService.pointUpdate(mid, 100, "use");
		meetupDAO.pointUpgrade(meetupIdx, mid, 100, "use");
		int clubPoint = meetupDAO.getClubPoint(mid);
		javaclassProvide.update(mid, clubPoint, "meetup");
		
		List<MeetupMemberVO> wvos = meetupDAO.getWaitedList(meetupIdx);
		if(!wvos.isEmpty()) {
			meetupDAO.setMeetupMember(meetupIdx, wvos.get(0).getMid());
			meetupDAO.deleteWaitedList(meetupIdx, wvos.get(0).getMid());
			meetupDAO.updateStatus(meetupIdx,"Hi! "+ wvos.get(0).getMid(), false);
		}
	}

	@Override
	public int getCanceledList(int idx, String mid) {
		return meetupDAO.getCanceledList(idx, mid) ;
	}

	@Override
	public List<MeetupMemberVO> getWaitedList(int idx) {
		// TODO Auto-generated method stub
		return  meetupDAO.getWaitedList(idx);
	}

	@Override
	public String[] updateMeetUpEdit(MeetupVO vo) {
		MeetupVO curVO = meetupDAO.getMeetupList(vo.getIdx());
		List<MeetupMemberVO> wvos = meetupDAO.getWaitedList(vo.getIdx());
		int curMemNumber = curVO.getMemNumber();
		
		meetupDAO.updateMeetUpEdit(vo);

		if(!curVO.getMeetingDate().equals(vo.getMeetingDate())) {
			meetupDAO.updateStatus(vo.getIdx(), "The meeting date has been changed ("+vo.getMeetingDate() +")",false);	
		}
		if(!curVO.getMeetingTime().equals(vo.getMeetingTime())) {
			meetupDAO.updateStatus(vo.getIdx(), "The meeting time has been changed ("+vo.getMeetingTime() +")",false);	
		}
		if(curMemNumber != vo.getMemNumber()) {
			meetupDAO.updateStatus(vo.getIdx(), "The Group limt has increased to "+vo.getMemNumber(),false);	
		}
		

		int listNumber = Math.min(wvos.size(), (vo.getMemNumber()-curMemNumber));  
		String[] setupMemberIds = new String[listNumber];
		
		if(curMemNumber != vo.getMemNumber() && !wvos.isEmpty()) {
			for(int i = 0; i <listNumber; i++){
				meetupDAO.setMeetupMember(vo.getIdx(), wvos.get(i).getMid());
				meetupDAO.deleteWaitedList(vo.getIdx(), wvos.get(i).getMid());
				meetupDAO.updateStatus(vo.getIdx(),"Hi! "+ wvos.get(i).getMid(), false);
				
				setupMemberIds[i] = wvos.get(i).getMid();
			}
		}
		return setupMemberIds;
		
	}

	@Override
	public void deleteMeetUp(int idx, String mid) {
		meetupDAO.deleteMeetUp(idx);
		memberService.pointUpdate(mid, 100, "use");
		int clubPoint = meetupDAO.getClubPoint(mid);
		javaclassProvide.update(mid, clubPoint, "meetup");
	}

	@Override
	public MeetupMemberVO getMemberDetail(String mid) {
		return meetupDAO.getMemberDetail(mid);
	}

	@Override
	public List<MeetupVO> getMeetupListAll() {
		return meetupDAO.getMeetupListAll();
	}

	@Override
	public void updateMeetUpExpired() {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		meetupDAO.updateMeetUpExpired(strToday);
		
	}

}

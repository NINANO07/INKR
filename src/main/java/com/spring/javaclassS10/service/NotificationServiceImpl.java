package com.spring.javaclassS10.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS10.dao.BookclubDAO;
import com.spring.javaclassS10.dao.NotificationDAO;
import com.spring.javaclassS10.vo.NotificationVO;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	NotificationDAO notificationDAO;
	
	@Autowired
	BookclubDAO bookclubDAO;
	
	@Override
	public int setNotification(String section, String sort, int superIdx, int reIdx, String to, String from) {
		NotificationVO vo = new NotificationVO();
		vo.setSection(section);
		vo.setSort(sort);
		vo.setSuperIdx(superIdx);
		/* int aidx = bookclubDAO.getQboardIdx(reIdx); */
		vo.setReIdx(reIdx);
		vo.setToMid(to);
		vo.setFromMid(from);
		
		notificationDAO.setNotification(vo);
		
		return vo.getIdx();
		
	}

	@Override
	public NotificationVO getNotification(int idx) {
		return notificationDAO.getNotification(idx);
	}

	@Override
	public List<NotificationVO> getNotreadMessage(String mid, String section) {
		return notificationDAO.getNotreadMessage(mid, section);
	}

	@Override
	public void updateStatus(String mid, String section) {
		notificationDAO.updateStatus(mid, section);		
	}

}

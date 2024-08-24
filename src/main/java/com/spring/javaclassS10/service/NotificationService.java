package com.spring.javaclassS10.service;

import java.util.List;

import com.spring.javaclassS10.vo.NotificationVO;

public interface NotificationService {

	int setNotification(String section, String sort, int superIdx, int reIdx, String to, String from);

	NotificationVO getNotification(int idx);

	List<NotificationVO> getNotreadMessage(String mid, String section);

	void updateStatus(String mid, String section);

}

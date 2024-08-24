package com.spring.javaclassS10.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS10.vo.NotificationVO;

public interface NotificationDAO {

	void setNotification(@Param("vo") NotificationVO vo);

	NotificationVO getNotification(@Param("idx") int idx);

	List<NotificationVO> getNotreadMessage(@Param("mid") String mid,@Param("section") String section);

	void updateStatus(@Param("mid")String mid, @Param("section") String section);

	
}

package com.spring.javaclassS10.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring.javaclassS10.service.NotificationService;
import com.spring.javaclassS10.vo.NotificationVO;

@Component
public class Notification extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	private static List<WebSocketSession> userList = new ArrayList<>();

    private Map<String, WebSocketSession> userMap = new HashMap<>();
    
    @Autowired NotificationService notificationService;
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("소켓 연결");
        userList.add(session);

        String mid = userId(session);
        if (mid != null) {
            userMap.put(mid, session);
        } else {
            logger.warn("User ID is null for session: " + session.getId());
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String msg = message.getPayload();
        if (StringUtils.isNotEmpty(msg)) {
            String[] ms = msg.split("/");
            if (ms != null && ms.length == 6) {
                String section = ms[0];
            	String sort = ms[1];
            	int superIdx = ms[2] == "" ? 0 : Integer.parseInt(ms[2]);
            	int reIdx = Integer.parseInt(ms[3]);
                String to = ms[4];
                String from = ms[5];
                
                
                int idx = notificationService.setNotification(section, sort, superIdx, reIdx, to, from);
                WebSocketSession toSession = userMap.get(to);

                if (toSession != null) {
                	Gson gson = new Gson();
                	NotificationVO nVo = notificationService.getNotification(idx);
                    TextMessage tMsg = new TextMessage(gson.toJson(nVo));
                    toSession.sendMessage(tMsg);
                }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        userList.remove(session);
        String mid = userId(session);
        if (mid != null) {
            userMap.remove(mid);
        } else {
            logger.warn("User ID is null for session: " + session.getId());
        }
    }

    private String userId(WebSocketSession session) {
        Map<String, Object> attributes = session.getAttributes();
        String mid = (String) attributes.get("sMid");

        if (mid == null) {
            logger.warn("Session ID used as user ID for session: " + session.getId());
            return session.getId();
        }
        return mid;
    }
}
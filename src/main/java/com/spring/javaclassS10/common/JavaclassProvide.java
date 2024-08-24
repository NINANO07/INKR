package com.spring.javaclassS10.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.service.MemberService;

@Service
public class JavaclassProvide {
	
	@Autowired
	MemberService memberService;
	
	public void writeFile(MultipartFile fName, String SFileName, String urlPath) throws IOException {
		HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/"+urlPath+"/");
		
		FileOutputStream fos = new FileOutputStream(realPath + SFileName);
		if(fName.getBytes().length != -1) {
			fos.write(fName.getBytes());
		}
		fos.flush();
		fos.close();
	}
	
	public void deleteFile(String photo, String urlPath) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/"+urlPath+"/");
		
		File file = new File(realPath + photo);
		if(file.exists()) file.delete();
	}
	
	public String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH)+1;
		fileName += cal.get(Calendar.DATE);
		fileName += "_"+oFileName;

		return fileName;
	}
	
	public String fileUpload(MultipartFile file, String mid, String photo, String path) {
		String oFileName = file.getOriginalFilename();
		String sFileName = mid+"_"+RandomStringUtils.randomAlphanumeric(2)+"_"+saveFileName(oFileName);
		
		try {
			writeFile(file, sFileName, path);
			
			if(!photo.equals("noimage.jpg")) deleteFile(photo, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sFileName;
	}
   
	public void update(String mid, int point, String sort) {
		int level = memberService.getLevel(mid, sort);
	
		if(point > 300 && level == 0) {
			memberService.updateLevel(mid, 1, sort);
		}
		else if(point > 500 && level == 1) {
			memberService.updateLevel(mid, 2, sort);
		}
		else if(point > 700 && level == 2) {
			memberService.updateLevel(mid, 3, sort);
		}
	}
}

package com.niit.ecom.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	public static void upload(MultipartFile imageFile){
		String folderToUpload = "/resources/images/";
		
		HttpServletRequest request = null;
		
		String fileName = imageFile.getOriginalFilename();
		String realPath = request.getServletContext().getRealPath(folderToUpload);
		if(!new File(realPath).exists()){
			new File(realPath).mkdirs();
		}
		
		String filePath = realPath + fileName;
		File destination = new File(filePath);
		try {
			imageFile.transferTo(destination);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	/*
	 * public static void upload(String path, MultipartFile file, String
	 * fileName) { if (!file.isEmpty()) { try { byte[] bytes = file.getBytes();
	 * 
	 * // Creating directory to store files File dir = new File(path); if
	 * (!dir.exists()) { dir.mkdirs(); } File serverFile = new
	 * File(dir.getAbsolutePath() + File.separator + fileName);
	 * BufferedOutputStream stream = new BufferedOutputStream(new
	 * FileOutputStream(serverFile)); stream.write(bytes);
	 * 
	 * stream.close(); } catch (Exception e) { e.printStackTrace(); } } }
	 */
}

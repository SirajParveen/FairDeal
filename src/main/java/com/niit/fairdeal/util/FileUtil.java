package com.niit.fairdeal.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	private static Logger log = LoggerFactory.getLogger(FileUtil.class);
	//private static String workingDir = System.getProperty("user.dir");//D:\Softwares\IDE\eclipse-jee-neon-RC3-win32-x86_64\eclipse
	  
	
  //"D:\\ShoppingCart\\Images";
	public static void upload(String path, MultipartFile file, String fileName) {
		log.debug("Starting of the method upload");
		log.debug("Current Path :" + Paths.get("").toFile()	);
		/*Util.removeComman(fileName);*/
		if (!file.isEmpty()) 
		{
			
			try
			{
			byte[] bytes = file.getBytes();

			// Creating the directory to store file
			File dir = new File(path);
			if (!dir.exists())
				dir.mkdirs(); //Make/create directory
			
			// Create the file on server
			//D:\\ShoppingCart\\Images\\fileName.jpg
			File serverFile = new File(dir.getAbsolutePath()
					+ File.separator + fileName);
			
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			log.info("Server File Location="
					+ serverFile.getAbsolutePath());
		} catch (Exception e) 
			{
			e.printStackTrace();
		}}
		
		log.debug("Ending of the method upload");
	}
}
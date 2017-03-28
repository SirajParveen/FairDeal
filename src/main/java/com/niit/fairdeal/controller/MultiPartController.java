package com.niit.fairdeal.controller;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartController 
{
	public static void upload(String path,MultipartFile file,String filename)
	{
		if(!file.isEmpty())
		{
			System.out.println("File is not Empty");
			InputStream inputStream=null;
			OutputStream outputStream=null;
			if(file.getSize()>0)
			{
				try
				{
					file.transferTo(new File(path));
				}
				catch (Exception e)
				{
					e.printStackTrace();
					System.out.println("Error"+e);
					
				}
				finally 
				{
					try
					{
						outputStream.close();
						inputStream.close();
					}
					catch (Exception e)
					{
						e.printStackTrace();
						System.out.println("Error"+e);
					}
				}
			}
		}
	}
	public static void deleteimage(String path,String filename)
	{
		if (Files.exists(Paths.get(path+ filename))) {
			try {
				Files.delete(Paths.get(path + filename));

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("File unable to delete", e);
			}
		}
	}

}

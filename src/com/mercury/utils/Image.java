package com.mercury.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

public class Image {
	public static void save(MultipartFile image,String uploadPath){		
		 try {
			  // Creating the directory to store file
			 File dir = new File(uploadPath);
			 if (!dir.exists()){
                 dir.mkdirs();
			 }
             // Create the file on server
			 File file=new File(dir,image.getOriginalFilename());
			 if (!file.exists()){
				 byte[] bytes=image.getBytes();
				 BufferedOutputStream stream = new BufferedOutputStream(
	                     new FileOutputStream(file));
	             stream.write(bytes);
	             stream.close();            
				System.out.println(file.getAbsolutePath());
			 }
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error in imageUpload");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void save(MultipartFile[] images, String path){
		for(MultipartFile image : images){
			save(image, path);
		}
	}
}

package com.srm.repg.web;
 

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.srm.repg.form.FileParams;
import com.srm.repg.form.UploadForm;
import com.srm.repg.model.User;
import com.srm.repg.service.ExcelReadDataService;

@Controller
public class ExcelReadController {
		
	@Value("${uploadfilePath}")
	private String uploadPath;
	 

	@RequestMapping(value = "/readAddress", method = RequestMethod.GET)
	public ModelAndView listAddess() {
		return new ModelAndView("readAddress", "command", new FileParams());
	}

	@Autowired
	ExcelReadDataService excelReadDataService;

	@RequestMapping(value = "/address/list/{id}", method = RequestMethod.GET)
	public String listemployee(Model model, @PathVariable(name = "id") String id) {
		System.out.println("Date:" + id);
		model.addAttribute("fileParams", excelReadDataService.getListOfData(id));
		//return "listAddress";
		return "readAddress";
	}

	@RequestMapping(value = "/address/readAddress", method = RequestMethod.POST)
	public String readAddress(@ModelAttribute("fileParams") FileParams param, ModelMap model,BindingResult result,RedirectAttributes redirectAttributes) {
		// Print input date
	    boolean error = false;
	    if(param.getDateVal().isEmpty()){
	    	result.rejectValue("dateVal", "error.firstName");
	    	redirectAttributes.addFlashAttribute("message",
	                "Date Should not be empty");
	        error = true;
	    }
		return "redirect:/address/list/" + param.getDateVal() + "";
	}
	@PostMapping("/upload")
	public String fileUpload(@ModelAttribute UploadForm form,HttpServletResponse response,HttpServletRequest request,Model model ){
		try{
			Cookie[] cookies = request.getCookies();
			String filePath = "";
			
			if(form.getDateVal()==null || form.getDateVal().isEmpty()){
				model.addAttribute("error", "date will not be empty");
				return "upload";
			}

			if(form.getFilePath()==null || form.getFilePath().isEmpty()){
				model.addAttribute("error", "local file path not be empty");
				return "upload";
			}
			if(form.getFilePath() !=null){
				if(form.getFilePath().contains("\\")){
					model.addAttribute("error", "local file path \\ should not be allowed");
					return "upload";
				}
				
			}
						
			for (Cookie aCookie : cookies) {
			String name = aCookie.getName();

			if (name.equals("filePath")) {
			filePath = aCookie.getValue();

			break;
			}

			}
			if(filePath.isEmpty()){
			String name = "filePath";
			String value = form.getFilePath();
			Cookie cookie = new Cookie(name, value);
			response.addCookie(cookie);
			}
			boolean fileExist=false;
			if(form.getFiles() != null){
			for (MultipartFile file : form.getFiles()) {
			if(file.isEmpty()){
			fileExist=false;
			continue;
			}else{
				fileExist=true;
			}
			}
			}
			if(fileExist){
			 this.saveUploadedFiles(form);
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");//date null chk
			    String datefolder=sdf2.format(sdf.parse(form.getDateVal())).replace("-", "");
				String sourcefile=	filePath+"/"+datefolder;
				String destinationFile=	uploadPath+"\\"+datefolder;
				boolean mesg = moveFileDestination(sourcefile,destinationFile);//return message for succes
				if(mesg){
					model.addAttribute("message", "File Copied Successfully");
				}
				else{ model.addAttribute("message", "Copy Error");}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "upload";
	}
	
	private boolean moveFileDestination(String sourcefile,String destinationFile){
		
		try{
			
			File source=new File(sourcefile);
			File destination=new File(destinationFile);		
			FileUtils.copyDirectory(source, destination);			
		}catch(Exception e ){
			
			
		}
		return true;
	}

	private String saveUploadedFiles(UploadForm form) throws IOException, ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");//date null chk
	    String date=sdf2.format(sdf.parse(form.getDateVal())).replace("-", "");
	    
		// Make sure directory exists!
		//String date=form.getDateVal().replace("-", "");

		File uploadDir = new File(uploadPath+date);
		if(!uploadDir.exists()){
		uploadDir.mkdirs();
		}

		StringBuilder sb = new StringBuilder();

		for (MultipartFile file : form.getFiles()) {

		if (file.isEmpty()) {
		continue;
		}
		String fileName = file.getOriginalFilename();
		String extension="";
		int index = fileName.lastIndexOf('.');
		if(index > 0) {
		extension = fileName.substring(index + 1);
		}
		if(!extension.isEmpty()){
		if(extension.equalsIgnoreCase("pdf")){
		String[]files=fileName.split("_");
		String folderName="";
		if(files.length>0){
		folderName=files[0];
		}
		File uploadPdfDir = new File(uploadPath+date+"/"+folderName);
		if(!uploadPdfDir.exists()){
		uploadPdfDir.mkdirs();
		}
		String uploadFilePath = uploadPath+date+"/"+folderName+ "/" + file.getOriginalFilename();

		byte[] bytes = file.getBytes();
		Path path = Paths.get(uploadFilePath);
		Files.write(path, bytes);

		}else{
		String uploadFilePath = uploadPath+date + "/" + file.getOriginalFilename();

		byte[] bytes = file.getBytes();
		Path path = Paths.get(uploadFilePath);
		Files.write(path, bytes);
		}
		}
		}
		return sb.toString();
		}
	
/*	@PostMapping("/upload") // //new annotation since 4.3
	public String fileUpload(@RequestParam("files") MultipartFile[] files,@ModelAttribute("fileParams") FileParams param, RedirectAttributes redirectAttributes,BindingResult validationResult) {

		
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
			ImageIcon icon = new ImageIcon("src/main/webapp/resources/assets/images/logo.png"); //object for displaying a custom icon
		    final JPanel panel = new JPanel(); // the object for the pop-up
		    int test_for_commit_to_challenge = JOptionPane.showConfirmDialog(panel, "Do you want to proceed with the challenge?", "WARNING!",
		    		JOptionPane.OK_CANCEL_OPTION, JOptionPane.WARNING_MESSAGE, icon); //this displays the pop-up and returns an integer depending on what the user clicks
		    System.out.println("test int is " + test_for_commit_to_challenge);
		    if (test_for_commit_to_challenge == 2) {
		    		//System.out.println("cancelled");
		    	return "redirect:uploadAdd";
		    }
			
		}
		try {
			String outFilePath = uploadPath+param.getDateVal()+"/";
			File directory = new File(outFilePath);
			if (!directory.exists()) {
				directory.mkdirs();
			} else {
			}
			// Get the file and save it somewhere
			byte[] bytes = file.getBytes();
			Path path = Paths.get(outFilePath + file.getOriginalFilename());
			Files.write(path, bytes);

			redirectAttributes.addFlashAttribute("message",
					"You successfully uploaded '" + file.getOriginalFilename() + "'");

		} catch (IOException e) {
			e.printStackTrace();
		}
		 for(MultipartFile file:files){
			 if(file.isEmpty()){
			 redirectAttributes.addFlashAttribute("message",
		                "File Should not be empty");
			 }

			 try{
			 String outFilePath = uploadPath+param.getDateVal()+"/";
				File directory = new File(outFilePath);
				if (!directory.exists()) {
					directory.mkdirs();
				} else {
				}
				// Get the file and save it somewhere
				byte[] bytes = file.getBytes();
				Path path = Paths.get(outFilePath + file.getOriginalFilename());
				Files.write(path, bytes); 
			 }catch(Exception e){
				 e.printStackTrace();
			 }
		 }
		return "redirect:/uploadstatus";
	}*/
	
	 @GetMapping("/uploadstatus")
	    public String uploadStatus() {
	        return "upload";
	    }

	 @GetMapping("/uploadAdd")
	    public String uploadAdd() {
	        return "upload";
	    }
	  	      		  	 	
	 
	@RequestMapping(value = "/download/{filename}", method = RequestMethod.GET )				 		    
	public ResponseEntity downloadFileFromLocal(@PathVariable(name = "filename") String fileName) throws UnsupportedEncodingException {
		    	String[] filePath =fileName.split("_");		 
			
			String folder1 = "";
			String folder2 = "";
			String fileName1 = "";
						
			if(filePath.length > 0){
				folder1=filePath[0];
				folder2=filePath[1];
				fileName1=filePath[1]+"_"+filePath[2]+"_"+filePath[3];
			}
		 
			 Path path = Paths.get(uploadPath+"\\"+folder1+"\\"+folder2+"\\"+fileName1+".pdf");
		    	Resource resource = null;
		    	try {
		    		
		    		resource = new UrlResource(path.toUri());
		    	} catch (MalformedURLException e) {
		    		e.printStackTrace();
		    	}
		    	//String fileNm = URLEncoder.encode(fileName, "UTF-8");
		    	return ResponseEntity.ok()
		    			.contentType(MediaType.parseMediaType("application/octet-stream"))
		    			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + ""+ fileName+".pdf" + "\"")
		    			.body(resource);		    	
		    }
}

 
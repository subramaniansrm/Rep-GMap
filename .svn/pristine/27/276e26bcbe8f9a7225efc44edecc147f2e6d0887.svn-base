package com.srm.repg.web;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.srm.repg.constants.DateUtil;
import com.srm.repg.form.UserVO;
import com.srm.repg.service.UserActionService;

@Controller
public class UserAction {
	
	@Autowired
    private UserActionService userService;
	
	@GetMapping("/user/getAllUser")
	
	public String listUser(Model model) {
		model.addAttribute("user", userService.getAllUsers());
		return "userList";
	}

	
	@GetMapping("/openSave")
	public String saveUser(Model model) {

		model.addAttribute("user",new UserVO());
		return "saveUser";
	}

	@PostMapping("/add")
	public String addUser(@ModelAttribute("user") UserVO user) throws Exception {
		System.out.println("Add user API");
		String encryptedPassword = null;
		String encrytPassword = encrypt(user.getPassword());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		encryptedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encryptedPassword);
		System.out.println("encrypted Password" + encrytPassword);
		/*UserVO user = new UserVO();
		String fn = request.getParameter("firstName");
		String mn = request.getParameter("middleName");
		user.setMiddleName(mn);
		String ln = request.getParameter("lastName");
		user.setLastName(ln);
		String address = request.getParameter("currentAddress");
		user.setCurrentAddress(address);
		String phone = request.getParameter("phoneNumber");
		user.setPhoneNumber(phone);
		String email = request.getParameter("emailId");
		user.setEmailId(email);
		String pswd = request.getParameter("password");
		String dycryptedPassword = null;
		try {
			dycryptedPassword = CodeSecurity.encrypt(pswd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		user.setPassword(dycryptedPassword.toString());
		String username = request.getParameter("username");
		user.setUsername(username);
		user.setFirstName(fn);
		*/
		user.setActive(true);
		user.setDeleteFlag(false);
		user.setCreatedBy(1);
		user.setCreatedDate(DateUtil.getCurrentDate());
		user.setUpdateBy(1);
		user.setUpdatedDate(DateUtil.getCurrentDate());
		
		userService.saveUser(user);
		return "redirect:/user/getAllUser";
		//response.sendRedirect("/rep/user/getAllUser");
	}

	
	
	public static String encrypt(String value) throws Exception {
		byte[] encodedBytes = Base64.getEncoder().encode(value.getBytes());
		return new String(encodedBytes);
	}
	@PostMapping("/update")
	public String updateUser(@ModelAttribute("user") UserVO user) throws IOException {
		
	/*	if(user.getPassword()!=null){
			String encryptedPassword = null;
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			encryptedPassword = passwordEncoder.encode(user.getPassword());
			user.setPassword(encryptedPassword);
			
		}*/
		
		
		user.setUpdateBy(1);
		user.setUpdatedDate(DateUtil.getCurrentDate());
		userService.updateUser(user);
		return "redirect:/user/getAllUser";
	}

	@GetMapping("/openUpdate")
	public String showEditForm(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("userId"));
		UserVO user = userService.getUser(id);
		String encryptedPassword= null;
	
		user.setPassword(encryptedPassword);
		
		System.out.println(user.getFirstName());
		model.addAttribute("u", user);
		return "updateUser";
	}

	@GetMapping("/openView")
	public String showViewForm(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("userId"));
		UserVO user1 = userService.getUser(id);
		System.out.println(user1.getFirstName());
		model.addAttribute("u", user1);
		return "viewUser";
	}

	@GetMapping("/delete")
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserVO user = new UserVO();
		Integer id = Integer.parseInt(request.getParameter("userId"));

		user.setUserId(id);
		user.setDeleteFlag(true);
		userService.deleteUser(user);
		user.setUpdateBy(1);
		user.setUpdatedDate(DateUtil.getCurrentDate());
		response.sendRedirect("/user/getAllUser");
	}
	
	
	

}

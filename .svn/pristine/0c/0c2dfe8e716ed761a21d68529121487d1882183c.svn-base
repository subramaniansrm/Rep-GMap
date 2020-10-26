package com.srm.repg.service;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.srm.repg.dao.UserDao;
import com.srm.repg.entity.UserEntity;
import com.srm.repg.form.UserVO;
@Component
public class UserActionService {
	
	
private static final Logger logger = LogManager.getLogger(UserActionService.class);
	
	@Autowired
	UserDao userDao;
	
	@Transactional
	public List<UserVO> getAllUsers() {
		List<UserEntity> userEntityList =  userDao.getAllUsers();
		System.out.println("Lisiting User");
		
		List<UserVO> userList = new ArrayList<UserVO>();
		 for (UserEntity userEntity : userEntityList) {
			 UserVO user = new UserVO();
	        	BeanUtils.copyProperties(userEntity, user);
	        	userList.add(user);
			}
	        return userList;
	        
	}  
	
	
	@Transactional
	public void saveUser(UserVO user) {
		
	    UserEntity userEntity = new UserEntity();
	        
	        BeanUtils.copyProperties(user, userEntity);
			userDao.saveUser(userEntity);
		}


		@Transactional
		public UserVO getUser(int id) {
			UserEntity userEntity = userDao.findUserById(id);
			UserVO user = new UserVO();
			 BeanUtils.copyProperties(userEntity, user);
			return user;
		}

		@Transactional
		public void updateUser(UserVO user) {
			UserEntity userEntity = userDao.findUserById(user.getUserId());
			
			 BeanUtils.copyProperties(user, userEntity);
			 userDao.saveUser(userEntity);
		}


		
		@Transactional
		public void deleteUser(UserVO user) {
			
			UserEntity userEntity = userDao.findUserById(user.getUserId());
			
			 BeanUtils.copyProperties(user, userEntity);
			 userDao.saveUser(userEntity);
		}

	 

}
